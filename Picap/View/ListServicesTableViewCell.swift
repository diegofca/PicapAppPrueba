//
//  ListServicesTableViewCell.swift
//  Picap
//
//  Created by Medios Digitales on 3/29/19.
//  Copyright © 2019 Diego Fernando Cuesta. All rights reserved.
//

import UIKit

class ListServicesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addressServicesLabel: UILabel!
    @IBOutlet weak var endAddressServicesLabel: UILabel!
    @IBOutlet weak var subUnitsLabel: UILabel!
    @IBOutlet weak var statusServicesLabel: UILabel!
    @IBOutlet weak var finalCostLabel: UILabel!
    
    @IBOutlet weak var iconTransport: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
