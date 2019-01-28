//
//  String.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/05/92.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

public extension String {
    
    public var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
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
