//
//  NSObjectExtensions.swift
//  ATC
//
//  Created by Thahir Maheen on 14/09/15.
//  Copyright (c) 2015 digitalbrandgroup. All rights reserved.
//

import Foundation

protocol PerformSelectorProtocol {
    func performClosureAfterDelay(_ delay: Double, closure: @escaping () -> ())
}

extension NSObject: PerformSelectorProtocol {
    @objc internal func performClosureAfterDelay(_ delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }

    
}
