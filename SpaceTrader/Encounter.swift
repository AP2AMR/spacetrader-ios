//
//  Encounter.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/13/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import Foundation

class Encounter {
    let type: IFFStatusType
    let opponent: SpaceShip
    let clicks: Int
    
    init(type: IFFStatusType, clicks: Int) {
        self.type = type
        self.clicks = clicks
        
        // generate opponent
        // set opponent ShipType
        var opponentShipType = ShipType.Gnat
        
        
        self.opponent = SpaceShip(type: ShipType.Beetle, IFFStatus: type)
    }
    
    func beginEncounter() {
        // test
        print("Encounter with \(type.rawValue) at \(clicks) clicks instantiated.")
        print("control stopping at this point. Modal button will trigger resume.")
        
        // set data for first modal, fire it, and return
    }
    
    func concludeEncounter() {
        galaxy.currentJourney!.resumeJourney()
    }
}