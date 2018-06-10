import Foundation
import UIKit
import MediaPlayer

class VolumeView:BVolumeView {
    
    public let progressView = UIView()
    private var rightMargin = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    override func updateWithVolume(volume: Float) {
        rightMargin.constant = bounds.size.width * CGFloat(volume)
    }
}

extension VolumeView{
    func setupUI(){
        // setup base parameters
        self.clipsToBounds = true
        self.layer.cornerRadius = 2.0
        self.setVolumeThumbImage(UIImage(), for: .normal)
        self.setMaximumVolumeSliderImage(UIImage(), for: .normal)
        self.setMinimumVolumeSliderImage(UIImage(), for: .normal)
        self.showsRouteButton = false
        self.tintColor = .clear
        
        // setup progress view
        self.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        progressView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        progressView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        rightMargin = progressView.rightAnchor.constraint(equalTo: self.leftAnchor, constant: 0)
        rightMargin.isActive = true
    }
}




























