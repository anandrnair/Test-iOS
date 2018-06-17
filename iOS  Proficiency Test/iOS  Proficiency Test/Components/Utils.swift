//
//  Utils.swift
//  iOS Proficiency Test
//
//  Created by Anand R Nair on 17/06/18.
//  Copyright © 2018 Anand R Nair. All rights reserved.
//

import Foundation
import UIKit

/**
 Run on main.
 */
func onmain(_ closure:@escaping ()->()) {
    DispatchQueue.main.async(execute: closure)
}

/**
 Run on background
 */
func onbackground(_ closure:@escaping ()->()) {
    let q = DispatchQueue.global()
    q.async(execute: closure)
}
func onhighbackground(_ closure:@escaping ()->()) {
    let q = DispatchQueue.global(qos: .background)
    q.async(execute: closure)
}

/**
 Delay a block with a number of milliseconds.
 - parameter delay: number of milliseconds to delay execution by.
 - parameter closure: the block to execute after delay
 */
let MSEC_PER_NSEC:Int64 = 1000000;
@discardableResult func delay(_ delay:Int64, _ closure:@escaping (() -> ())) -> (() -> ())? {
    var cancelled = false
    DispatchQueue.main.asyncAfter(
    deadline: DispatchTime.now() + Double((delay * MSEC_PER_NSEC)) / Double(NSEC_PER_SEC)) {
        if !cancelled {
            closure()
        }
    }
    return {
        cancelled = true
    }
}

// find top most view controller
func topController() -> UIViewController? {
    
    // recursive follow
    func follow(_ from:UIViewController?) -> UIViewController? {
        if let to = (from as? UITabBarController)?.selectedViewController {
            return follow(to)
        } else if let to = (from as? UINavigationController)?.visibleViewController {
            return follow(to)
        } else if let to = from?.presentedViewController {
            return follow(to)
        }
        return from
    }
    
    // use our own root since when we there is a
    // UIAlertController displaying, it's the
    // keywindow root
    let root = UIApplication.shared.keyWindow?.rootViewController
    
    return follow(root)
    
}
