//
//  Galaxy.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation
import UIKit

class Galaxy {
    var planets: [StarSystem] = []
    
    func createGalaxy() {
        print("Initializing galaxy...")
        
        // populate availableNames
        var availableNames: [String] = ["Acamar", "Adhan", "Aldea", "Andevian", "Balosnee", "Baratas", "Brax", "Bretel", "Calondia", "Campor", "Capelle", "Carzon", "Castor", "Cestus", "Cheron", "Courtney", "Daled", "Damast", "Davlos", "Deneb", "Deneva", "Devidia", "Draylon", "Drema", "Endor", "Esmee", "Exo", "Ferris", "Festen", "Fourmi", "Frolix", "Gemulon", "Guinifer", "Hades", "Hamlet", "Helena", "Hulst", "Iodine", "Iralius", "Janus", "Japori", "Jarada", "Jason", "Kaylon", "Khefka", "Kira", "Klaatu", "Klaestron", "Korma", "Kravat", "Krios", "Laertes", "Largo", "Lave", "Ligon", "Lowry", "Magrat", "Malcoria", "Melina", "Mentar", "Merik", "Mintaka", "Montor", "Mordan", "Myrthe", "Nelvana", "Nix", "Nyle", "Odet", "Og", "Omega", "Omphalos", "Orias", "Othello", "Parade", "Penthara", "Picard", "Pollux", "Quator", "Rakhar", "Ran", "Regulas", "Relva", "Rhymus", "Rochani", "Rubicum", "Rutia", "Rutia", "Sarpeidon", "Sefalla", "Seltrice", "Sigma", "Sol", "Somari", "Stakoron", "Styris", "Talani", "Tamus", "Tantalos", "Tanuga", "Tarchannen", "Terosa", "Thera", "Titan", "Torin", "Triacus", "Turkana", "Tyrus", "Umberlee", "Utopia", "Vadera", "Varga", "Vandor", "Ventax", "Xenon", "Xerxes", "Yew", "Yojimbo", "Zalkon", "Zuul"]
        
        var i: Int = 0
        while i < MAXSOLARSYSTEM {
            let newStarSystem = StarSystem(name: "NOT SET YET", techLevel: TechLevelType.techLevel0, politics: PoliticsType.anarchy, status: StatusType.none, xCoord: 0, yCoord: 0, specialResources: SpecialResourcesType.none, size: SizeType.Tiny)
            

            if i < MAXWORMHOLE {
                // place each of the six with a wormhole within a square, defined as the middle of each square of the galaxy broken into a 3x2 grid
                switch i {
                case 0:
                    let wUpper: UInt32 = 48
                    let wLower: UInt32 = 2
                    let hUpper: UInt32 = 54
                    let hLower: UInt32 = 2
                    newStarSystem.xCoord = Int(arc4random_uniform(wUpper - wLower) + wLower)
                    newStarSystem.yCoord = Int(arc4random_uniform(hUpper - hLower) + hLower)
                case 1:
                    let wUpper: UInt32 = 98
                    let wLower: UInt32 = 52
                    let hUpper: UInt32 = 54
                    let hLower: UInt32 = 2
                    newStarSystem.xCoord = Int(arc4random_uniform(wUpper - wLower) + wLower)
                    newStarSystem.yCoord = Int(arc4random_uniform(hUpper - hLower) + hLower)
                case 2:
                    let wUpper: UInt32 = 148
                    let wLower: UInt32 = 102
                    let hUpper: UInt32 = 54
                    let hLower: UInt32 = 2
                    newStarSystem.xCoord = Int(arc4random_uniform(wUpper - wLower) + wLower)
                    newStarSystem.yCoord = Int(arc4random_uniform(hUpper - hLower) + hLower)
                case 3:
                    let wUpper: UInt32 = 48
                    let wLower: UInt32 = 2
                    let hUpper: UInt32 = 108
                    let hLower: UInt32 = 56
                    newStarSystem.xCoord = Int(arc4random_uniform(wUpper - wLower) + wLower)
                    newStarSystem.yCoord = Int(arc4random_uniform(hUpper - hLower) + hLower)
                case 4:
                    let wUpper: UInt32 = 98
                    let wLower: UInt32 = 52
                    let hUpper: UInt32 = 108
                    let hLower: UInt32 = 56
                    newStarSystem.xCoord = Int(arc4random_uniform(wUpper - wLower) + wLower)
                    newStarSystem.yCoord = Int(arc4random_uniform(hUpper - hLower) + hLower)
                case 5:
                    let wUpper: UInt32 = 148
                    let wLower: UInt32 = 102
                    let hUpper: UInt32 = 108
                    let hLower: UInt32 = 56
                    newStarSystem.xCoord = Int(arc4random_uniform(wUpper - wLower) + wLower)
                    newStarSystem.yCoord = Int(arc4random_uniform(hUpper - hLower) + hLower)
                default:
                    newStarSystem.xCoord = 100
                    newStarSystem.yCoord = 100
                }
                // set wormhole to true
                newStarSystem.wormhole = true
                
            } else {
                // place others randomly, not closer than 2 from the edge
                let wUpper: UInt32 = 148
                let wLower: UInt32 = 2
                let hUpper: UInt32 = 108
                let hLower: UInt32 = 2
                newStarSystem.xCoord = Int(arc4random_uniform(wUpper - wLower) + wLower)
                newStarSystem.yCoord = Int(arc4random_uniform(hUpper - hLower) + hLower)
                
                
                // make sure each one is no closer than MINDISTANCE to another planet
                var proximityFlag = false
                while !proximityFlag {
                    let wUpper: UInt32 = 148
                    let wLower: UInt32 = 2
                    let hUpper: UInt32 = 108
                    let hLower: UInt32 = 2
                    newStarSystem.xCoord = Int(arc4random_uniform(wUpper - wLower) + wLower)
                    newStarSystem.yCoord = Int(arc4random_uniform(hUpper - hLower) + hLower)
                    proximityFlag = verifyMinDistance(newStarSystem, i: i)
                }
                
                // (later we will verify that all planets are within CLOSEDISTANCE of each other. If they aren't, we'll regenerate their coords until they satisfy this condition)
            }
            
            // SET EVERYTHING ELSE HERE. NAME, TECH, POLITICS, SIZE, STATUS, SPECIAL RESOURCES, INITIAL TRADE ITEMS, WORMHOLE DESTINATION
            
            // name
            let count = UInt32(availableNames.count)
            let nameIndex = Int(arc4random_uniform(count))
            let nameString = availableNames[nameIndex]
            availableNames.removeAtIndex(nameIndex)
            newStarSystem.name = nameString
            newStarSystem.indexNumber = i
            
            // tech level, politics, size--ALL COMPLETELY RANDOM
            let techLevelRand = Int(arc4random_uniform(8))
            switch techLevelRand{
                case 0:
                    newStarSystem.techLevel = TechLevelType.techLevel0
                case 1:
                    newStarSystem.techLevel = TechLevelType.techLevel1
                case 2:
                    newStarSystem.techLevel = TechLevelType.techLevel2
                case 3:
                    newStarSystem.techLevel = TechLevelType.techLevel3
                case 4:
                    newStarSystem.techLevel = TechLevelType.techLevel4
                case 5:
                    newStarSystem.techLevel = TechLevelType.techLevel5
                case 6:
                    newStarSystem.techLevel = TechLevelType.techLevel6
                case 7:
                    newStarSystem.techLevel = TechLevelType.techLevel7
                default:
                    newStarSystem.techLevel = TechLevelType.techLevel8
            }
            
            
            // politics
            let politicsRand = Int(arc4random_uniform(17))
            switch politicsRand {
                case 0:
                    newStarSystem.politics = PoliticsType.anarchy
                case 1:
                    newStarSystem.politics = PoliticsType.capitalist
                case 2:
                    newStarSystem.politics = PoliticsType.communist
                case 3:
                    newStarSystem.politics = PoliticsType.confederacy
                case 4:
                    newStarSystem.politics = PoliticsType.corporate
                case 5:
                    newStarSystem.politics = PoliticsType.cybernetic
                case 6:
                    newStarSystem.politics = PoliticsType.democracy
                case 7:
                    newStarSystem.politics = PoliticsType.dictatorship
                case 8:
                    newStarSystem.politics = PoliticsType.fascist
                case 9:
                    newStarSystem.politics = PoliticsType.feudal
                case 10:
                    newStarSystem.politics = PoliticsType.military
                case 11:
                    newStarSystem.politics = PoliticsType.monarchy
                case 12:
                    newStarSystem.politics = PoliticsType.pacifist
                case 13:
                    newStarSystem.politics = PoliticsType.socialist
                case 14:
                    newStarSystem.politics = PoliticsType.satori
                case 15:
                    newStarSystem.politics = PoliticsType.technocracy
                case 16:
                    newStarSystem.politics = PoliticsType.theocracy
                default:
                    newStarSystem.politics = PoliticsType.anarchy
            }
            
            // size
            let sizeRand = Int(arc4random_uniform(5))
            switch sizeRand {
                case 0:
                    newStarSystem.size = SizeType.Tiny
                case 1:
                    newStarSystem.size = SizeType.Small
                case 2:
                    newStarSystem.size = SizeType.Medium
                case 3:
                    newStarSystem.size = SizeType.Large
                case 4:
                    newStarSystem.size = SizeType.Huge
                default:
                    newStarSystem.size = SizeType.Tiny
            }
            
            // special resources
            let specialResourcesRand1 = Int(arc4random_uniform(5))
            if specialResourcesRand1 >= 3 {
                let specialResourcesRand2 = Int(arc4random_uniform(12))
                switch specialResourcesRand2 {
                    case 0:
                        newStarSystem.specialResources = SpecialResourcesType.mineralRich
                    case 1:
                        newStarSystem.specialResources = SpecialResourcesType.desert
                    case 2:
                        newStarSystem.specialResources = SpecialResourcesType.mineralRich
                    case 3:
                        newStarSystem.specialResources = SpecialResourcesType.lotsOfWater
                    case 4:
                        newStarSystem.specialResources = SpecialResourcesType.richSoil
                    case 5:
                        newStarSystem.specialResources = SpecialResourcesType.poorSoil
                    case 6:
                        newStarSystem.specialResources = SpecialResourcesType.richFauna
                    case 7:
                        newStarSystem.specialResources = SpecialResourcesType.lifeless
                    case 8:
                        newStarSystem.specialResources = SpecialResourcesType.weirdMushrooms
                    case 9:
                        newStarSystem.specialResources = SpecialResourcesType.specialHerbs
                    case 10:
                        newStarSystem.specialResources = SpecialResourcesType.artisticPopulace
                    case 11:
                        newStarSystem.specialResources = SpecialResourcesType.warlikePopulace
                    default:
                        newStarSystem.specialResources = SpecialResourcesType.none
                }
            } else {
                 newStarSystem.specialResources = SpecialResourcesType.none
            }
            
            // status
            let statusRand1 = Int(arc4random_uniform(100))
            if statusRand1 >= 85 {
                newStarSystem.status = StatusType.none
            } else {
                let statusRand2 = Int(arc4random_uniform(7))
                switch statusRand2 {
                case 0:
                    newStarSystem.status = StatusType.war
                case 0:
                    newStarSystem.status = StatusType.plague
                case 0:
                    newStarSystem.status = StatusType.drought
                case 0:
                    newStarSystem.status = StatusType.boredom
                case 0:
                    newStarSystem.status = StatusType.cold
                case 0:
                    newStarSystem.status = StatusType.cropFailure
                case 0:
                    newStarSystem.status = StatusType.employment
                default:
                    newStarSystem.status = StatusType.none
                }
            }
            
            // anything else that needs to be set here?
            
            // end of loop
            planets.append(newStarSystem)
            i += 1
        }
        
        // verify everything is close enough
        verifyAndFixProximity()
        
        // set wormhole destinations
        var indicesOfPlanetsWithWormholes: [Int] = [0, 1, 2, 3, 4, 5]
        for planet in planets {
            if planet.wormhole {
                // randomly choose a number in the array
                let index = Int(arc4random_uniform(UInt32(indicesOfPlanetsWithWormholes.count)))
                let number = indicesOfPlanetsWithWormholes[index]
                // remove it from the array
                indicesOfPlanetsWithWormholes.removeAtIndex(index)
                // assign it
                planet.wormholeDestination = number
                // DEBUGGING
                print(indicesOfPlanetsWithWormholes)
            }
        }
        
        // log output to console
        // DEBUGGING:
        for planet in planets {
            print("************************")
            print("name: \(planet.name)")
            print("x coord: \(planet.xCoord)")
            print("y coord: \(planet.yCoord)")
            print("tech level: \(planet.techLevel)")
            print("politics: \(planet.politics)")
            print("size: \(planet.size)")
            print("special resources: \(planet.specialResources)")
            print("status: \(planet.status)")
            print("wormhole destination: \(planet.wormholeDestination)")
        }
        
    }
    
    func getDistance(system1: StarSystem, system2: StarSystem) -> Int {
        let xDistance = abs(system1.xCoord - system2.xCoord)
        let yDistance = abs(system1.yCoord - system2.yCoord)
        let sum: Double = Double((xDistance * xDistance) + (yDistance * yDistance))
        return Int(sqrt(sum))       // might need to round. Not worrying about that now
    }
    
    func verifyMinDistance(system1: StarSystem, i: Int) -> Bool {
        for index in 0..<i {
            if getDistance(system1, system2: planets[index]) < MINDISTANCE {
                return false
            }
        }
        return true
    }
    
    func distanceToNearestNeighbor(system: StarSystem) -> Int {
        var min: Int = 100
        for planet in planets {
            let distance = getDistance(system, system2: planet)
            if distance < min {
                min = distance
            }
        }
        return min
    }
    
    func verifyAndFixProximity() -> Bool {
        var ok = false
        while !ok {
            ok = true
            for planet in planets {
                let distance = distanceToNearestNeighbor(planet)
                if distance > MINDISTANCE {
                    ok = false
                    reassignRandomCoords(planet)
                }
            }
        }
        return true
    }
    
    func reassignRandomCoords(system: StarSystem) {
        var proximityFlag = false
        while !proximityFlag {
            let wUpper: UInt32 = 148
            let wLower: UInt32 = 2
            let hUpper: UInt32 = 108
            let hLower: UInt32 = 2
            system.xCoord = Int(arc4random_uniform(wUpper - wLower) + wLower)
            system.yCoord = Int(arc4random_uniform(hUpper - hLower) + hLower)
            proximityFlag = verifyMinDistance(system, i: planets.count)
        }
    }
    

    
//    func initializeTradeItems(StarSystem) -> StarSystem {
//    }
    
    // figure out how display is done
}