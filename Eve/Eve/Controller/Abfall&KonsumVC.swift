//
//  Abfall&KonsumVC.swift
//  Eve
//
//  Created by Andreas Schultz on 04.02.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import UIKit

class Abfall_KonsumVC: UIViewController {

    @IBOutlet var müllbeutelShadowView: UIView!
    @IBOutlet var müllbeutelSlider: UISlider!
    @IBOutlet var müllbeutelLabel: UILabel!
    @IBOutlet var hinzufügenShadowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let navController = navigationController {
            System.clearNavigationBar(forBar: navController.navigationBar)
            navController.view.backgroundColor = .clear
        }
        
        müllbeutelShadowView.layer.shadowColor = UIColor.black.cgColor
        müllbeutelShadowView.layer.shadowOpacity = 0.20
        müllbeutelShadowView.layer.shadowOffset = CGSize(width: 1, height: 1)
        müllbeutelShadowView.layer.shadowRadius = 3.5
        
        hinzufügenShadowView.layer.shadowColor = UIColor.black.cgColor
        hinzufügenShadowView.layer.shadowOpacity = 0.20
        hinzufügenShadowView.layer.shadowOffset = CGSize(width: 1, height: 1)
        hinzufügenShadowView.layer.shadowRadius = 3.5
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func fertigButtonTapped(_ sender: Any) {
    }
    
}
