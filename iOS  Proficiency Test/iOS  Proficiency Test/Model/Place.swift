//
//  Place.swift
//  iOS Proficiency Test
//
//  Created by Anand R Nair on 17/06/18.
//  Copyright © 2018 Anand R Nair. All rights reserved.
//

import UIKit
import EVReflection

// model to bind the place data using EVObject
class Place: EVObject {
    var title: String?
    var pointOfInterest: [PointOfInterest] = []
    
    override public func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "pointOfInterest",keyInResource: "rows")]
    }
    
    class func getPlaceDetails(shouldShowProgressHud: Bool = true,_ completionHandler: @escaping (_ place: Place, _ error: NSError?) -> ()) {
        
        APIRouter.dataTaskWithMethod(Method.GET, path: "facts.json", shouldShowHUD: shouldShowProgressHud) { (dataDict, error) in
            
            // handle error
            if error != nil {
                Alert.alert(&&"alert_place_fetch_failed").show()
                completionHandler(Place(), error)
                print("Error: \(String(describing: error))")
                return
            }
            
            guard let dataPlace: NSDictionary = dataDict as NSDictionary? else {
                Alert.alert(&&"alert_place_fetch_failed").show()
                completionHandler(Place(), nil)
                return
            }
            let place = Place(dictionary: dataPlace)
            
            completionHandler(place, nil)
        }
    }
}

// model to bind the Point of interest for a place
class PointOfInterest: EVObject {
    var title: String?
    var placeDescription: String?
    var imageUrl: String?
    
    override public func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "placeDescription",keyInResource: "description"),
                (keyInObject: "imageUrl",keyInResource: "imageHref")]
    }
}
