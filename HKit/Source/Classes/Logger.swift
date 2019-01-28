//
//  Logger.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/05/92.
//  Copyright © 2019 HP. All rights reserved.
//

import Foundation


/**
 Log the given message in the system log.
 
 Logger.log("Log any items")
 ``
 */
public class Logger {
    /**
     Writes the textual representations of the given items into the standard output.
     
     Logger.log("Log any items")
     ```
     
     - Parameters:
        - items: Zero or more items to print.
     
     - Returns: *Items*.
     - Note: This function works when DEBUG mode is on. <https://stackoverflow.com/questions/24003291/ifdef-replacement-in-the-swift-language>
     
     */
    
    public static func log<T>(_ items: T) {
        
        #if DEBUG
        
        print(items)
        
        #else
        
        #endif
        
    }
}
