//
//  ValidationRules.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/05/92.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

public class ValidationRules: NSObject {

    public static func isBlank(_ object: Any) -> Bool {
        
        if object is UITextField {
            
            let text = (object as! UITextField).text!.trim
            if text.isEmpty {
                return true
            }
        } else if object is UITextView {
            
            let text = (object as! UITextView).text.trim
            if text.isEmpty {
                return true
            }
        } else if object is String {
            
            let text = (object as! String).trim
            if text.isEmpty {
                return true
            }
        }
        return false
    }
}
