//
//  String.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/07/07.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

public extension String {
    
    public var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    public var string: NSString {
        return self as NSString
    }
    
    public var fileExtension: String {
        return string.pathExtension
    }
    
    public var lastPathComponent: String {
        return string.lastPathComponent
    }
    
    public var asURL: URL? {
        
        guard
            let trimmed = self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
            let url = URL(string: trimmed)
            else {
                return nil
        }
        return url
    }
    
}
