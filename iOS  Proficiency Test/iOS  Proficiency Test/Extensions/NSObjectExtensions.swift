//
//  NSObjectExtensions.swift
//  iOS  Proficiency Test
//
//  Created by Anand R Nair on 17/06/18.
//  Copyright © 2018 Anand R Nair. All rights reserved.
//

import Foundation

// extension to perform a block of code after a delay
protocol PerformSelectorProtocol {
    func performClosureAfterDelay(_ delay: Double, closure: @escaping () -> ())
}

extension NSObject: PerformSelectorProtocol {
    @objc internal func performClosureAfterDelay(_ delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }

    
}
