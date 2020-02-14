//
//  ViewController.swift
//  Stars
//
//  Created by Kendra McVay on 2/13/20.
//  Copyright © 2020 Kendra McVay. All rights reserved.
//

import UIKit

class StarViewController: UIViewController {
// IBOutlets
    
    @IBOutlet var starNameTextField: UITextField!
    @IBOutlet var distanceTextField:
    UITextField!
    @IBOutlet var tableView: UITableView!
    
    // Mark Properties
    // Source of truth?
    let starController = StarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
    }
// IBACTIONS
    @IBAction func printButtonTapped(_ sender: Any) {
        
        print(starController.listStars())
}
    @IBACtion func createButtonTapeed(_ sender: Any) {
        guard let name = starNameTextField.text,
            let distanceString = distanceTextField.text,
            !name.isEmpty,
            !distanceString.isEmpty,
            let distance = Double(distance) else { return }
 
        starController.createStar(named: name, withDistance: distance)
        starNameTextField.text = ""
        distanceTextField.text = ""
        starNameTextField.becomeFirstResponder()
        tableView.reloadData()
    }
   

extension StarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection setion: Int) -> Int {
        return starController.stars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    guard let cell = cell.tableView.dequeueResuableCell(withIdentifier: "StarCell", for: indexPath) as? StarTAbleViewCell else { return UITableViewCell) }
    
    let star = starController.stars[indexPath.row]
    cell.star = star
    return cell
    }
}

//fix this!!!
