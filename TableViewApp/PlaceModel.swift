//
//  Places.swift
//  TableViewApp
//
//  Created by Юлия on 3/25/21.
//  Copyright © 2021 Nikita. All rights reserved.
//

import UIKit

struct Place {
    
    var name: String
    var location : String?
    var type : String?
    var image : UIImage?
    var restaurantName : String?
    
   static let restaurantNames = [
    "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
    "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
    "Speak Easy", "Morris Pub", "Вкусные истории",
    "Классик", "Love&Life", "Шок", "Бочка" ]
    
    
   static func getPlaces() -> [Place] {
    var places = [Place]()
        
        for place in restaurantNames {
            places.append(Place(name: place, location: "Уфа", type: "Ресторан", image: nil, restaurantName: place))
            
            
        }
        return places
    }
    
}
