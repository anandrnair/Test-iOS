//
//  Place.swift
//  iOS Proficiency Test
//
//  Created by Anand R Nair on 17/06/18.
//  Copyright © 2018 Anand R Nair. All rights reserved.
//

import UIKit
import EVReflection

class Place: EVObject {
    var title = ""
    var pointOfInterest: [PointOfInterest] = []
    
    override public func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "pointOfInterest",keyInResource: "rows")]
    }
}

class PointOfInterest: EVObject {
    var title = ""
    var placeDescription = ""
    var imageUrl = ""
    
    override public func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "placeDescription",keyInResource: "description"),
                (keyInObject: "imageUrl",keyInResource: "imageHref")]
    }
}
