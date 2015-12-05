//
//  SpecialEvent.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

// leaving off further work on this until the rest of this is further along and I understand better how it will be used

class SpecialEvents {
    // things referencable from VC
    var special = false
    var specialEventTitle = ""
    var specialEventText = ""
    // buttons text...
    
    // internal
    var currentSpecialEventID: SpecialEventID? = nil
    
    init() {
        
    }
    
    func setSpecialEvent() {
        // this should initialize to the event of the TARGET system (called before warp actually happens)
        // if nil, special is set to false, and the "Special" button is disabled
        
        special = true
        specialEventTitle = "Test Event"
        specialEventText = "Testing the special event system."
    }
}


enum SpecialEventID {
    // to be distributed at new game
    case alienArtifact
    case dragonfly
    case dangerousExperiment
    case gemulonInvasion
    case japoriDisease
    case ambassadorJarek
    case princess
    case moonForSale
    case morgansReactor
    case scarabStolen
    case sculpture
    case spaceMonster
    case wild
    case merchantPrice
    case eraseRecord
    case lotteryWinner      // for initial system on beginner
    case skillIncrease      // multiple?
    case cargoForSale       // multiple?
    
    
    // subsequent
    case artifactDelivery
    case dragonflyBaratas
    case dragonflyMelina
    case dragonflyRegulas
    case dragonflyDestroyed
    case lightningShield
    case disasterAverted
    case experimentFailed
    case gemulonInvaded
    case gemulonRescued
    case fuelCompactor
    case medicineDelivery
    case jarekGetsOut
    case princessCentauri
    case princessInthara
    case princessQonos
    case princessReturned
    case installQuantumDisruptor
    case retirement
    case reactorDelivered
    case installMorgansLaser
    case scarabDestroyed
    case upgradeHull
    case sculptureDelivered
    case installHiddenCompartments
    case monsterKilled
    case wildGetsOut
    case tribbleBuyer
}
