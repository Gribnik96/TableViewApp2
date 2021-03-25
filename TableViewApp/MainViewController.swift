//
//  MainViewController.swift
//  TableViewApp
//
//  Created by Юлия on 3/24/21.
//  Copyright © 2021 Nikita. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    

    let places = Place.getPlaces()

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
        
        cell.namelabel.text = places[indexPath.row].name
        cell.locationLabel.text = places[indexPath.row].location
        cell.typelabel.text = places[indexPath.row].type
        cell.imageOfPlaces.image = UIImage(named: places[indexPath.row].image)
        
        cell.imageOfPlaces.layer.cornerRadius = cell.imageOfPlaces.frame.size.height / 2
        cell.imageOfPlaces.clipsToBounds = true


        return cell
     }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
        
        
        
    }
 
    @IBAction func cancelAction (_ segue : UIStoryboardSegue) {}

}
