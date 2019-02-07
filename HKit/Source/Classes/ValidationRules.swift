//
//  ValidationRules.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/07/07.
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
    
    public static func isValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let range = email.trim.range(of: emailRegEx, options:.regularExpression)
        let result = range != nil ? true : false
        return !result
    }
    
    public static func isValid(phoneNumber: String, _ max: Int = 10) -> Bool {
        
        //let phoneRegEx = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneRegEx = "^\\d{\(max)}$"
        let range = phoneNumber.range(of: phoneRegEx, options:.regularExpression)
        let result = range != nil ? true : false
        return !result
    }
    
    public static func isValid(url: String) -> Bool {
        
        //var urlRegEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        //let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[urlRegEx])
        //var urlTest = NSPredicate.predicateWithSubstitutionVariables(predicate)
        //return predicate.evaluateWithObject(stringURL)
        
        let urlRegEx = "((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let range = url.range(of: urlRegEx, options:.regularExpression)
        let result = range != nil ? true : false
        return !result
    }
    
    public static func isValidRange(_ string: String, range: ClosedRange<Int>) -> Bool {
        // check the String is between 6 and 20 characters Ex: 6...20
        if !(range ~= string.trim.count) {
            return false
        }
        
        return true
    }
    
    public static func isValidRange(_ string: String, range: PartialRangeThrough<Int>) -> Bool {
        // check the String is between 6 and 20 characters Ex: ...20
        if !(range ~= string.trim.count) {
            return false
        }
        
        return true
    }
    
    public static func isValidRange(_ string: String, range: PartialRangeFrom<Int>) -> Bool {
        // check the String is between 6 and 20 characters Ex: 6...
        if !(range ~= string.trim.count) {
            return false
        }
        
        return true
    }
}
