//
//  MainViewController.swift
//  TableViewApp
//
//  Created by Юлия on 3/24/21.
//  Copyright © 2021 Nikita. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    

    var places = Place.getPlaces()

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomtableViewCell
        
        let place = places[indexPath.row]
        
        cell.namelabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typelabel.text = place.type
        if place.image == nil {
                  cell.imageOfPlaces.image = UIImage(named: place.restaurantName!)
        } else {
            cell.imageOfPlaces.image = place.image
        }
       
        cell.imageOfPlaces.layer.cornerRadius = cell.imageOfPlaces.frame.size.height / 2
        cell.imageOfPlaces.clipsToBounds = true


        return cell
     }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
        
        
        
    }
 
    @IBAction func unwindSegue (_ segue : UIStoryboardSegue) {
       guard let newPlaceVC = segue.source as? NewPlaceTableViewController else { return }
        
        newPlaceVC.saveNewPlace()
        places.append(newPlaceVC.newPlace!)
        tableView.reloadData()
    }

}
