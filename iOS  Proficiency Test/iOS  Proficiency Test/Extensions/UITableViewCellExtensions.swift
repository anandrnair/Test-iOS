//
//  UITableViewExtensions.swift
//  FlexYourMacros
//
//  Created by dbgattila on 4/22/15.
//  Copyright (c) 2015 Digital Brand Group. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    @objc var relativeSubviews: [UIView] {
        return contentView.subviews 
    }
    
    func relativeSubviews <T: UIView> (_ type: T.Type) -> [T]? {
        return relativeSubviews.filter() { $0.isKind(of: T.self)} as? [T]
    }
}


extension UITableViewCell {
    
    @objc func setCustomSeparatorInset(_ inset: UIEdgeInsets) {
        
        // set seperator inset
        separatorInset = UIEdgeInsets.zero
        
        if responds(to: #selector(getter: UIView.preservesSuperviewLayoutMargins)) {
            // prevent the cell from inheriting the Table View's margin settings
            
            preservesSuperviewLayoutMargins = false
        }
        
        if responds(to: #selector(getter: UIView.layoutMargins)) {
            // explictly set your cell's layout margins
            
            layoutMargins = UIEdgeInsets.zero
        }
    }
    
    @objc func setSeparatorInsetZero() {
        setCustomSeparatorInset(UIEdgeInsets.zero)
    }
}
