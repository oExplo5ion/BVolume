import Foundation
import UIKit
import MediaPlayer

class BVolumeView:MPVolumeView{
    /**
     * Gets called each time when system status bar has been changed.
     */
    func setStyle(style:UIStatusBarStyle){}
    
    func updateWithVolume(volume:Float){}
    
    /**
     * Called when view should be visible
     */
    func show(){}
    
    /**
     * Called when view should be hidden
     */
    func hide(){}
}
