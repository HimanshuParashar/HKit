//
//  ConstantDevices.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/07/07.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

public struct Device {

    public static let screenWidth = (((UIApplication.shared.statusBarOrientation == UIInterfaceOrientation.portrait) || (UIApplication.shared.statusBarOrientation == UIInterfaceOrientation.portraitUpsideDown)) ? UIScreen.main.bounds.size.width : UIScreen.main.bounds.size.height)
    public static let screenHeight = (((UIApplication.shared.statusBarOrientation == UIInterfaceOrientation.portrait) || (UIApplication.shared.statusBarOrientation == UIInterfaceOrientation.portraitUpsideDown)) ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.width)
    
    public static let screenMaxLength = (max(screenWidth, screenHeight))
    public static let screenMinLength = (min(screenWidth, screenHeight))
    public static let isiPhone4orLess = (isiPhone && screenMaxLength < 568.0)
    public static let isiPhone5 = (isiPhone && screenMaxLength == 568.0)
    public static let isiPhone6 = (isiPhone && screenMaxLength == 667.0)
    public static let isiPhone6P = (isiPhone && screenMaxLength == 736.0)
    
    // Device informations
    public static let model = UIDevice.current.model
    public static let localizedModel = UIDevice.current.localizedModel

    public static let systemName = UIDevice.current.systemName
    public static let systemVersion = UIDevice.current.systemVersion
    
    // Device screen specifications / interface idiom
    public static var isIPad: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    
    public static var isiPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }
}

public extension Device {
    
    public static var isSimulator: Bool {
        if #available(iOS 9, *) {
            return ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] != nil
        } else {
            return UIDevice.current.model == "iPhone Simulator"
        }
    }
}
