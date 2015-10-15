//
//  Encounter.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/13/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import Foundation

class Encounter {
    let type: EncounterType
    let opponent: SpaceShip
    let clicks: Int
    var encounterText1 = "null"
    var encounterText2 = "null"
    var encounterText3 = "null"
    var encounterText4 = "null"
    
    init(type: EncounterType, clicks: Int) {
        self.type = type
        self.clicks = clicks
        
        // generate opponent
        // set opponent ShipType
        var opponentShipType = ShipType.Gnat
        
        // obviously just a test
        let testIFF = IFFStatusType.Pirate
        self.opponent = SpaceShip(type: ShipType.Beetle, IFFStatus: testIFF)
    }
    
    func beginEncounter() {
        // HandleEncounterType? What type will be given here? Presumably a specific one?
        // DrawEncounterTextAndButtons
        
        encounterText1 = "At \(clicks) clicks from \(galaxy.targetSystem!.name) you encounter a [pirate?] \(opponent.name)."
        let passedText = NSString(string: "nothing needed here")
        NSNotificationCenter.defaultCenter().postNotificationName("encounterModalFireNotification", object: passedText)
        
        // set data for first modal, fire it, and return
    }
    
    func resumeEncounter(buttonPressed: Int) {
        print("button pressed: \(buttonPressed)")
    }
    
    func concludeEncounter() {
        galaxy.currentJourney!.resumeJourney()
    }
    
    func getBounty() -> Int {
        var bounty = opponent.price / 200
        if bounty <= 0 {
            bounty = 25
        } else if bounty > 2500 {
            bounty = 2500
        }
        return bounty
    }
}