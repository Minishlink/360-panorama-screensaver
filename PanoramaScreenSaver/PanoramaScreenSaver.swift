//
//  PanoramaScreenSaverView.swift
//  PanoramaScreenSaverView
//
//  Created by Louis Lagrange on 19/02/2017.
//  Copyright © 2017 Louis Lagrange. All rights reserved.
//

import ScreenSaver

class PanoramaScreenSaverView: ScreenSaverView {
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func startAnimation() {
        super.startAnimation()
    }
    
    override func stopAnimation() {
        super.stopAnimation()
    }
    
    override func draw(_ rect: NSRect) {
        let context: CGContext = NSGraphicsContext.current()!.cgContext
        context.setFillColor(NSColor.white.cgColor);
        context.setAlpha(1);
        context.fill(rect);
    }
    
    override func animateOneFrame() {
        
    }
    
    override func hasConfigureSheet() -> Bool {
        return false
    }
    
    override func configureSheet() -> NSWindow? {
        return nil
    }
}
