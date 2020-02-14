//
//  StarTableViewCell.swift
//  Stars
//
//  Created by Kendra McVay on 2/13/20.
//  Copyright © 2020 Kendra McVay. All rights reserved.
//

import UIKit

class StarTableViewCell: UITableViewCell {
    var star: Star?
    didSet {
        updateViews()
    }
}

    @Iboutlet var nameLabel: UILabel!
    @IbOutlet var distanceLabel: UILabel!
 
private func updateViews() {
    nameLabel.text = star?.name
    distanceLabel.text = star?.distanceDescription
    
    }
}
