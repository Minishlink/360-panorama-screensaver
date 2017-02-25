//
//  DefaultsManager.swift
//  PanoramaScreenSaver
//
//  Created by Louis Lagrange on 25/02/2017.
//  Copyright © 2017 Louis Lagrange. All rights reserved.
//
import ScreenSaver

class DefaultsManager {
    var defaults: UserDefaults
    
    init() {
        let identifier = Bundle(for: DefaultsManager.self).bundleIdentifier
        defaults = ScreenSaverDefaults(forModuleWithName: identifier!)! as UserDefaults
    }
    
    var performanceRatio: CGFloat {
        set(new) {
            defaults.set(new, forKey: "PerformanceRatio")
        }
        get {
            let v = defaults.float(forKey: "PerformanceRatio")
            return v > 0 ? CGFloat(v) : 0.8
        }
    }
}
