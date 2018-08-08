import Foundation
import UIKit
import MediaPlayer

class VolumeView:BVolumeView {
    
    public let progressView = UIView()
    public let progressBackground = UIView()
    private let icon = UIImageView()
    private var rightMargin = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    override func show() {
        progressView.alpha = 1.0
        progressBackground.alpha = 0.5
        icon.alpha = 1.0
    }
    
    override func hide() {
        progressView.alpha = 0.0
        progressBackground.alpha = 0.0
        icon.alpha = 0.0
    }
    
    override func updateWithVolume(volume: Float) {
        icon.image = volume >= 0.0625 ? #imageLiteral(resourceName: "ic_volume") : #imageLiteral(resourceName: "ic_volume_mute")
        rightMargin.constant = progressBackground.bounds.size.width * CGFloat(volume)
    }
}

extension VolumeView{
    func setupUI(){
        // setup base parameters
        self.layer.cornerRadius = 2.0
        self.setVolumeThumbImage(UIImage(), for: .normal)
        self.setMaximumVolumeSliderImage(UIImage(), for: .normal)
        self.setMinimumVolumeSliderImage(UIImage(), for: .normal)
        self.showsRouteButton = false
        self.tintColor = .clear
        
        // icon
        self.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        icon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 15).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        icon.image = #imageLiteral(resourceName: "ic_volume")
        
        let container = UIView()
        self.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        container.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        container.leftAnchor.constraint(equalTo: self.icon.rightAnchor, constant: 2).isActive = true
        
        // setup progress view
        container.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        progressView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0).isActive = true
        progressView.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 0).isActive = true
        rightMargin = progressView.rightAnchor.constraint(equalTo: progressView.leftAnchor, constant: 0)
        rightMargin.isActive = true
        progressView.layer.cornerRadius = 2.0

        // setup progress background
        container.addSubview(progressBackground)
        progressBackground.layer.cornerRadius = 2.0
        progressBackground.translatesAutoresizingMaskIntoConstraints = false
        progressBackground.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        progressBackground.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0).isActive = true
        progressBackground.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 0).isActive = true
        progressBackground.rightAnchor.constraint(equalTo: container.rightAnchor, constant: 0).isActive = true
    }
}





























