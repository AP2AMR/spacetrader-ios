//
//  Gadget.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class Gadget {
    let type: GadgetType
    let name: String
    let price: Int
    let sellPrice: Int
    let techLevel: TechLevelType
    let chance: Int

    init(type: GadgetType) {
        self.type = type
        
        switch type {
        case GadgetType.CargoBays:
            self.name = "5 extra cargo bays"
            self.price = 2475
            self.sellPrice = 1875
            self.techLevel = TechLevelType.techLevel4
            self.chance = 35
        case GadgetType.AutoRepair:
            self.name = "Auto-repair system"
            self.price = 7450
            self.sellPrice = 5625
            self.techLevel = TechLevelType.techLevel5
            self.chance = 20
        case GadgetType.Navigation:
            self.name = "Navigating system"
            self.price = 14850
            self.price = 11250
            self.techLevel = TechLevelType.techLevel6
            self.chance = 20
        case GadgetType.Targeting:
            self.name = "Targeting system"
            self.price = 24750
            self.sellPrice = 18750
            self.techLevel = TechLevelType.techLevel6
            self.chance = 20
        case GadgetType.Cloaking:
            self.name = "Cloaking device"
            self.price = 99000
            self.sellPrice = 75000
            self.techLevel = TechLevelType.techLevel7
            self.chance = 5
        case GadgetType.FuelCompactor:
            self.name = "Fuel compactor"
            self.price = 30000
            self.techLevel = TechLevelType.techLevel8
            self.chance = 0
        }
    }
}