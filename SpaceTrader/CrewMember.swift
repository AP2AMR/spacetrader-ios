//
//  CrewMember.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class CrewMember {
    var name: String            // MercenaryType exists
    var pilot: Int
    var fighter: Int
    var trader: Int
    var engineer: Int
    var currentSystem: StarSystemID
    
    
    
    init(name: String, pilot: Int, fighter: Int, trader: Int, engineer: Int, currentSystem: StarSystemID) {
        self.name = name
        self.pilot = pilot
        self.fighter = fighter
        self.trader = trader
        self.engineer = engineer
        self.currentSystem = currentSystem
    }
    
    // I believe this is randomly initialized. Need a method to do this. Need to figure out special cases that are always the same, and method for assigning things to others
}