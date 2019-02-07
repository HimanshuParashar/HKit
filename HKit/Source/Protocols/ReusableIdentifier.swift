//
//  ReusableIdentifier.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/07/07.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

public protocol ReusableIdentifier: class {
    static var identifier: String { get }
    static var nib: UINib { get }
}

public extension ReusableIdentifier {
    public static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    public static var identifier: String {
        return String(describing: self)
    }
}
