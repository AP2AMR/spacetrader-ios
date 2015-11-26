//
//  BuyEquipmentCell.swift
//  SpaceTrader
//
//  Created by Marc Auger on 11/25/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class BuyEquipmentCell: UITableViewCell {

    @IBOutlet weak var equipmentTitleLabel: UILabel!
    @IBOutlet weak var equipmentPriceLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(item: UniversalGadgetType) {
        switch item {
        case UniversalGadgetType.pulseLaser:
            equipmentTitleLabel.text = "Pulse Laser"
            equipmentPriceLabel.text = "something"
            imageLabel.image = UIImage(named: "pulse")
        case 
        
            
            //[UniversalGadgetType.pulseLaser, UniversalGadgetType.beamLaser, UniversalGadgetType.militaryLaser, UniversalGadgetType.photonDisruptor, UniversalGadgetType.energyShield, UniversalGadgetType.reflectiveShield, UniversalGadgetType.CargoBays, UniversalGadgetType.AutoRepair, UniversalGadgetType.Navigation, UniversalGadgetType.Targeting, UniversalGadgetType.Cloaking]
        }
    }

}
