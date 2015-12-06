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
    var quests: [Quest] = []
    
    // state variables (e.g. wildOnBoard, artifactOnBoard), counters (e.g. gemulonInvasionCountdown, experimentCountdown)
    
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
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.dragonfly:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.dangerousExperiment:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.gemulonInvasion:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.japoriDisease:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false

            case SpecialEventID.ambassadorJarek:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.princess:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.moonForSale:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.morgansReactor:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.scarabStolen:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.sculpture:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.spaceMonster:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.wild:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.merchantPrice:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.eraseRecord:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.lotteryWinner:
                specialEventTitle = "Lottery Winner"
                specialEventText = "You are lucky! While docking on the space port, you receive a message that you won 1000 credits in a lottery. The prize has been added to your account."
                // set button titles and enabled/disabled status
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.skillIncrease:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.cargoForSale:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            // subsequent
            case SpecialEventID.artifactDelivery:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.dragonflyBaratas:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.dragonflyMelina:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.dragonflyRegulas:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.dragonflyDestroyed:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.lightningShield:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.disasterAverted:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.experimentFailed:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.gemulonInvaded:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.gemulonRescued:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.fuelCompactor:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.medicineDelivery:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.jarekGetsOut:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.princessCentauri:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.princessInthara:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.princessQonos:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.princessReturned:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.installQuantumDisruptor:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.retirement:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.reactorDelivered:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.installMorgansLaser:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.scarabDestroyed:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.upgradeHull:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.sculptureDelivered:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.installHiddenCompartments:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.monsterKilled:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.wildGetsOut:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.tribbleBuyer:
                specialEventTitle = ""
                specialEventText = ""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
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
            // quest
            addQuestString("Deliver antidote to Japori.", ID: QuestID.japori)
            // create new special in Japori--medicineDelivery
            galaxy.setSpecial("Japori", id: SpecialEventID.medicineDelivery)
            
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
        // I think this function might be unnecessary. No might just need to dismiss the modal.
        // Do declined quests ever need to go away?
    }
    
    func addQuestString(string: String, ID: QuestID) {
        // empty string removes this quest
        var found = false
        for quest in quests {
            if quest.ID == ID {
                found = true
                if string != "" {
                    // update if string
                    quest.questString = string
                } else {
                    // set as completed
                    quest.questString = ""
                    quest.completed = true
                }
            }
        }
        if !found {
            quests.append(Quest(ID: ID, questString: string))
        }
    }
    
    func incrementCountdown() {
        // is called every day on warp, decrements each countdown. Checks if they are zero, acts accordingly if so
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

class Quest {
    let ID: QuestID
    var questString: String
    var completed = false
    
    init(ID: QuestID, questString: String) {
        self.ID = ID
        self.questString = questString
    }
}

