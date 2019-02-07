//
//  UIRefreshControl.swift
//  HKit
//
//  Created by Himanshu Parashar on 07/07/07.
//  Copyright © 2019 HP. All rights reserved.
//

import UIKit

public extension UIRefreshControl {
    
    ///Begin Refreshing Manually
    public func beginRefreshingManually() {
        if let scrollView = superview as? UIScrollView , self.isRefreshing == false {
            scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y - self.frame.size.height), animated: true)
        }
        self.beginRefreshing()
    }
    
    ///End Refreshing Manually
    public func endRefreshingManually() {
        if let scrollView = superview as? UIScrollView {
            scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y + self.frame.size.height), animated: true)
        }
        self.endRefreshing()
    }
}
