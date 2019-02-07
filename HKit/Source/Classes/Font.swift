//
//  UIFont.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/07/07.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

// Usage Examples
/*
 let system12            = Font(.system, size: .standard(.h5)).instance
 let robotoThin20        = Font(.installed(.RobotoThin), size: .standard(.h1)).instance
 let robotoBlack14       = Font(.installed(.RobotoBlack), size: .standard(.h4)).instance
 let helveticaLight13    = Font(.custom("Helvetica-Light"), size: .custom(13.0)).instance
 */


public struct Font {
    
    public var type: FontType
    public var size: FontSize
    
    public init(_ type: FontType, size: FontSize) {
        self.type = type
        self.size = size
    }
    
    public enum FontType {
        
        case installed(FontName)
        case custom(String)
        case system
        case systemBold
        case systemItatic
        case systemWeighted(weight: Double)
        case monoSpacedDigit(size: Double, weight: Double)
    }
    
    public enum FontSize {
        
        case standard(StandardSize)
        case custom(Double)
        
        var value: Double {
            switch self {
            case .standard(let size):
                return size.rawValue
            case .custom(let customSize):
                return customSize
            }
        }
    }
    
    public enum FontName: String {
        
        case bold        = "HelveticaNeue-Bold"
        case light       = "HelveticaNeue-Light"
        case medium      = "HelveticaNeue-Medium"
        case regular     = "HelveticaNeue"
        case semiBold    = "HelveticaNeue-SemiBold"
    }

    public enum StandardSize: Double {
        case h1 = 20.0
        case h2 = 18.0
        case h3 = 16.0
        case h4 = 14.0
        case h5 = 12.0
        case h6 = 10.0
    }

}

public extension Font {
    
    public var instance: UIFont {
        
        var instanceFont: UIFont!
        switch type {
        case .custom(let fontName):
            guard let font =  UIFont(name: fontName, size: CGFloat(size.value)) else {
                fatalError("\(fontName) font is not installed, make sure it added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .installed(let fontName):
            guard let font =  UIFont(name: fontName.rawValue, size: CGFloat(size.value)) else {
                fatalError("\(fontName.rawValue) font is not installed, make sure it added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .system:
            instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value))
        case .systemBold:
            instanceFont = UIFont.boldSystemFont(ofSize: CGFloat(size.value))
        case .systemItatic:
            instanceFont = UIFont.italicSystemFont(ofSize: CGFloat(size.value))
        case .systemWeighted(let weight):
            if #available(iOS 8.2, *) {
                instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value),
                                                 weight: UIFont.Weight(rawValue: CGFloat(weight)))
            } else {
                // Fallback on earlier versions
                fatalError("system Weighted is available from iOS 8.2")
            }
        case .monoSpacedDigit(let size, let weight):
            if #available(iOS 9.0, *) {
                instanceFont = UIFont.monospacedDigitSystemFont(ofSize: CGFloat(size),
                                                                weight: UIFont.Weight(rawValue: CGFloat(weight)))
            } else {
                // Fallback on earlier versions
                fatalError("system Weighted is available from iOS 9.0")
            }
        }
        return instanceFont
    }
    
    /// Logs all available fonts from iOS SDK and installed custom font
    public static func logAllAvailableFonts() {
        for family in UIFont.familyNames {
            Logger.log("\(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                Logger.log("   \(name)")
            }
        }
    }

}
