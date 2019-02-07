//
//  Dictionary.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/07/07.
//  Copyright © 2019 HP. All rights reserved.
//

import Foundation

public extension Dictionary {
    
    private mutating func merge(with dictionary: [Key: Value]) {
        dictionary.forEach { updateValue($1, forKey: $0) }
    }
    
    public func merged(with dictionary: [Key: Value]) -> [Key: Value] {
        var dict = self
        dict.merge(with: dictionary)
        return dict
    }
    
    
    // Checks if a key exists
    public func has(key: Key) -> Bool {
        return index(forKey: key) != nil
    }

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

