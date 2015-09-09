//
//  CrewMember.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class CrewMember {
    let type: MercenaryName
    let name: String
    let pilot: Int
    let fighter: Int
    let trader: Int
    let engineer: Int
    let currentSystem: StarSystemID
    
    init(name: String, pilot: Int, fighter: Int, trader: Int, engineer: Int, currentSystem: StarSystemID) {
        self.name = name
        self.pilot = pilot
        self.fighter = fighter
        self.trader = trader
        self.engineer = engineer
        self.currentSystem = currentSystem
    }
}