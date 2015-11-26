//
//  Weapon.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation
import UIKit

class Weapon {
    let type: WeaponType
    let name: String
    let power: Int
    let disruptivePower: Int
    let price: Int
    let sellPrice: Int
    let techLevel: TechLevelType
    let chance: Int                 // percent chance it is fitted in given a slot
    let image: UIImage
    
    init(type: WeaponType) {
        self.type = type
        
        switch type {
        case WeaponType.pulseLaser:
            self.name = "Pulse laser"
            self.power = 15
            self.disruptivePower = 0
            self.price = 1980
            self.sellPrice = 1500
            self.techLevel = TechLevelType.techLevel5
            self.chance = 50
            self.image = UIImage(named: "pulse")!
        case WeaponType.beamLaser:
            self.name = "Beam laser"
            self.power = 25
            self.disruptivePower = 0
            self.price = 12370
            self.sellPrice = 9375
            self.techLevel = TechLevelType.techLevel6
            self.chance = 35
            self.image = UIImage(named: "beam")!
        case WeaponType.militaryLaser:
            self.name = "Military laser"
            self.power = 35
            self.disruptivePower = 0
            self.price = 34650
            self.sellPrice = 26250
            self.techLevel = TechLevelType.techLevel7
            self.chance = 15
            self.image = UIImage(named: "military")!
        case WeaponType.morgansLaser:
            self.name = "Morgan's laser"
            self.power = 85
            self.disruptivePower = 0
            self.price = 50000
            self.sellPrice = 0                        // WHAT ACTUALLY IS THE SELL PRICE OF SPECIAL ITEMS?
            self.techLevel = TechLevelType.techLevel8
            self.chance = 0
            self.image = UIImage(named: "morgan")!
        case WeaponType.photonDisruptor:
            self.name = "Photon Disruptor"
            self.power = 35                             // ALL THESE VALUES WRONG
            self.disruptivePower = 1
            self.price = 14850
            self.sellPrice = 11250
            self.techLevel = TechLevelType.techLevel8
            self.chance = 0
            self.image = UIImage(named: "photon")!
        }
    }
}
