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
    var yesDismissButtonText = ""
    var noButtonText = ""
    var yesDismissButtonEnabled = true  // assuming this won't be necessary, leaving it here
    var noButtonEnabled = false
    
    // quest strings. One for each quest. addQuestString function takes string and QuestID, appends if it's the first one, replaces if not. Use "" for string to delete quest upon completion.
    var quests: [(String, QuestID)] = []
    
    // internal
    var currentSpecialEventID: SpecialEventID? = nil
    
    init() {
        
    }
    
    func setSpecialEvent() {
        // this should initialize to the event of the CURRENT system (called upon completion of warp)
        // if nil, special is set to false, and the "Special" button is disabled
        if galaxy.currentSystem!.specialEvent != nil {
            special = true
        }
        
        if special {
            switch galaxy.currentSystem!.specialEvent! {
            // initial
            case SpecialEventID.alienArtifact:
                print("not implemented yet")
            case SpecialEventID.dragonfly:
                print("not implemented yet")
            case SpecialEventID.dangerousExperiment:
                print("not implemented yet")
            case SpecialEventID.gemulonInvasion:
                print("not implemented yet")
            case SpecialEventID.japoriDisease:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                // quest string
            case SpecialEventID.ambassadorJarek:
                print("not implemented yet")
            case SpecialEventID.princess:
                print("not implemented yet")
            case SpecialEventID.moonForSale:
                print("not implemented yet")
            case SpecialEventID.morgansReactor:
                print("not implemented yet")
            case SpecialEventID.scarabStolen:
                print("not implemented yet")
            case SpecialEventID.sculpture:
                print("not implemented yet")
            case SpecialEventID.spaceMonster:
                print("not implemented yet")
            case SpecialEventID.wild:
                print("not implemented yet")
            case SpecialEventID.merchantPrice:
                print("not implemented yet")
            case SpecialEventID.eraseRecord:
                print("not implemented yet")
            case SpecialEventID.lotteryWinner:
                specialEventTitle = "Lottery Winner"
                specialEventText = "You are lucky! While docking on the space port, you receive a message that you won 1000 credits in a lottery. The prize has been added to your account."
                // set button titles and enabled/disabled status
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
            case SpecialEventID.skillIncrease:
                print("not implemented yet")
            case SpecialEventID.cargoForSale:
                print("not implemented yet")
            // subsequent
            case SpecialEventID.artifactDelivery:
                print("not implemented yet")
            case SpecialEventID.dragonflyBaratas:
                print("not implemented yet")
            case SpecialEventID.dragonflyMelina:
                print("not implemented yet")
            case SpecialEventID.dragonflyRegulas:
                print("not implemented yet")
            case SpecialEventID.dragonflyDestroyed:
                print("not implemented yet")
            case SpecialEventID.lightningShield:
                print("not implemented yet")
            case SpecialEventID.disasterAverted:
                print("not implemented yet")
            case SpecialEventID.experimentFailed:
                print("not implemented yet")
            case SpecialEventID.gemulonInvaded:
                print("not implemented yet")
            case SpecialEventID.gemulonRescued:
                print("not implemented yet")
            case SpecialEventID.fuelCompactor:
                print("not implemented yet")
            case SpecialEventID.medicineDelivery:
                print("not implemented yet")
            case SpecialEventID.jarekGetsOut:
                print("not implemented yet")
            case SpecialEventID.princessCentauri:
                print("not implemented yet")
            case SpecialEventID.princessInthara:
                print("not implemented yet")
            case SpecialEventID.princessQonos:
                print("not implemented yet")
            case SpecialEventID.princessReturned:
                print("not implemented yet")
            case SpecialEventID.installQuantumDisruptor:
                print("not implemented yet")
            case SpecialEventID.retirement:
                print("not implemented yet")
            case SpecialEventID.reactorDelivered:
                print("not implemented yet")
            case SpecialEventID.installMorgansLaser:
                print("not implemented yet")
            case SpecialEventID.scarabDestroyed:
                print("not implemented yet")
            case SpecialEventID.upgradeHull:
                print("not implemented yet")
            case SpecialEventID.sculptureDelivered:
                print("not implemented yet")
            case SpecialEventID.installHiddenCompartments:
                print("not implemented yet")
            case SpecialEventID.monsterKilled:
                print("not implemented yet")
            case SpecialEventID.wildGetsOut:
                print("not implemented yet")
            case SpecialEventID.tribbleBuyer:
                print("not implemented yet")
            }
        }
        
    }
    
    func yesDismissButton() {
        switch galaxy.currentSystem!.specialEvent! {
            // initial
        case SpecialEventID.alienArtifact:
            print("not implemented yet")
        case SpecialEventID.dragonfly:
            print("not implemented yet")
        case SpecialEventID.dangerousExperiment:
            print("not implemented yet")
        case SpecialEventID.gemulonInvasion:
            print("not implemented yet")
        case SpecialEventID.japoriDisease:
            print("not implemented yet")
        case SpecialEventID.ambassadorJarek:
            print("not implemented yet")
        case SpecialEventID.princess:
            print("not implemented yet")
        case SpecialEventID.moonForSale:
            print("not implemented yet")
        case SpecialEventID.morgansReactor:
            print("not implemented yet")
        case SpecialEventID.scarabStolen:
            print("not implemented yet")
        case SpecialEventID.sculpture:
            print("not implemented yet")
        case SpecialEventID.spaceMonster:
            print("not implemented yet")
        case SpecialEventID.wild:
            print("not implemented yet")
        case SpecialEventID.merchantPrice:
            print("not implemented yet")
        case SpecialEventID.eraseRecord:
            print("not implemented yet")
        case SpecialEventID.lotteryWinner:
            player.credits += 1000
            
        case SpecialEventID.skillIncrease:
            print("not implemented yet")
        case SpecialEventID.cargoForSale:
            print("not implemented yet")
            
            // subsequent
        case SpecialEventID.artifactDelivery:
            print("not implemented yet")
        case SpecialEventID.dragonflyBaratas:
            print("not implemented yet")
        case SpecialEventID.dragonflyMelina:
            print("not implemented yet")
        case SpecialEventID.dragonflyRegulas:
            print("not implemented yet")
        case SpecialEventID.dragonflyDestroyed:
            print("not implemented yet")
        case SpecialEventID.lightningShield:
            print("not implemented yet")
        case SpecialEventID.disasterAverted:
            print("not implemented yet")
        case SpecialEventID.experimentFailed:
            print("not implemented yet")
        case SpecialEventID.gemulonInvaded:
            print("not implemented yet")
        case SpecialEventID.gemulonRescued:
            print("not implemented yet")
        case SpecialEventID.fuelCompactor:
            print("not implemented yet")
        case SpecialEventID.medicineDelivery:
            print("not implemented yet")
        case SpecialEventID.jarekGetsOut:
            print("not implemented yet")
        case SpecialEventID.princessCentauri:
            print("not implemented yet")
        case SpecialEventID.princessInthara:
            print("not implemented yet")
        case SpecialEventID.princessQonos:
            print("not implemented yet")
        case SpecialEventID.princessReturned:
            print("not implemented yet")
        case SpecialEventID.installQuantumDisruptor:
            print("not implemented yet")
        case SpecialEventID.retirement:
            print("not implemented yet")
        case SpecialEventID.reactorDelivered:
            print("not implemented yet")
        case SpecialEventID.installMorgansLaser:
            print("not implemented yet")
        case SpecialEventID.scarabDestroyed:
            print("not implemented yet")
        case SpecialEventID.upgradeHull:
            print("not implemented yet")
        case SpecialEventID.sculptureDelivered:
            print("not implemented yet")
        case SpecialEventID.installHiddenCompartments:
            print("not implemented yet")
        case SpecialEventID.monsterKilled:
            print("not implemented yet")
        case SpecialEventID.wildGetsOut:
            print("not implemented yet")
        case SpecialEventID.tribbleBuyer:
            print("not implemented yet")
        }

    }
    
    func noButton() {
        switch galaxy.currentSystem!.specialEvent! {
            // initial
        case SpecialEventID.alienArtifact:
            print("not implemented yet")
        case SpecialEventID.dragonfly:
            print("not implemented yet")
        case SpecialEventID.dangerousExperiment:
            print("not implemented yet")
        case SpecialEventID.gemulonInvasion:
            print("not implemented yet")
        case SpecialEventID.japoriDisease:
            print("not implemented yet")
        case SpecialEventID.ambassadorJarek:
            print("not implemented yet")
        case SpecialEventID.princess:
            print("not implemented yet")
        case SpecialEventID.moonForSale:
            print("not implemented yet")
        case SpecialEventID.morgansReactor:
            print("not implemented yet")
        case SpecialEventID.scarabStolen:
            print("not implemented yet")
        case SpecialEventID.sculpture:
            print("not implemented yet")
        case SpecialEventID.spaceMonster:
            print("not implemented yet")
        case SpecialEventID.wild:
            print("not implemented yet")
        case SpecialEventID.merchantPrice:
            print("not implemented yet")
        case SpecialEventID.eraseRecord:
            print("not implemented yet")
        case SpecialEventID.lotteryWinner:
            print("not implemented yet")
        case SpecialEventID.skillIncrease:
            print("not implemented yet")
        case SpecialEventID.cargoForSale:
            print("not implemented yet")
            
            // subsequent
        case SpecialEventID.artifactDelivery:
            print("not implemented yet")
        case SpecialEventID.dragonflyBaratas:
            print("not implemented yet")
        case SpecialEventID.dragonflyMelina:
            print("not implemented yet")
        case SpecialEventID.dragonflyRegulas:
            print("not implemented yet")
        case SpecialEventID.dragonflyDestroyed:
            print("not implemented yet")
        case SpecialEventID.lightningShield:
            print("not implemented yet")
        case SpecialEventID.disasterAverted:
            print("not implemented yet")
        case SpecialEventID.experimentFailed:
            print("not implemented yet")
        case SpecialEventID.gemulonInvaded:
            print("not implemented yet")
        case SpecialEventID.gemulonRescued:
            print("not implemented yet")
        case SpecialEventID.fuelCompactor:
            print("not implemented yet")
        case SpecialEventID.medicineDelivery:
            print("not implemented yet")
        case SpecialEventID.jarekGetsOut:
            print("not implemented yet")
        case SpecialEventID.princessCentauri:
            print("not implemented yet")
        case SpecialEventID.princessInthara:
            print("not implemented yet")
        case SpecialEventID.princessQonos:
            print("not implemented yet")
        case SpecialEventID.princessReturned:
            print("not implemented yet")
        case SpecialEventID.installQuantumDisruptor:
            print("not implemented yet")
        case SpecialEventID.retirement:
            print("not implemented yet")
        case SpecialEventID.reactorDelivered:
            print("not implemented yet")
        case SpecialEventID.installMorgansLaser:
            print("not implemented yet")
        case SpecialEventID.scarabDestroyed:
            print("not implemented yet")
        case SpecialEventID.upgradeHull:
            print("not implemented yet")
        case SpecialEventID.sculptureDelivered:
            print("not implemented yet")
        case SpecialEventID.installHiddenCompartments:
            print("not implemented yet")
        case SpecialEventID.monsterKilled:
            print("not implemented yet")
        case SpecialEventID.wildGetsOut:
            print("not implemented yet")
        case SpecialEventID.tribbleBuyer:
            print("not implemented yet")
        }
    }
    
    func addQuestString(string: String, ID: QuestID) {
        // empty string removes this quest
        var index = 0
        var indexOfThisQuestString: Int?
        for quest in quests {
            if quest.1 == ID {
                indexOfThisQuestString = index
            }
            index += 1
        }
        if indexOfThisQuestString != nil {
            if string == "" {
                // delete this quest
                quests.removeAtIndex(indexOfThisQuestString!)
            } else {
                // update this quest
                quests[indexOfThisQuestString!] = (string, ID)
            }
            
        } else {
            // add quest if not already present
            quests.append((string, ID))
        }
        
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

enum QuestID {
    case artifact
    case dragonfly
    case experiment
    case gemulon
    case japori
    case jarek
    case princess
    case moon
    case reactor
    case scarab
    case sculpture
    case spaceMonster
    case tribbles
}
