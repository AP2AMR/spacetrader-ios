//
//  Journey.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/12/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import Foundation

class Journey {
    let origin: StarSystem
    let destination: StarSystem
    var clicks: Int = 20
    
    var pirate = false
    var police = false
    var trader = false
    
    var mantis = false
    
    var openEncounter = false
    
    let localPolitics = Politics(type: galaxy.currentSystem!.politics)
    
    let strengthPirates: Int
    let strengthPolice: Int
    let strengthTraders: Int
    
    var encounterTest: Int
    var uneventfulTrip = true
    
    
    init(origin: StarSystem, destination: StarSystem) {
        self.origin = origin
        self.destination = destination
        
        strengthPirates = localPolitics.activityPirates
        strengthPolice = localPolitics.activityPolice
        strengthTraders = localPolitics.activityTraders
        
        self.encounterTest = Int(arc4random_uniform(UInt32(44 - (2 * player.getDifficultyInt()))))

        // encounters are half as likely if you're in a flea
        if player.commanderShip.type == ShipType.Flea {
            self.encounterTest = encounterTest / 2
        }
    }
    
    func beginJourney() {
        // SHORT CIRCUIT, FOR TESTING PURPOSES ONLY
        //completeJourney()
        
        print("**************************************************************")
        print("WARP SEQUENCE INITIATED")
        
        // I don't think there's actually anything to do here?
        
        resumeJourney()
        
    }
    
    func resumeJourney() {
        if !openEncounter {
            if clicks > 0 {
                executeClick()
            } else {
                completeJourney()
            }
        } else {
            // carry on with current encounter
        }
        
        
    }
    
    func executeClick() {
        var encounterThisClick = false
        
        // engineer may do some repairs
        let repairs = Int(arc4random_uniform(UInt32(player.engineerSkill))) / 2     // BUG DANGER THIS FAILED ONCE
        player.commanderShip.hull += repairs
        if player.commanderShip.hull >= player.commanderShip.hullStrength {
            player.commanderShip.hull = player.commanderShip.hullStrength
        }
        
        // slowly heal shields
        for shield in player.commanderShip.shield {
            shield.currentStrength += repairs
            if shield.currentStrength >= shield.power {
                shield.currentStrength = shield.power
            }
        }
        
        // Special, specific encounter?
        // encounter with space monster at acamar?
        // encounter with stolen scarab?
        // encounter with stolen dragonfly?
        // encounter with alien mantis at Gemulon if invasion happened?
        
        // ELSE, check if it is time for an encounter
        
        // determine if there will be an encounter, and with whom
        if (encounterTest < strengthPirates) && !player.commanderShip.raided {
            pirate = true
        } else if encounterTest < (strengthPirates + strengthPolice) {
            police = true
        } else if encounterTest < (strengthTraders / 2) {       // not orthodox, but this seemed high
            trader = true
        } // else if Wild status/Kravat...
        
        if !pirate && !police && !trader {
            if player.commanderShip.artifactOnBoard && (arc4random_uniform(20) <= 3) {
                // mantis
                mantis = true
                print("MANTIS ENCOUNTER AT \(clicks) CLICKS")
            }
        }
        
        // create encounter
        if pirate {
            print("PIRATE ENCOUNTER AT \(clicks) CLICKS")
        } else if police {
            print("POLICE ENCOUNTER AT \(clicks) CLICKS")
        } else if trader {
            print("TRADER ENCOUNTER AT \(clicks) CLICKS")
        }
        
        // very rare event
        if !pirate && !police && !trader && !mantis {
            if (player.days > 10) && (arc4random_uniform(1000) < 5) {
                print("VERY RARE ENCOUNTER")
            } else if player.commanderShip.justLootedMarieCeleste {
                print("CHANCE OF POLICE ENCOUNTER OVER MARIE CELESTE")
                player.commanderShip.justLootedMarieCeleste = false
            }
        }
        
        if pirate || police || trader || mantis {
            uneventfulTrip = false
            encounterThisClick = true
        }
        
        pirate = false
        police = false
        trader = false
        mantis = false
        clicks -= 1
        
        if !encounterThisClick {
            executeClick()
        } else {
            print("Encounter at \(clicks) clicks. Stopping execution until encounter handled.")
            print("(except actually not, for testing purposes)")
        }
    }

    
    func completeJourney() {            // accomplishes warp, decrements fuel, updates galaxy
        let journeyDistance = galaxy.getDistance(galaxy.currentSystem!, system2: galaxy.targetSystem!)
        let oldSystem = galaxy.currentSystem
        galaxy.currentSystem = galaxy.targetSystem
        galaxy.currentSystem!.visited = true
        galaxy.getSystemsInRange()
        galaxy.updateGalaxy()          // now just increments days and runs shuffleStatus. Will eventially hold special event related things
        galaxy.updateQuantities()      // reset quantities with time
        
        var travelByWormhole = false
        if oldSystem!.wormhole {
            if galaxy.currentSystem!.name == oldSystem!.wormholeDestination!.name {
                travelByWormhole = true
            }
        }
        if !travelByWormhole {
            player.commanderShip.fuel -= journeyDistance
        }
        
        galaxy.getSystemsInRange()
    }
    
    func generateEncounters() {         // OLD, but with useful code
        
        
        // handle possibility of spacetime rip

        while clicks > 0 {
            
        }
        
        // arrive
        if uneventfulTrip {
            print("After an uneventful trip, you arrive at your destination")
            uneventfulTrip = true
        } else {
            print("Arrival alert goes here.")
        }
        
        if player.debt > 75000 {
            print("LARGE DEBT WARNING")
        }
        
        if player.debt > 0 && player.remindLoans && (player.days % 5 == 0) {
            print("LOAN REMINDER")
        }
        
        // reactor warnings?
        
        // if arrived at tracked system, set tracked system to nil
        
        // tribbles:
        // if present, increase their number
        // handle irradiated tribbles
        // handle high tribbles
        // handle tribbles eating food
        // if tribbles increased past certain thresholds, trigger alert
        
        // autofuel & autorepair
        
        // Og system lightning shield easter egg?
    }
    
    // code for triggering modal
    
    //    let encounterString = NSString(string: "At \(clicks) clicks from \(galaxy.currentSystem!.name) you encounter a \(type) <shiptype>.")
    //    NSNotificationCenter.defaultCenter().postNotificationName("messageNotification", object: encounterString)
}