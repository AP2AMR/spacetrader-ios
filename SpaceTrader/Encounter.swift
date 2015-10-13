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
        let passedText = NSString(string: "nothing needed here")
        NSNotificationCenter.defaultCenter().postNotificationName("encounterModalFireNotification", object: passedText)
        
        // set data for first modal, fire it, and return
    }
    
    func concludeEncounter() {
        galaxy.currentJourney!.resumeJourney()
    }
}