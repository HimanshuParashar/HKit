//
//  UIApplication.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/05/92.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit
//import SlideMenuControllerSwift
import SafariServices

public extension UIApplication {
    
    public static var appName: String {
        get {
            let mainBundle = Bundle.main
            let displayName = mainBundle.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
            let name = mainBundle.object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String
            return displayName ?? name ?? "Unknown"
        }
    }
    
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
