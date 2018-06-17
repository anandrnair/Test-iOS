//
//  StringExtensions.swift
//  iOS Proficiency Test
//
//  Created by Anand R Nair on 17/06/18.
//  Copyright © 2018 Anand R Nair. All rights reserved.
//

import Foundation

// MARK: Localization
prefix operator &&

prefix func && (string: String) -> String {
    return NSLocalizedString(string, comment: "")
}

extension String{
    
    func toData() -> Data {
        return  self.data(using: .utf8)!
    }
    
    func toURL() -> URL? {
        return URL(string: self)
    }
}
