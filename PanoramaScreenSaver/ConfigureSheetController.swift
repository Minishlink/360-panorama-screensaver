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
    
    @IBOutlet var window: NSWindow!
    
    override init()
    {
        super.init()
        
        let myBundle = Bundle(for: ConfigureSheetController.self)
        myBundle.loadNibNamed("ConfigureSheet", owner: self, topLevelObjects: nil)
    }
    
    @IBAction func closeConfigureSheet(_ sender: NSButton)
    {
        window.sheetParent!.endSheet(window, returnCode: (sender.tag == 1) ? NSModalResponseOK : NSModalResponseCancel)
    }
}
