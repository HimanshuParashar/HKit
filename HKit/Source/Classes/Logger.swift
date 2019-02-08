//
//  Logger.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/07/07.
//  Copyright © 2019 HP. All rights reserved.
//

import Foundation


/**
 Log the given message in the system log.
 
 ```swift
 import HKit
 ...
 
 Logger.log("Log any items")
 ```
 
 */
public class Logger {
    /**
     Writes the textual representations of the given items into the standard output.
     
     ```swift
     import HKit
     ...
     
     Logger.log("Log any items")
     ```
     
     - Parameters:
        - items: Zero or more items to print.
     
     - Returns: *Items*.
     - Note: This function works when DEBUG mode is active. [Know more](https://stackoverflow.com/questions/24003291/ifdef-replacement-in-the-swift-language)
     - seealso:  `Logger.debugLog("Log any items")`

     */
    
    public static func log<T>(_ items: T) {
        
        #if DEBUG
        
        print(items)
        
        #else
        
        #endif
        
    }
    
    /**
     Writes the textual representations of the given items into the standard output.
     
     ```swift
     import HKit
     ...
     
     Logger.debugLog("Log any items")
     ```
     
     - Parameters:
        - items: Zero or more items to print.
        - file: file name to print.
        - line: line name to print.
        - function: function name to print.
     
     - Returns: *Items* with current time, file name, line name and function name.
     - Note: This function works when DEBUG mode is active. [Know more](https://stackoverflow.com/questions/24003291/ifdef-replacement-in-the-swift-language)
     - seealso:  `Logger.log("Log any items")`
     
     */
    
    public static func debugLog<T>(_ items: T, file: String = #file, line: Int = #line, function: String = #function) {
        
        #if DEBUG
        
        let time = Date().string(to: "dd MMM yyyy hh:mm a")
        let filename = "File : \(file.lastPathComponent)"
        let onMethod = "Method : \(function)"
        let ofLine = "Line: \(line)"
        
        print("""
            
            \(time)
            -----------------------
            \(filename)
            \(onMethod)
            \(ofLine)
            
            \(items)
            ******************************
            """)
        
        #else
        
        #endif
        
    }
    
}
