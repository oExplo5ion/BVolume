//
//  AppDelegate.swift
//  BVolume
//
//  Created by Mac on 6/9/18.
//  Copyright © 2018 Aleksey Robul. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        BVolume.shared.stop()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        let volumeView = VolumeView(frame: CGRect(x: 15, y: 20, width: 60, height: 5))
        volumeView.progressView.backgroundColor = .white
        volumeView.progressBackground.backgroundColor = .white
        volumeView.progressBackground.alpha = 0.5
        BVolume.shared.view = volumeView
        BVolume.shared.hidesStatusBar = true
        BVolume.shared.start(window: UIApplication.shared.keyWindow!)
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

