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

extension UIImageView {
    func loadImage(withURLString urlString: String?,  placeholderImage: UIImage? =  #imageLiteral(resourceName: "image-placeholder")) {
        if let imageUrl = urlString?.toURL() {
            self.kf.setImage(with: imageUrl, placeholder: placeholderImage, options: nil, progressBlock: nil, completionHandler: nil)
        }
        else{
            self.image = placeholderImage
        }
    }
}
