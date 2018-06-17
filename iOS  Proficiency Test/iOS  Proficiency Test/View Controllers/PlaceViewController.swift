//
//  Place ViewController.swift
//  iOS  Proficiency Test
//
//  Created by Anand R Nair on 17/06/18.
//  Copyright © 2018 Anand R Nair. All rights reserved.
//

import UIKit

class PlaceViewController: UITableViewController {
    
    let refreshController = UIRefreshControl()
    
    var place: Place? {
        didSet {
            onmain {
                self.title = self.place?.title ?? ""
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshController
        } else {
            tableView.addSubview(refreshController)
        }
        
        refreshController.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        getPlaceInformation()
    }

    @objc private func refreshData(_ sender: Any) {
        getPlaceInformation(shouldShowHud: false)
    }
    
    func getPlaceInformation(shouldShowHud: Bool = true) {
        Place.getPlaceDetails(shouldShowProgressHud: shouldShowHud) { (place, error) in
            self.refreshController.endRefreshing()
            guard error == nil else {
                return
            }
            self.place = place
        }
    }
}

extension PlaceViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.hideEmptyTableView()
        if place?.pointOfInterest.count ?? 0 <= 0 {
            tableView.showEmptyTableView()
        }
        return place?.pointOfInterest.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kPlaceCell", for: indexPath) as? PlaceCell
        cell?.pointOfInterest = place?.pointOfInterest[indexPath.row]
        return cell ?? UITableViewCell()
    }
}

