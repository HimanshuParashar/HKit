//
//  Date.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/07/07.
//  Copyright © 2019 HP. All rights reserved.
//

import Foundation

public extension Date {
    
    // MARK: Get Date String
    
    /**
     Convert the date to provided format.
     
     - Parameters:
     - toFormat:    Provide the date string converted format.
     - UTC:         Provide UTC Bool value.
     
     - Returns: A new converted Date and String.
     */
    public func string(to format: String) -> String {
        
        let outFormatter = DateFormatter()
        outFormatter.locale = Locale(identifier: "en_US")
        outFormatter.dateFormat = format
        let dateString = outFormatter.string(from: self)
        
        return dateString
    }
}

