//
//  UIApplication.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/07/07.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

public extension UIApplication {
    
    /// Returns the app's detail's
    public static var appDetails: String {
        
        guard let version = appVersion,
            let build = appBuild
            else { return "" }
        
        return "Welcome, You're using \(appName) of Version: \(version) and Build \(build)."
    }
    
    /// Returns the app's name
    public static var appName: String {
        let mainBundle = Bundle.main
        let displayName = mainBundle.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
        let name = mainBundle.object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String
        return displayName ?? name ?? ""
    }
    
    /// Returns the app's version number
    public static var appVersion: String? {
        let mainBundle = Bundle.main
        let version = mainBundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        return version
    }
    
    /// Return the app's build number
    public static var appBuild: String? {
        let mainBundle = Bundle.main
        let buildVersion = mainBundle.object(forInfoDictionaryKey: "CFBundleVersion") as? String
        return buildVersion
    }

    /// Return app's bundle ID
    public static var appBundleID: String? {
        return Bundle.main.bundleIdentifier
    }
    
    /// Returns true if DEBUG mode is active. [Know more](https://stackoverflow.com/questions/24003291/ifdef-replacement-in-the-swift-language)
    
    public static var isDebug: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    /// Returns the app's visible View Controller
    public static var visibleViewController: UIViewController? {
        
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else {
            return nil
        }
        
        return getVisibleViewController(rootViewController)
    }
    
    private static func getVisibleViewController(_ viewController: UIViewController?) -> UIViewController? {
        
        if let nav = viewController as? UINavigationController {
            return getVisibleViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return getVisibleViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return getVisibleViewController(presented)
        }
        return viewController
    }

}
