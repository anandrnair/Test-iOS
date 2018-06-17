//
//  Place ViewController.swift
//  iOS  Proficiency Test
//
//  Created by Anand R Nair on 17/06/18.
//  Copyright © 2018 Anand R Nair. All rights reserved.
//

import UIKit

class PlaceViewController: UITableViewController {
    
    var place: Place?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func getPlaceInformation() {
        
    }

}

extension PlaceViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return place?.pointOfInterest.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kPlaceCell", for: indexPath) as? PlaceCell
        cell?.pointOfInterest = place?.pointOfInterest[indexPath.row]
        return cell ?? UITableViewCell()
    }
}

