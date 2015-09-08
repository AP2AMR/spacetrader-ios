//
//  Ship.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class Ship {
    var type: ShipType
    var cargo: [TradeItem]
    var weapon: [Weapon]
    var shield: [Shield]
    var shieldStrength: [Int]       // these arrays are getting scary
    var gadget: [Gadget]
    var crew: [CrewMember]
    var fuel: Int
    var hull: Int
    var tribbles: Int
    
    init(type: ShipType) {
        self.type = type
        self.cargo = []
        self.weapon = []
        self.shield = []
        self.shieldStrength = []
        self.gadget = []
        self.crew = []
//        switch type {
//            // set fuel & initial hull strength
//        }
        
        self.fuel = 5
        self.hull = 5
        self.tribbles = 0
    }
}