//
//  CrewMember.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class CrewMember {
    var ID: MercenaryName
    var name: String
    var pilot: Int
    var fighter: Int
    var trader: Int
    var engineer: Int
    var costPerDay: Int
    
    
    
    init(ID: MercenaryName, pilot: Int, fighter: Int, trader: Int, engineer: Int) {
        self.ID = ID
        self.name = ID.rawValue
        self.pilot = pilot
        self.fighter = fighter
        self.trader = trader
        self.engineer = engineer
        self.costPerDay = ((pilot + fighter + trader + engineer) * 3)
    }
}