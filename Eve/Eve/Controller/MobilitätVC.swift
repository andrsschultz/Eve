//
//  MobilitätVC.swift
//  Eve
//
//  Created by Andreas Schultz on 04.02.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import UIKit

class Mobilita_tVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var shadowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        
        if let navController = navigationController {
            System.clearNavigationBar(forBar: navController.navigationBar)
            navController.view.backgroundColor = .clear
        }
        
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.20
        shadowView.layer.shadowOffset = CGSize(width: 1, height: 1)
        shadowView.layer.shadowRadius = 3.5
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
    }
    
}

extension Mobilita_tVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MobilitätCell", for: indexPath) as! Mobilita_tCell
        cell.label.text = MobilitätRessources().labelTexts[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
