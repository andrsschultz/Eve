//
//  ErnährungVC.swift
//  Eve
//
//  Created by Andreas Schultz on 04.02.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import UIKit

class Erna_hrungVC: UIViewController {

    
    //PROPERTIES
    @IBOutlet var tableView: UITableView!
    @IBOutlet var nextButton: UIButton!
    
    //OVERRIDE FUNCS

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //CUSTOM FUNCS
    
    //ACTIONS
    @IBAction func nextButtonTapped(_ sender: Any) {
    }
    

}

extension Erna_hrungVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ErnährungCell", for: indexPath) as! Erna_hrungCell
        
        cell.mainLabel.text = TrackerRessources().mainLabelTexts[indexPath.row]
        cell.subLabel.text = "0x"
        cell.iconImageView.image = UIImage(named: TrackerRessources().imageStrings[indexPath.row])
        
        return cell
    }
    
    
}
