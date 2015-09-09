//
//  SpecialEvent.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class SpecialEvent {
    let type: QuestIDType
    let title: String
    let text: String
    let price: Int
    let occurance: Int
    let justAMessage: Bool
    
    init(type: QuestIDType) {
        self.type = type
        
        switch type {
        case QuestIDType.dragonflyDestroyed:
            self.title = "Dragonfly Destroyed"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.lightningShip:
            self.title = "Lightning Ship"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.weirdShip:
            self.title = "Weird Ship"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.strangeShip:
            self.title = "Strange Ship"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.monsterKilled:
            self.title = "Monster Killed"
            self.text = ""
            self.price = -15000
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.medicineDelivery:
            self.title = "Medicine Delivery"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.retirement:
            self.title = "Retirement"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = false
        case QuestIDType.moonForSale:
            self.title = "Moon for Sale"
            self.text = ""
            self.price = 500000
            self.occurance = 4
            self.justAMessage = false
        case QuestIDType.skillIncrease:
            self.title = "Skill Increase"
            self.text = ""
            self.price = 3000
            self.occurance = 3
            self.justAMessage = false
        case QuestIDType.merchantPrince:
            self.title = "Merchant Prince"
            self.text = ""
            self.price = 1000
            self.occurance = 1
            self.justAMessage = false
        case QuestIDType.eraseRecord:
            self.title = "Erase Record"
            self.text = ""
            self.price = 5000
            self.occurance = 3
            self.justAMessage = false
        case QuestIDType.tribbleBuyer:
            self.title = "Tribble Buyer"
            self.text = ""
            self.price = 0
            self.occurance = 3
            self.justAMessage = false
        case QuestIDType.spaceMonster:
            self.title = "Space Monster"
            self.text = ""
            self.price = 0
            self.occurance = 1
            self.justAMessage = true
        case QuestIDType.dragonfly:
            self.title = "Dragonfly"
            self.text = ""
            self.price = 0
            self.occurance = 1
            self.justAMessage = true
        case QuestIDType.cargoForSale:
            self.title = "Cargo for Sale"
            self.text = ""
            self.price = 1000
            self.occurance = 3
            self.justAMessage = false
        case QuestIDType.lightningShield:
            self.title = "Lightning Shield"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = false
        case QuestIDType.japoriDisease:
            self.title = "Japori Disease"
            self.text = ""
            self.price = 0
            self.occurance = 1
            self.justAMessage = false
        case QuestIDType.lotteryWinner:
            self.title = "Lottery Winner"
            self.text = ""
            self.price = -1000
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.artifactDelivery:
            self.title = "Artifact Delivery"
            self.text = ""
            self.price = -20000
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.alienArtifact:
            self.title = "Alien Artifact"
            self.text = ""
            self.price = 0
            self.occurance = 01
            self.justAMessage = false
        case QuestIDType.ambassadorJarek:
            self.title = "Ambassador Jarek"
            self.text = ""
            self.price = 0
            self.occurance = 1
            self.justAMessage = false
        case QuestIDType.alienInvasion:
            self.title = "Alien Invasion"
            self.text = ""
            self.price = 0
            self.occurance = 1
            self.justAMessage = false
        case QuestIDType.gemulonInvaded:
            self.title = "Gemulon Invaded"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.fuelCompactor:
            self.title = "Fuel Compactor"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = false
        case QuestIDType.dangerousExperiment:
            self.title = "Dangerous Experiment"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.jonathanWild:
            self.title = "Jonathan Wild"
            self.text = ""
            self.price = 0
            self.occurance = 1
            self.justAMessage = false
        case QuestIDType.morgansReactor:
            self.title = "Morgan's Reactor"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = false
        case QuestIDType.installMorgansLaser:
            self.title = "Install Morgan's Laser"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = false
        case QuestIDType.scarabStolen:
            self.title = "Scarab Stolen"
            self.text = ""
            self.price = 0
            self.occurance = 1
            self.justAMessage = true
        case QuestIDType.upgradeHull:
            self.title = "Upgrade Hull"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = false
        case QuestIDType.scarabDestroyed:
            self.title = "Scarab Destroyed"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.reactorDelivered:
            self.title = "Reactor Delivered"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.jarekGetsOut:
            self.title = "Jarek Gets Out"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.gemulonRescued:
            self.title = "Gemulon Rescued"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.disasterAverted:
            self.title = "Disaster Averted"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.experimentFailed:
            self.title = "Experiment Failed"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        case QuestIDType.wildGetsOut:
            self.title = "Wild Gets Out"
            self.text = ""
            self.price = 0
            self.occurance = 0
            self.justAMessage = true
        
            
        }
    }
}