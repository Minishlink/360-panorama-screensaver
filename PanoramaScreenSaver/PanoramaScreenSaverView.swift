//
//  PanoramaScreenSaverView.swift
//  PanoramaScreenSaverView
//
//  Created by Louis Lagrange on 19/02/2017.
//  Copyright © 2017 Louis Lagrange. All rights reserved.
//

import ScreenSaver
import WebKit

class PanoramaScreenSaverView: ScreenSaverView {
    var webView: WKWebView!
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        
        if (isPreview) {
            self.scaleUnitSquare(to: NSMakeSize(0.25, 0.25))
            initWebView(frame: CGRect(x: 0, y: 0, width: 1280, height: 800));
            return;
        }
        
        if (frame.width != 0) {
            let ratioPerformance = CGFloat(1.25);
            let newFrame = CGRect(x: 0, y: 0, width: frame.width/ratioPerformance, height: frame.height/ratioPerformance);
            // alternate monitors have a frame where the origin is not set to 0 by default
            self.scaleUnitSquare(to: NSMakeSize(ratioPerformance, ratioPerformance))
            initWebView(frame: newFrame);
        }
    }
    
    func initWebView (frame: NSRect) {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        webConfiguration.preferences.javaEnabled = false
        webConfiguration.preferences.plugInsEnabled = false
        webView = WKWebView(frame: frame, configuration: webConfiguration)
        self.addSubview(webView)
        
        // TODO investigate websiteDataStore to store pictures
        
        let urlpath = Bundle(for: type(of: self)).resourcePath! + "/PanoramaWebView/index.html";
        let url = URL(fileURLWithPath: urlpath)
        webView.load(URLRequest(url: url))
    }
    
    override func viewWillMove(toSuperview newSuperview: NSView?) {
        #if APP
        initWebView(frame: (newSuperview?.frame)!)
        #endif
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func animateOneFrame() {
        super.stopAnimation()
    }
    
    override func hasConfigureSheet() -> Bool {
        return false
    }
    
    override func configureSheet() -> NSWindow? {
        return nil
    }
}
