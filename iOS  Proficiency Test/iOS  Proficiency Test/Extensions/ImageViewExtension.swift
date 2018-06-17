//
//  ImageViewExtension.swift
//  iOS Proficiency Test
//
//  Created by Anand R Nair on 17/06/18.
//  Copyright © 2018 Anand R Nair. All rights reserved.
//


import Foundation
import UIKit
import Kingfisher

// extension to load images into imageview asynchronously using Kingfisher
extension UIImageView {
    public typealias CompletionHandler = ((_ image: Image?, _ error: NSError?, _ cacheType: CacheType, _ imageURL: URL?) -> Void)
    
    func loadImage(withURLString urlString: String?,  placeholderImage: UIImage? = #imageLiteral(resourceName: "image-placeholder"), completionHandler: CompletionHandler? = nil) {
        if let imageUrl = urlString?.toURL() {
            self.kf.setImage(with: imageUrl, placeholder: placeholderImage, options: nil, progressBlock: nil) { (image, error, cacheType, url) in
                completionHandler?(image,error, cacheType, url)
            }
        }
        else{
            self.image = placeholderImage
        }
    }
}
