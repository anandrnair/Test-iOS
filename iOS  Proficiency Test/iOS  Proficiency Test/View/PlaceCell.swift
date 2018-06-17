//
//  PlaceCell.swift
//  iOS Proficiency Test
//
//  Created by Anand R Nair on 17/06/18.
//  Copyright © 2018 Anand R Nair. All rights reserved.
//

import UIKit

class PlaceCell: UITableViewCell {
    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var pointOfInterest: PointOfInterest? {
        didSet {
            configureView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureView() {
        placeImageView.loadImage(withURLString: pointOfInterest?.imageUrl)
        titleLabel.text = self.pointOfInterest?.title
        descriptionLabel.text = self.pointOfInterest?.placeDescription
    }
}
