//
//  CAGradientLayer.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/07/07.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

public extension CAGradientLayer {
    
    public convenience init(frame: CGRect, colors: [UIColor]) {
        self.init()
        self.frame = frame
        self.colors = colors.map{$0.cgColor}
        startPoint = CGPoint(x: 0, y: 0.5)
        endPoint = CGPoint(x: 1.0, y: 0.5)
    }
    
    public var createGradientImage: UIImage? {
        
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
}
