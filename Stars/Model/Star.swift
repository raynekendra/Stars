//
//  Star.swift
//  Stars
//
//  Created by Kendra McVay on 2/13/20.
//  Copyright © 2020 Kendra McVay. All rights reserved.
//

import Foundation

struct Star: Codable {
    var name: String
    var distance: Double
 
    
    var distanceDescription: String {
        return "\(distance) light years away."
    }
    
     func listStars() -> String {
            var output = ""
            for star in stars {
                output += "\(star.name) is \(star.distanceDescription)."
            
            }
        return output
    }
}
