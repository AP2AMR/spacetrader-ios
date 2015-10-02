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
            var newStarSystem = StarSystem(name: "NOT SET YET", techLevel: TechLevelType.techLevel0, politics: PoliticsType.anarchy, status: StatusType.none, xCoord: 0, yCoord: 0, specialResources: SpecialResourcesType.none, size: SizeType.Tiny)
            

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
            
            // initialize trade items
            newStarSystem = initializeTradeItems(newStarSystem)
            
            
            // anything else that needs to be set here?
            // mercenaries?
            
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
            print("water quantity: \(planet.water)")
            print("furs quantity: \(planet.furs)")
            print("food quantity: \(planet.food)")
            print("ore quantity: \(planet.ore)")
            print("games quantity: \(planet.games)")
            print("firearms quantity: \(planet.firearms)")
            print("medicine quantity: \(planet.medicine)")
            print("machines quantity: \(planet.machines)")
            print("narcotics quantity: \(planet.narcotics)")
            print("robots quantity: \(planet.robots)")
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
    

    
    func initializeTradeItems(system: StarSystem) -> StarSystem {
        var passFlag = false
        let difficulty = getDifficultyValue(player.difficulty)
        let tradeItems: [TradeItem] = [
            TradeItem(item: .Water, quantity: 1, pricePaid: 1),
            TradeItem(item: .Furs, quantity: 1, pricePaid: 1),
            TradeItem(item: .Food, quantity: 1, pricePaid: 1),
            TradeItem(item: .Ore, quantity: 1, pricePaid: 1),
            TradeItem(item: .Games, quantity: 1, pricePaid: 1),
            TradeItem(item: .Firearms, quantity: 1, pricePaid: 1),
            TradeItem(item: .Medicine, quantity: 1, pricePaid: 1),
            TradeItem(item: .Machines, quantity: 1, pricePaid: 1),
            TradeItem(item: .Narcotics, quantity: 1, pricePaid: 1),
            TradeItem(item: .Robots, quantity: 1, pricePaid: 1)]
        // iterate through all tradeItems
        for item in tradeItems {
            let politics = Politics(type: system.politics)
            var quantity: Int = 0
            passFlag == false
            // continue only if not above max trade item for tech level && not ignored here
            if getTechLevelValue(system.techLevel) < getTechLevelValue(item.techProduction) {
                quantity = 0
                passFlag = true
            }
            if item.item == .Firearms && !politics.firearmsOk {
                quantity = 0
                passFlag = true
            }
            if item.item == .Narcotics && !politics.drugsOk {
                quantity = 0
                passFlag = true
            }
            
            
            if !passFlag {
                // general case: (9 + rand(5)) - abs((techTopProduction - techLevel) * (1 + size))
                let rand = Int(arc4random_uniform(5))
                quantity = (9 * rand) - abs(getTechLevelValue(item.techTopProduction) - getTechLevelValue(system.techLevel) * (1 + getSizeValue(system.size)))
                
                // if robots or narcotics, prevent crazy lucrative scenario
                if (item.item == .Robots) || (item.item == .Narcotics) {
                    quantity = (quantity * (5 - difficulty)) / ((6 - difficulty) + 1)
                }
                
                // if cheapResource
                if system.specialResources == item.cheapResource {
                    quantity = (quantity * 4) / 3
                }
                
                // if expensiveResource
                if system.specialResources == item.expensiveResource {
                    quantity = quantity / 2
                }
                
                // if doublePriceStatus
                if system.status == item.doublePriceStatus {
                    quantity = quantity / 5
                }
                
                // further randomize
                quantity = quantity + Int(arc4random_uniform(10)) - Int(arc4random_uniform(10))
                
                // if less than zero, make zero
                if quantity < 0 {
                    quantity = 0
                }
            }
            
            
            //  write quantity to system
            switch item.item {
            case .Water:
                system.water = quantity
            case .Furs:
                system.furs = quantity
            case .Food:
                system.food = quantity
            case .Ore:
                system.ore = quantity
            case .Games:
                system.games = quantity
            case .Firearms:
                system.firearms = quantity
            case .Medicine:
                system.medicine = quantity
            case .Machines:
                system.machines = quantity
            case .Narcotics:
                system.narcotics = quantity
            case .Robots:
                system.robots = quantity
            default:
                print("?")
            }
        }
        return system
    }
    
    func getTechLevelValue(level: TechLevelType) -> Int {
        switch level {
            case TechLevelType.techLevel0:
                return 0
            case TechLevelType.techLevel1:
                return 1
            case TechLevelType.techLevel2:
                return 2
            case TechLevelType.techLevel3:
                return 3
            case TechLevelType.techLevel4:
                return 4
            case TechLevelType.techLevel5:
                return 5
            case TechLevelType.techLevel6:
                return 6
            case TechLevelType.techLevel7:
                return 7
            case TechLevelType.techLevel8:
                return 8
        }
    }
    
    func getSizeValue(size: SizeType) -> Int {
        switch size {
        case .Tiny:
            return 0
        case .Small:
            return 1
        case .Medium:
            return 2
        case .Large:
            return 3
        case .Huge:
            return 4
        }
    }
    
    func getDifficultyValue(difficulty: DifficultyType) -> Int {
        switch difficulty {
            case .beginner:
                return 0
            case .easy:
                return 1
            case .normal:
                return 2
            case .hard:
                return 3
            case .impossible:
                return 4
        }
    }
    

}