//
//  SpecialEvent.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

// leaving off further work on this until the rest of this is further along and I understand better how it will be used

class SpecialEvent {
    let type: SpecialEventID
    let title: String
    let text: String
    let price: Int
    let occurance: Int
    let justAMessage: Bool
    
    init(type: SpecialEventID) {
        self.type = type
        
        switch type {
        case SpecialEventID.dragonflyDestroyed:
            self.title = "Dragonfly Destroyed"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.lightningShip:
            self.title = "Lightning Ship"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.weirdShip:
            self.title = "Weird Ship"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.strangeShip:
            self.title = "Strange Ship"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.monsterKilled:
            self.title = "Monster Killed"
            self.text = ""
            self.price = -15000
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.medicineDelivery:
            self.title = "Medicine Delivery"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.retirement:
            self.title = "Retirement"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = false
        case SpecialEventID.moonForSale:
            self.title = "Moon for Sale"
            self.text = ""
            self.price = 500000
            self.occurance = 4
            self.justAMessage = false
        case SpecialEventID.skillIncrease:
            self.title = "Skill Increase"
            self.text = ""
            self.price = 3000
            self.occurance = 3
            self.justAMessage = false
        case SpecialEventID.merchantPrince:
            self.title = "Merchant Prince"
            self.text = ""
            self.price = 1000
            self.occurance = 1
            self.justAMessage = false
        case SpecialEventID.eraseRecord:
            self.title = "Erase Record"
            self.text = ""
            self.price = 5000
            self.occurance = 3
            self.justAMessage = false
        case SpecialEventID.tribbleBuyer:
            self.title = "Tribble Buyer"
            self.text = ""
            self.price = 0
            self.occurance = 3
            self.justAMessage = false
        case SpecialEventID.spaceMonster:
            self.title = "Space Monster"
            self.text = ""
            self.price = 0
            self.occurance = 1
            self.justAMessage = true
        case SpecialEventID.dragonfly:
            self.title = "Dragonfly"
            self.text = ""
            self.price = 0
            self.occurance = 1
            self.justAMessage = true
        case SpecialEventID.cargoForSale:
            self.title = "Cargo for Sale"
            self.text = ""
            self.price = 1000
            self.occurance = 3
            self.justAMessage = false
        case SpecialEventID.lightningShield:
            self.title = "Lightning Shield"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = false
        case SpecialEventID.japoriDisease:
            self.title = "Japori Disease"
            self.text = ""
            self.price = 0
            self.occurance = 1
            self.justAMessage = false
        case SpecialEventID.lotteryWinner:
            self.title = "Lottery Winner"
            self.text = ""
            self.price = -1000
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.artifactDelivery:
            self.title = "Artifact Delivery"
            self.text = ""
            self.price = -20000
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.alienArtifact:
            self.title = "Alien Artifact"
            self.text = ""
            self.price = 0
            self.occurance = 01
            self.justAMessage = false
        case SpecialEventID.ambassadorJarek:
            self.title = "Ambassador Jarek"
            self.text = ""
            self.price = 0
            self.occurance = 1
            self.justAMessage = false
        case SpecialEventID.alienInvasion:
            self.title = "Alien Invasion"
            self.text = ""
            self.price = 0
            self.occurance = 1
            self.justAMessage = false
        case SpecialEventID.gemulonInvaded:
            self.title = "Gemulon Invaded"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.fuelCompactor:
            self.title = "Fuel Compactor"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = false
        case SpecialEventID.dangerousExperiment:
            self.title = "Dangerous Experiment"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.jonathanWild:
            self.title = "Jonathan Wild"
            self.text = ""
            self.price = 0
            self.occurance = 1
            self.justAMessage = false
        case SpecialEventID.morgansReactor:
            self.title = "Morgan's Reactor"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = false
        case SpecialEventID.installMorgansLaser:
            self.title = "Install Morgan's Laser"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = false
        case SpecialEventID.scarabStolen:
            self.title = "Scarab Stolen"
            self.text = ""
            self.price = 0
            self.occurance = 1
            self.justAMessage = true
        case SpecialEventID.upgradeHull:
            self.title = "Upgrade Hull"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = false
        case SpecialEventID.scarabDestroyed:
            self.title = "Scarab Destroyed"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.reactorDelivered:
            self.title = "Reactor Delivered"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.jarekGetsOut:
            self.title = "Jarek Gets Out"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.gemulonRescued:
            self.title = "Gemulon Rescued"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.disasterAverted:
            self.title = "Disaster Averted"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.experimentFailed:
            self.title = "Experiment Failed"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case SpecialEventID.wildGetsOut:
            self.title = "Wild Gets Out"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
            
        }
    }
}

enum SpecialEventID {
    case dragonflyDestroyed
    case weirdShip
    case lightningShip
    case strangeShip
    case monsterKilled
    case medicineDelivery
    case retirement
    case moonForSale
    case skillIncrease
    case merchantPrince
    case eraseRecord
    case tribbleBuyer
    case spaceMonster
    case dragonfly
    case cargoForSale
    case lightningShield
    case japoriDisease
    case lotteryWinner
    case artifactDelivery
    case alienArtifact
    case ambassadorJarek
    case alienInvasion
    case gemulonInvaded
    case fuelCompactor
    case dangerousExperiment
    case jonathanWild
    case morgansReactor
    case installMorgansLaser
    case scarabStolen
    case upgradeHull
    case scarabDestroyed
    case reactorDelivered
    case jarekGetsOut
    case gemulonRescued
    case disasterAverted
    case experimentFailed
    case wildGetsOut
}