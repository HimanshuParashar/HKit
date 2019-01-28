//
//  UITableViewButtonDelegate.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/05/92.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

@objc public protocol UITableViewButtonDelegate: class {
    /**
     Returns the button and cell reference
     */
    @objc optional func didTap(_ sender: Any, ofCell cell: UITableViewCell)
    @objc optional func didTap(_ sender: Any, ofHeader header: UITableViewHeaderFooterView)
}
