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
        
        if let navController = navigationController {
            System.clearNavigationBar(forBar: navController.navigationBar)
            navController.view.backgroundColor = .clear
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTierischeProdukte" {
            let vc = segue.destination as! Erna_hrungSubVC
            vc.cellLabelTexts = ErnährungRessources().tierischeProdukteListe
        } else if segue.identifier == "goToExotischesObstUndGemüse" {
            let vc = segue.destination as! Erna_hrungSubVC
            vc.cellLabelTexts = ErnährungRessources().exotischesObstUndGemüseListe
        }
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
        
        cell.mainLabel.text = ErnährungRessources().mainLabelTexts[indexPath.row]
        cell.subLabel.text = ErnährungRessources().subLabelTexts[indexPath.row]
        cell.iconImageView.image = UIImage(named: ErnährungRessources().imageStrings[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 2 || indexPath.row == 3 {
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            performSegue(withIdentifier: "goToTierischeProdukte", sender: nil)
        } else if indexPath.row == 3 {
            performSegue(withIdentifier: "goToExotischesObstUndGemüse", sender: nil)
        }
    }
    
    
}
