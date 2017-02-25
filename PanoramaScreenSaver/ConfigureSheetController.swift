//
//  ConfigureSheetController.swift
//  PanoramaScreenSaver
//
//  Created by Louis Lagrange on 25/02/2017.
//  Copyright © 2017 Louis Lagrange. All rights reserved.
//

import ScreenSaver

class ConfigureSheetController: NSObject {
    static var sharedInstance = ConfigureSheetController()
    var defaultsManager = DefaultsManager()

    @IBOutlet var window: NSWindow!
    @IBOutlet var performanceRatioSlider: NSSlider?
    
    override init()
    {
        super.init()
        
        let myBundle = Bundle(for: ConfigureSheetController.self)
        myBundle.loadNibNamed("ConfigureSheet", owner: self, topLevelObjects: nil)
        
        performanceRatioSlider!.floatValue = Float(defaultsManager.performanceRatio)
    }
    
    @IBAction func updateDefaults(sender: AnyObject) {
        defaultsManager.performanceRatio = CGFloat(performanceRatioSlider!.floatValue)
    }
    
    @IBAction func closeConfigureSheet(_ sender: NSButton)
    {
        window.sheetParent!.endSheet(window, returnCode: (sender.tag == 1) ? NSModalResponseOK : NSModalResponseCancel)
    }
}
