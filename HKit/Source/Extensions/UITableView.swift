//
//  UITableView.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/05/92.
//  Copyright © 2019 HP. All rights reserved.
//


import UIKit

public extension UITableView {
    
    /**
     Displays or hides a label in the background of the table view.
     
     - parameter message:    The String message to display. The message is hidden
     if `nil` is provided.
     */
    public func setBackgroundMessage(_ message: String?, color: UIColor = UIColor.lightGray) {
        if let message = message {
            // Display a message when the table is empty
            let messageLabel = UILabel()
            messageLabel.text = message
            //messageLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
            messageLabel.font = UIFont.systemFont(ofSize: 14)
            messageLabel.textColor = color
            messageLabel.textAlignment = .center
            messageLabel.numberOfLines = 0
            messageLabel.sizeToFit()
            
            self.backgroundView = messageLabel
            self.separatorStyle = .none
        } else {
            self.backgroundView = nil
            self.separatorStyle = .singleLine
        }
    }
}

public extension UITableViewCell {

    func showSeparator() {
        DispatchQueue.main.async {
            self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func hideSeparator() {
        DispatchQueue.main.async {
            self.separatorInset = UIEdgeInsets(top: 0, left: self.bounds.size.width, bottom: 0, right: 0)
        }
    }
}
