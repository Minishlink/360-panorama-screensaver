//
//  AppDelegate.swift
//  PanoramaScreenSaverApp
//
//  Created by Louis Lagrange on 19/02/2017.
//  Copyright © 2017 Louis Lagrange. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    lazy var screenSaverView = PanoramaScreenSaverView(frame: NSZeroRect, isPreview: false)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let screenSaverView = screenSaverView {
            screenSaverView.frame = (window.contentView?.bounds)!;
            window.contentView?.addSubview(screenSaverView);
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        
    }
}
