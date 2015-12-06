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
                specialEventTitle = "Alien Artifact"
                specialEventText = "This alien artifact should be delivered to professor Berger, who is currently traveling. You can probably find him at a hi-tech solar system. The alien race which produced this artifact seems keen on getting it back, however, and may hinder the carrier. Are you, for a price, willing to deliver it?"
                yesDismissButtonText = "Yes"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.dragonfly:
                specialEventTitle = "Dragonfly"
                specialEventText = "This is Colonel Jackson of the Space Corps. An experimental ship, code-named \"Dragonfly\", has been stolen. It is equipped with very special, almost indestructible shields. It shouldn't fall into the wrong hands and we will reward you if you destroy it. It has been last seen in the Baratas system."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.dangerousExperiment:
                specialEventTitle = "Dangerous Experiment"
                specialEventText = "While reviewing the plans for Dr. Fehler's new space-warping drive, Dr. Lowenstam discovered a critical error. If you don't go to Daled and stop the experiment within ten days, the time-space continuum itself could be damaged!"
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.gemulonInvasion:
                specialEventTitle = "Alien Invasion"
                specialEventText = "We received word that aliens will invade Gemulon seven days from now. We know exactly at which coordinates they will arrive, but we can't warn Gemulon because an ion storm disturbs all forms of communication. We need someone, anyone, to deliver this info to Gemulon within six days."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.japoriDisease:
                specialEventTitle = "Japori Disease"
                specialEventText = "A strange disease has invaded the Japori system. We would like you to deliver these ten canisters of special antidote to Japori. Note that, if you accept, ten of your cargo bays will remain in use on your way to Japori. Do you accept this mission?"
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false

            case SpecialEventID.ambassadorJarek:
                specialEventTitle = "Ambassador Jarek"
                specialEventText = "A recent change in the political climate of this solar system has forced Ambassador Jarek to flee back to his home system, Devidia. Would you be willing to give him a lift?"
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.princess:
                specialEventTitle = "Kidnapped"
                specialEventText = "A member of the Royal Family of Galvon has been kidnapped! Princess Ziyal was abducted by men while travelling across the planet. They escaped in a hi-tech ship called the Scorpion. Please rescue her! (You'll need to equip your ship with disruptors to be able to defeat the Scorpion without destroying it.) A ship bristling with weapons was blasting out of the system. It's trajectory before going to warp indicates that its destination was Centauri."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.moonForSale:
                specialEventTitle = "Moon for Sale"
                specialEventText = "There is a small but habitable moon for sale in the Utopia system, for the very reasonable sum of half a million credits. If you accept it, you can retire to it and live a peaceful, happy, and wealthy life. Do you wish to buy it?"
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.morgansReactor:
                specialEventTitle = "Morgan's Reactor"
                specialEventText = "Galactic criminal Henry Morgan wants this illegal ion reactor delivered to Nix. It's a very dangerous mission! The reactor and its fuel are bulky, taking up 15 bays. Worse, it's not stable -- its resonant energy will weaken your shields and hull strength while it's aboard your ship. Are you willing to deliver it?"
                yesDismissButtonText = "Yes"
                noButtonText = "No"
                noButtonEnabled = true
                
            case SpecialEventID.scarabStolen:
                specialEventTitle = "Scarab Stolen"
                specialEventText = "Captain Renwick developed a new organic hull material for his ship which cannot be damaged except by Pulse lasers. While he was celebrating this success, pirates boarded and stole the craft, which they have named the Scarab. Rumors suggest it's being hidden at the exit to a wormhole. Destroy the ship for a reward!"
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.sculpture:
                specialEventTitle = "Stolen Sculpture"
                specialEventText = "A hooded figure approaches you and asks if you'd be willing to deliver some recently aquired merchandise to Endor. He's holding a small sculpture of a man holding some kind of light sword that you strongly suspect was stolen. It appears to be made of plastic and not very valuable. \"I'll pay you 2,000 credits now, plus 15,000 on delivery,\" the figure says. After seeing the look on your face he adds, \"It's a collector's item. Will you deliver it or not?\""
                yesDismissButtonText = "Yes"
                noButtonText = "No"
                noButtonEnabled = true
                
            case SpecialEventID.spaceMonster:
                specialEventTitle = "Space Monster"
                specialEventText = "A space monster has invaded the Acamar system and is disturbing the trade routes. You'll be rewarded handsomely if you manage to destroy it."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.wild:
                specialEventTitle = "Jonathan Wild"
                specialEventText = "Law Enforcement is closing in on notorious criminal kingpin Jonathan Wild. He would reward you handsomely for smuggling him home to Kravat. You'd have to avoid capture by the Police on the way. Are you willing to give him a berth?"
                yesDismissButtonText = "Yes"
                noButtonText = "No"
                noButtonEnabled = true
                
            case SpecialEventID.merchantPrice:
                specialEventTitle = "Merchant Prince"
                specialEventText = "A merchant prince offers you a very special and wondrous item for the sum of 1000 credits. Do you accept?"
                yesDismissButtonText = "Yes"
                noButtonText = "No"
                noButtonEnabled = true
                
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
                specialEventTitle = "Skill Increase"
                specialEventText = "An alien with a fast-learning machine offers to increase one of your skills for the reasonable sum of 3000 credits. You won't be able to pick that skill, though. Do you accept his offer?"
                yesDismissButtonText = "Yes"
                noButtonText = "No"
                noButtonEnabled = true
                
            case SpecialEventID.cargoForSale:
                specialEventTitle = "Cargo For Sale"
                specialEventText = "A trader in second-hand goods offers you 3 sealed cargo canisters for the sum of 1000 credits. It could be a good deal: they could contain robots. Then again, it might just be water. Do you want the canisters?"
                yesDismissButtonText = "Yes"
                noButtonText = "No"
                noButtonEnabled = true
                
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

