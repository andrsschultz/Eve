//
//  ErnährungCell.swift
//  Eve
//
//  Created by Andreas Schultz on 04.02.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import UIKit

class Erna_hrungCell: UITableViewCell {

    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        cellView.layer.shadowColor = UIColor.black.cgColor
//        cellView.layer.shadowOpacity = 1
//        cellView.layer.shadowOffset = CGSize.zero
//        cellView.layer.shadowRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
