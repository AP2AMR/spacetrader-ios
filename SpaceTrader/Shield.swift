//
//  Shield.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class Shield {
    let type: ShieldType
    let name: String
    let power: Int
    let price: Int
    let techLevel: TechLevelType
    let chance: Int                 // percent chance that this is fitted in a slot
    
    init(type: ShieldType) {
        self.type = type
        
        switch type {
        case ShieldType.energyShield:
            self.name = "Energy shield"
            self.power = 100
            self.price = 5000
            self.techLevel = TechLevelType.techLevel5
            self.chance = 70
        case ShieldType.reflectiveShield:
            self.name = "Reflective shield"
            self.power = 200
            self.price = 20000
            self.techLevel = TechLevelType.techLevel6
            self.chance = 30
        case ShieldType.lightningShield:
            self.name = "Lightning shield"
            self.power = 350
            self.price = 45000
            self.techLevel = TechLevelType.techLevel8
            self.chance = 0
        }
    }

}