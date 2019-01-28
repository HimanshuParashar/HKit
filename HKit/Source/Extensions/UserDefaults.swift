//
//  UserDefaults.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/05/92.
//  Copyright © 2019 HP. All rights reserved.
//

import Foundation

public extension UserDefaults {
    
    /*************************************************************/
    //MARK:- Clear All UserDefaults Values
    /*************************************************************/
    public static func clearAllAppUserDefaults() {
        
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
}
