//
//  Array.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/07/07.
//  Copyright © 2019 HP. All rights reserved.
//

import Foundation

public extension Array {
    
    // Serialize Dictionary into JSON
    public var toJSONData: Data? {
        guard
            let jsonData = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            else { return nil }
        return jsonData
    }
    
    // Serialize Dictionary into String
    public var toJSONString: String? {
        guard
            let jsonData = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted),
            let jsonStr = String(data: jsonData, encoding: .utf8)
            else { return nil }
        return jsonStr
    }
    
}
