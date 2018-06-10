import Foundation
import MediaPlayer

class BVolume{
    
    public static let shared = BVolume()
    
    // MARK: Fields
    /**
     * Volume view whic will be presented to the user instead of default system view.
     */
    public var view:BVolumeView = BVolumeView()
    
    /**
     * If true status bar will be hidden on each volume changed call.
     */
    public var hidesStatusBar = false
    
    /**
     * Status bar hide duration value in seconds.
     */
    public var hideDuration: Double = 1.0
    
    // MARK: Closures
    /**
    Gets called each time when volume has been changed.
    **It will not be called if volume has reached max/min value.**
    */
    public var onVolumeChanged:(_ volume:Float) -> Void = { _ in }
    
    /**
     * Gets called when volume value is equal to 1.0.
     */
    public var maxVolumeReached:() -> Void = {}
    
    /**
     * Gets called when volume value is equal to 0.0.
     */
    public var minVolumeReached:() -> Void = {}
    
    private var workItem = DispatchWorkItem(block: {})
    private var statusBarStyle = UIApplication.shared.statusBarStyle
    
    // MARK: Funcs
    private init() {}
    
    /**
     * Creates observer which handles system volume change.
     */
    public func start(window: UIWindow){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(volumeChanged(notification:)),
                                               name: NSNotification.Name(rawValue: "AVSystemController_SystemVolumeDidChangeNotification"),
                                               object: nil)
        view.isHidden = true
        window.addSubview(view)
    }
    
    /**
     * Fires when system volume has been changed.
     */
    @objc private func volumeChanged(notification: Notification){
        let volume = notification.userInfo!["AVSystemController_AudioVolumeNotificationParameter"] as! Float
        
        // call status bar update if current view's style is not valid
        if self.statusBarStyle != UIApplication.shared.statusBarStyle {
            self.statusBarStyle = UIApplication.shared.statusBarStyle
            view.setStyle(style: UIApplication.shared.statusBarStyle)
        }
        
        // hide sttaus bar and show it again when duration has passed
        if self.hidesStatusBar {
            workItem.cancel()
            UIApplication.shared.isStatusBarHidden = true
            workItem = DispatchWorkItem(block: {
                self.view.isHidden = true
                UIApplication.shared.isStatusBarHidden = false
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + self.hideDuration, execute: workItem)
        }
        
        view.isHidden = false
        // notify about volume change
        if volume == 1.0 {
            view.updateWithVolume(volume: volume)
            maxVolumeReached()
            return
        }else if volume == 0.0 {
            view.updateWithVolume(volume: volume)
            minVolumeReached()
            return
        }
        view.updateWithVolume(volume: volume)
        onVolumeChanged(volume)
    }
    
}















