//
//  MobilitätCell.swift
//  Eve
//
//  Created by Andreas Schultz on 04.02.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import UIKit

class Mobilita_tCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
