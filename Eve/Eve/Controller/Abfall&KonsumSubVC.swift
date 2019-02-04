//
//  Abfall&KonsumSubVC.swift
//  Eve
//
//  Created by Andreas Schultz on 04.02.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import UIKit

class Abfall_KonsumSubVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var cellLabelTexts = KonsumRessources().labelTexts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellLabelTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KonsumCell", for: indexPath)
        
        cell.textLabel?.text = cellLabelTexts[indexPath.row]
        
        return cell
    }

}
