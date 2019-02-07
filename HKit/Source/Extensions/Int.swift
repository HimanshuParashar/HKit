//
//  Int.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/07/07.
//  Copyright © 2019 HP. All rights reserved.
//

import Foundation

public extension Int {
    public var degreesToRadians: Double { return Double(self) * .pi / 180 }
}

public extension FloatingPoint {
    public var degreesToRadians: Self { return self * .pi / 180 }
    public var radiansToDegrees: Self { return self * 180 / .pi }
}
