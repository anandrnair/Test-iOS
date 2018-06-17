//
//  UITableViewExtensions.swift
//  iOS Proficiency Test
//
//  Created by Anand R Nair on 17/06/18.
//  Copyright © 2018 Anand R Nair. All rights reserved.
//


import Foundation
import UIKit
import SVProgressHUD

extension UITableView {
    
    @objc var relativeSubviews: [UIView] {
        return (subviews[0].subviews.filter { $0.isKind(of: UITableViewCell.self) } as! [UITableViewCell]).reduce([]) { $0 + $1.relativeSubviews }
    }
    
    func relativeSubviews <T: UIView> (_ type: T.Type) -> [T]? {
        return relativeSubviews.filter { $0.isKind(of: T.self) } as? [T]
    }
    
    @objc func showEmptyTableView(_ message: String = &&"empty_tableview_message") {
        
        SVProgressHUD.isVisible()
        
        let labelEmptyMessage = UILabel()
        labelEmptyMessage.text = message
        labelEmptyMessage.textColor = UIColor.darkGray
        labelEmptyMessage.numberOfLines = 0
        labelEmptyMessage.textAlignment = .center
        if #available(iOS 8.2, *) {
            labelEmptyMessage.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light)
        } else {
            // Fallback on earlier versions
        }
        labelEmptyMessage.sizeToFit()
        
        let view = UIView()
        view.addSubview(labelEmptyMessage)
        
        backgroundView = view
        
        if let tableHeaderView = tableHeaderView {
            labelEmptyMessage.frame = CGRect(x: 0, y: tableHeaderView.bounds.height / 2, width: bounds.size.width, height: bounds.size.height)
        }
        else {
            labelEmptyMessage.frame = CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height)
        }
        
        // hide label when loading
        performClosureAfterDelay(0.2) {
            labelEmptyMessage.isHidden = SVProgressHUD.isVisible()
        }
    }
    
    @objc func hideEmptyTableView() {
        backgroundView = nil
    }
}

