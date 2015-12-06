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
    var artifactOnBoard = false
    var wildOnBoard = false
    var reactorOnBoard = false
    var tribblesOnBoard = false
    var tribbleCount = 0
    
    var experimentCountdown = -1
    var jarekElapsedTime = -1
    var gemulonInvasionCountdown = -1
    
    
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
                specialEventTitle = "Artifact Delivery"
                specialEventText = "This is professor Berger. I thank you for delivering the alien artifact to me. I hope the aliens weren't too much of a nuisance. I have transferred 20000 credits to your account, which I assume compensates for your troubles."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.dragonflyBaratas:
                specialEventTitle = "Weird Ship"
                specialEventText = "A small ship of a weird design docked here recently for repairs. The engineer who worked on it said that it had a weak hull, but incredibly strong shields. I heard it took off in the direction of the Melina system."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.dragonflyMelina:
                specialEventTitle = "Lightning Ship"
                specialEventText = "A ship with shields that seemed to be like lightning recently fought many other ships in our system. I have never seen anything like it before. After it left, I heard it went to the Regulas system."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.dragonflyRegulas:
                specialEventTitle = "Strange Ship"
                specialEventText = "A small ship with shields like I have never seen before was here a few days ago. It destroyed at least ten police ships! Last thing I heard was that it went to the Zalkon system."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.dragonflyDestroyed:
                specialEventTitle = "Dragonfly Destroyed"
                specialEventText = "Hello, Commander. This is Colonel Jackson again. On behalf of the Space Corps, I thank you for your valuable assistance in destroying the Dragonfly. As a reward, we will install one of the experimental shields on your ship. Return here for that when you're ready."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.lightningShield:
                specialEventTitle = "Lightning Shield"
                specialEventText = "Colonel Jackson here. Do you want us to install a lightning shield on your current ship?"
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.disasterAverted:
                specialEventTitle = "Disaster Averted"
                specialEventText = "Upon your warning, Dr. Fehler calls off the experiment. As your  reward, you are given a Portable Singularity. This device will, for one time only, instantaneously transport you to any system in the galaxy. The Singularity can be accessed by pressing the \"jump\" button on the Galactic Chart."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.experimentFailed:
                specialEventTitle = "Experiment Failed"
                specialEventText = "Dr. Fehler can't understand why the experiment failed. But the failure has had a dramatic and disastrous effect on the fabric of space-time itself. It seems that Dr. Fehler won't be getting tenure any time soon... and you may have trouble when you warp!"
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.gemulonInvaded:
                specialEventTitle = "Gemulon Invaded"
                specialEventText = "Alas, Gemulon has been invaded by aliens, which has thrown us back to pre-agricultural times. If only we had known the exact coordinates where they first arrived at our system, we might have prevented this tragedy from happening."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.gemulonRescued:
                specialEventTitle = "Gemulon Rescued"
                specialEventText = "This information of the arrival of the alien invasion force allows us to prepare a defense. You have saved our way of life. As a reward, we have a fuel compactor gadget for you, which will increase the travel distance by 3 parsecs for any ship. Return here to get it installed."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.fuelCompactor:
                specialEventTitle = "Fuel Compactor"
                specialEventText = "Do you wish us to install the fuel compactor on your current ship? (You need a free gadget slot)"
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.medicineDelivery:
                specialEventTitle = "Medicine Delivery"
                specialEventText = "Thank you for delivering the medicine to us. We don't have any money to reward you, but we do have an alien fast-learning machine with which we will increase your skills."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.jarekGetsOut:
                specialEventTitle = "Jarek Gets Out"
                specialEventText = "Ambassador Jarek is very grateful to you for delivering him back to Devidia. As a reward, he gives you an experimental handheld haggling computer, which allows you to gain larger discounts when purchasing goods and equipment."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.princessCentauri:
                specialEventTitle = "Dangerous Scorpion"
                specialEventText = "A ship had its shields upgraded to Lighting Shields just two days ago. A shipyard worker overheard one of the crew saying they were headed to Inthara."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.princessInthara:
                specialEventTitle = "Agressive Ship"
                specialEventText = "Just yesterday a ship was seen in docking bay 327. A trader sold goods to a member of the crew, who was a native of Qonos. It's possible that's where they were going next."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.princessQonos:
                specialEventTitle = "Royal Rescue"
                specialEventText = "The Galvonian Ambassador to Qonos approaches you. The Princess needs a ride home. Will you take her? I don't think she'll feel safe with anyone else."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.princessReturned:
                specialEventTitle = "Royal Return"
                specialEventText = "The King and Queen are extremely grateful to you for returning their daughter to them. The King says, \"Ziyal is priceless to us, but we feel we must offer you something as a reward. Visit my shipyard captain and he'll install one of our new Quantum Disruptors.\""
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.installQuantumDisruptor:
                specialEventTitle = "Quantum Disruptor"
                specialEventText = "His Majesty's Shipyard: Do you want us to install a quantum disruptor on your current ship?"
                yesDismissButtonText = "Yes"
                noButtonText = "No"
                noButtonEnabled = true
                
            case SpecialEventID.retirement:
                specialEventTitle = "Retirement"
                specialEventText = "Welcome to the Utopia system. Your own moon is available for you to retire to it, if you feel inclined to do that. Are you ready to retire and lead a happy, peaceful, and wealthy life?"
                yesDismissButtonText = "Yes"
                noButtonText = "No"
                noButtonEnabled = true
                
            case SpecialEventID.reactorDelivered:
                specialEventTitle = "Reactor Delivered"
                specialEventText = "Henry Morgan takes delivery of the reactor with great glee. His men immediately set about stabilizing the fuel system. As a reward, Morgan offers you a special, high-powered laser that he designed. Return with an empty weapon slot when you want them to install it."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.installMorgansLaser:
                specialEventTitle = "Install Morgan's Laser"
                specialEventText = "Morgan's technicians are standing by with something that looks a lot like a military laser -- if you ignore the additional cooling vents and anodized ducts. Do you want them to install Morgan's special laser?"
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.scarabDestroyed:
                specialEventTitle = "Scarab Destroyed"
                specialEventText = "Space Corps is indebted to you for destroying the Scarab and the pirates who stole it. As a reward, we can have Captain Renwick upgrade the hull of your ship. Note that his upgrades won't be transferable if you buy a new ship! Come back with the ship you wish to upgrade."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.upgradeHull:
                specialEventTitle = "Upgrade Hull"
                specialEventText = "The organic hull used in the Scarab is still not ready for day-to-day use. But Captain Renwick can certainly upgrade your hull with some of his retrofit technology. It's light stuff, and won't reduce your ship's range. Should he upgrade your ship?"
                yesDismissButtonText = "Yes"
                noButtonText = "No"
                noButtonEnabled = true
                
            case SpecialEventID.sculptureDelivered:
                specialEventTitle = "Sculpture Delivered"
                specialEventText = "Yet another dark, hooded figure approaches. \"Do you have the action fig- umm, the sculpture?\" You hand it over and hear what sounds very much like a giggle from under the hood. \"I know you were promised 15,000 credits on delivery, but I'm strapped for cash right now. However, I have something better for you. I have an acquaintance who can install hidden compartments in your ship.\" Return with an empty gadget slot when you're ready to have it installed."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.installHiddenCompartments:
                specialEventTitle = "Install Hidden Compartments"
                specialEventText = "You're taken to a warehouse and whisked through the door. A grubby alien of some humanoid species - you're not sure which one - approaches. \"So you're the being who needs Hidden Compartments. Should I install them in your ship?\" (It requires a free gadget slot.)"
                yesDismissButtonText = "Yes"
                noButtonText = "No"
                noButtonEnabled = true
                
            case SpecialEventID.monsterKilled:
                specialEventTitle = "Monster Killed"
                specialEventText = "We thank you for destroying the space monster that ircled our system for so long. Please accept 15000 credits as reward for your heroic deed."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.wildGetsOut:
                specialEventTitle = "Wild Gets Out"
                specialEventText = "Jonathan Wild is most grateful to you for spiriting him to safety. As a reward, he has one of his Cyber Criminals hack into the Police Database, and clean up your record. He also offers you the opportunity to take his talented nephew Zeethibal along as a Mercenary with no pay."
                yesDismissButtonText = "Ok"
                //noButtonText = ""
                noButtonEnabled = false
                
            case SpecialEventID.tribbleBuyer:
                specialEventTitle = "Tribble Buyer"
                specialEventText = "An eccentric alien billionaire wants to buy your collection of tribbles and offers half a credit for each of them. Do you accept his offer?"
                yesDismissButtonText = "Yes"
                noButtonText = "No"
                noButtonEnabled = true
                
            }
        }
        
    }
    
    func yesDismissButton() {
        switch galaxy.currentSystem!.specialEvent! {
            // initial
        case SpecialEventID.alienArtifact:
            addQuestString("Deliver the alien artifact to Professor Berger at some hi-tech system.", ID: QuestID.artifact)
            // add artifact delivery to some high tech system without a specialEvent set
            for planet in galaxy.planets {
                if planet.techLevel == TechLevelType.techLevel7 {
                    if planet.specialEvent == nil {
                        galaxy.setSpecial(planet.name, id: SpecialEventID.artifactDelivery)
                    }
                }
            }
            artifactOnBoard = true
            
        case SpecialEventID.dragonfly:
            addQuestString("Follow the Dragonfly to Melina.", ID: QuestID.dragonfly)
            galaxy.setSpecial("Melina", id: SpecialEventID.dragonflyMelina)
            
        case SpecialEventID.dangerousExperiment:
            experimentCountdown = 10
            addQuestString("Stop Dr. Fehler's experiment at Daled within \(experimentCountdown) days.", ID: QuestID.experiment)
        case SpecialEventID.gemulonInvasion:
            gemulonInvasionCountdown = 7
            addQuestString("Inform Gemulon about alien invasion within \(gemulonInvasionCountdown) days.", ID: QuestID.gemulon)
            galaxy.setSpecial("Gemulon", id: SpecialEventID.gemulonRescued)
            
        case SpecialEventID.japoriDisease:
            // quest
            addQuestString("Deliver antidote to Japori.", ID: QuestID.japori)
            // create new special in Japori--medicineDelivery
            galaxy.setSpecial("Japori", id: SpecialEventID.medicineDelivery)
            
        case SpecialEventID.ambassadorJarek:
            jarekElapsedTime = 0
            addQuestString("Take ambassador Jarek to Devidia.", ID: QuestID.jarek)
            galaxy.setSpecial("Devidia", id: SpecialEventID.jarekGetsOut)
            // **** MAKE SURE YOU CAN ADD JAREK TO THE CREW
            // **** ADD JAREK TO CREW, MAKE HIS SKILLS COUNT (see how this works)
            
        case SpecialEventID.princess:
            addQuestString("Follow the Scorpion to Centauri.", ID: QuestID.princess)
            galaxy.setSpecial("Centauri", id: SpecialEventID.princessCentauri)
            
        case SpecialEventID.moonForSale:
            addQuestString("Claim your moon at Utopia.", ID: QuestID.moon)
            galaxy.setSpecial("Utopia", id: SpecialEventID.retirement)

        case SpecialEventID.morgansReactor:
            
            
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
    
    func messUpSpacetime() {
        // called when/if the experiment fails. Sets warp wrinkle business
        print("not implemented yet, but assume spacetime is now fucked up")
    }
    
    func incrementCountdown() {
        // is called every day on warp, decrements each countdown. Checks if they are zero, acts accordingly if so
        
        // experiment
        if experimentCountdown != -1 {
            experimentCountdown -= 1
            
            if experimentCountdown == 1 {
                addQuestString("Stop Dr. Fehler's experiment at Daled by tomorrow.", ID: QuestID.experiment)
            } else if experimentCountdown == 0 {
                experimentCountdown = -1    // inactivate counter
                addQuestString("", ID: QuestID.experiment)  // inactivate quest
                messUpSpacetime()
                galaxy.setSpecial("Daled", id: SpecialEventID.experimentFailed)
            }
        }
        
        // jarek
        if jarekElapsedTime != -1 {
            jarekElapsedTime += 1
            
            if jarekElapsedTime > 10 {
                // jarek gets less helpful
                addQuestString("Jarek is wondering why the journey is taking so long, and is no longer of much help in negotiating trades.", ID: QuestID.jarek)
                // **** CREATE JAREK ALERT
                // **** CHANGE JAREK STATUS TO BE LESS HELPFUL
            }
        }
        
        // gemulon
        if gemulonInvasionCountdown != -1 {
            gemulonInvasionCountdown -= 1
            
            if gemulonInvasionCountdown == 1 {
                addQuestString("Inform Gemulon about alien invasion by tomorrow.", ID: QuestID.gemulon)
            }
            
            if gemulonInvasionCountdown == 0 {
                gemulonInvasionCountdown == -1              // inactivate countdown
                addQuestString("", ID: QuestID.gemulon)     // inactivate quest
                galaxy.setSpecial("Gemulon", id: SpecialEventID.gemulonInvaded)
            }
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

class Quest {
    let ID: QuestID
    var questString: String
    var completed = false
    
    init(ID: QuestID, questString: String) {
        self.ID = ID
        self.questString = questString
    }
}

