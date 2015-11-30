//
//  Gadget.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation
import UIKit

class Gadget {
    let type: GadgetType
    let name: String
    let price: Int
    let sellPrice: Int
    let techLevel: TechLevelType
    let chance: Int
    let image: UIImage

    init(type: GadgetType) {
        self.type = type
        
        switch type {
        case GadgetType.CargoBays:
            self.name = "5 extra cargo bays"
            self.price = 2475
            self.sellPrice = 1875
            self.techLevel = TechLevelType.techLevel4
            self.chance = 35
            self.image = UIImage(named: "bays")!
        case GadgetType.AutoRepair:
            self.name = "Auto-repair system"
            self.price = 7450
            self.sellPrice = 5625
            self.techLevel = TechLevelType.techLevel5
            self.chance = 20
            self.image = UIImage(named: "repsys")!
        case GadgetType.Navigation:
            self.name = "Navigating system"
            self.price = 14850
            self.sellPrice = 11250
            self.techLevel = TechLevelType.techLevel6
            self.chance = 20
            self.image = UIImage(named: "navsys")!
        case GadgetType.Targeting:
            self.name = "Targeting system"
            self.price = 24750
            self.sellPrice = 18750
            self.techLevel = TechLevelType.techLevel6
            self.chance = 20
            self.image = UIImage(named: "targsys")!
        case GadgetType.Cloaking:
            self.name = "Cloaking device"
            self.price = 99000
            self.sellPrice = 75000
            self.techLevel = TechLevelType.techLevel7
            self.chance = 5
            self.image = UIImage(named: "cloak")!
        case GadgetType.FuelCompactor:
            self.name = "Fuel compactor"
            self.price = 30000
            self.sellPrice = 0                              // ****
            self.techLevel = TechLevelType.techLevel8
            self.chance = 0
            self.image = UIImage(named: "fuel")!
        }
    }
}