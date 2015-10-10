//
//  Commander.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/11/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class Commander {
    var commanderName: String
    var difficulty: DifficultyType
    var commanderShip: SpaceShip
    //var currentSystem: StarSystemID
    var credits: Int
    var debt: Int = 0
    var days: Int = 0
    
    // skills
    var pilotSkill: Int
    var fighterSkill: Int
    var traderSkill: Int
    var engineerSkill: Int
    
    // prices paid
//    var waterPaid: Int = 0
//    var fursPaid: Int = 0
//    var foodPaid: Int = 0
//    var orePaid: Int = 0
//    var gamesPaid: Int = 0
//    var firearmsPaid: Int = 0
//    var medicinePaid: Int = 0
//    var machinesPaid: Int = 0
//    var narcoticsPaid: Int = 0
//    var robotsPaid: Int = 0
    
    
    init(commanderName: String, difficulty: DifficultyType, pilotSkill: Int, fighterSkill: Int, traderSkill: Int, engineerSkill: Int) {
        self.commanderName = commanderName
        self.difficulty = difficulty
        self.pilotSkill = pilotSkill
        self.fighterSkill = fighterSkill
        self.traderSkill = traderSkill
        self.engineerSkill = engineerSkill
        
        self.credits = 1000
        
        self.commanderShip = SpaceShip(type: ShipType.Gnat, IFFStatus: IFFStatusType.Player)
    }
    
    // current prices
    
    // settings
    
    
//    var Credits: Int
//    var Debt: Int
//    var Days: Int
//    let CurrentSystem: StarSystemID
//    let BuyPrice: Int
//    let SellPrice: Int
//    let ShipPrice: Int
//    let GalacticChartSystem: Int                    // ?
//    let PoliceKills: Int
//    let TraderKills: Int
//    let PirateKills: Int
//    let PoliceRecordScore: Int
//    let AutoFuel: Bool
//    let AutoRepair: Bool
//    let Clicks: Bool                                // ?
//    let EncounterType: EncounterType2               // wtf?
//    let Raided: Bool                                // ?
//    let MonsterStatus: MonsterStatusType
//    let DragonflyStatus: DragonflyStatusType
//    let JaporiDiseaseStatus: JaporiDiseaseStatusType
//    let MoonBought: MoonBoughtStatus
//    let MonsterHull: Int                            // what's this?
//    let NameCommander: String
//    let CurrentForm: Int                            // what's this?
//    let Ship: SpaceShip
//    let Opponent: SpaceShip
//    let Mercenary: [CrewMember]
//    let StarSystem: StarSystemID
//    let EscapePod: Bool
//    let Insurance: Bool
//    let NoClaim: Int                                // what's this?
//    let Inspected: Bool
//    let AlwaysIgnoreTraders: Bool                   // maybe a separate section of settings?
//    let Wormhole: Int                               // NOT INT BUT I HAVE NO IDEA
//    let Difficulty: DifficultyType
//    //let VersionMajor                                // what's this?
//    //let VersionMinor                                // what's this?
//    // buying price is to be included in specific tradeitems? Else must go here.
//    let ArtifactOnBoard: Bool
//    let ReserveMoney: Bool                          // ?
//    let PriceDifferences: Bool                      // ?
//    let APLScreen: Bool                             // ?
//    let LeaveEmpty: Int                             // bays?
//    let TribbleMessage: Bool
//    let AlwaysInfo: Bool
//    let AlwaysIgnorePolice: Bool
//    let AlwaysIgnorePirates: Bool
//    // textual encounters
//    let JarekStatus: JarekStatusType
//    // continuous: bool?
//    let AttackFleeing: Bool
//    let ExperimentAndWildStatus: ExperimentAndWildStatusType
//    let FabricRipProbability: FabricRipProbabilityType
//    let VeryRareEncounter: VeryRareEncounterType
//    // boolean collection?
//    let ReactorStatus: ReactorStatusType
//    let TrackedSystem: StarSystemID
//    let ScarabStatus: ScarabStatusType
//    let AlwaysIgnoreTradeInOrbit: Bool
//    let AlreadyPaidForNewspaper: Bool
//    let GameLoaded: Bool                            // ?
//    let LitterWarning: Bool
//    let SharePreferences: Bool
    
    // preferences
    
//    func buyWater(quantity: Int) {
//        let totalPrice = quantity * currentSystem.waterBuy
//        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
//            credits -= totalPrice
//            player.commanderShip.waterOnBoard += quantity
//            waterPaid = currentSystem.waterBuy
//        }
//    }
//    
//    func buyFurs(quantity: Int) {
//        let totalPrice = quantity * currentSystem.fursBuy
//        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
//            credits -= totalPrice
//            player.commanderShip.fursOnBoard += quantity
//            fursPaid = currentSystem.fursBuy
//        }
//    }
//    
//    func buyFood(quantity: Int) {
//        let totalPrice = quantity * currentSystem.foodBuy
//        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
//            credits -= totalPrice
//            player.commanderShip.foodOnBoard += quantity
//            foodPaid = currentSystem.foodBuy
//        }
//    }
//    
//    func buyOre(quantity: Int) {
//        let totalPrice = quantity * currentSystem.oreBuy
//        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
//            credits -= totalPrice
//            player.commanderShip.oreOnBoard += quantity
//            orePaid = currentSystem.oreBuy
//        }
//    }
//    
//    func buyGames(quantity: Int) {
//        let totalPrice = quantity * currentSystem.gamesBuy
//        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
//            credits -= totalPrice
//            player.commanderShip.gamesOnBoard += quantity
//            gamesPaid = currentSystem.gamesBuy
//        }
//    }
//    
//    func buyFirearms(quantity: Int) {
//        let totalPrice = quantity * currentSystem.firearmsBuy
//        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
//            credits -= totalPrice
//            player.commanderShip.firearmsOnBoard += quantity
//            firearmsPaid = currentSystem.firearmsBuy
//        }
//    }
//    
//    func buyMedicine(quantity: Int) {
//        let totalPrice = quantity * currentSystem.medicineBuy
//        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
//            credits -= totalPrice
//            player.commanderShip.medicineOnBoard += quantity
//            medicinePaid = currentSystem.medicineBuy
//        }
//    }
//    
//    func buyMachines(quantity: Int) {
//        let totalPrice = quantity * currentSystem.machinesBuy
//        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
//            credits -= totalPrice
//            player.commanderShip.machinesOnBoard += quantity
//            machinesPaid = currentSystem.machinesBuy
//        }
//    }
//    
//    func buyNarcotics(quantity: Int) {
//        let totalPrice = quantity * currentSystem.narcoticsBuy
//        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
//            credits -= totalPrice
//            player.commanderShip.narcoticsOnBoard += quantity
//            narcoticsPaid = currentSystem.narcoticsBuy
//        }
//    }
//    
//    func buyRobots(quantity: Int) {
//        let totalPrice = quantity * currentSystem.robotsBuy
//        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
//            credits -= totalPrice
//            player.commanderShip.robotsOnBoard += quantity
//            robotsPaid = currentSystem.robotsBuy
//        }
//    }
    
    func buy(commodity: TradeItemType, quantity: Int) -> Bool {
        switch commodity {
            case .Water:
                let totalPrice = quantity * currentSystem.waterBuy
                if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
                    credits -= totalPrice
                    let water = TradeItem(item: .Water, quantity: quantity, pricePaid: galaxy.currentSystem!.waterBuy)
                    player.commanderShip.cargo.append(water)
                    galaxy.currentSystem!.water -= quantity
                    return true
                } else {
                    return false
                }
            case .Furs:
                let totalPrice = quantity * galaxy.currentSystem!.fursBuy
                if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
                    credits -= totalPrice
                    let furs = TradeItem(item: .Furs, quantity: quantity, pricePaid: galaxy.currentSystem!.fursBuy)
                    player.commanderShip.cargo.append(furs)
                    galaxy.currentSystem!.furs -= quantity
                    return true
                } else {
                    return false
                }
            case .Food:
                let totalPrice = quantity * galaxy.currentSystem!.foodBuy
                if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
                    credits -= totalPrice
                    let food = TradeItem(item: .Food, quantity: quantity, pricePaid: galaxy.currentSystem!.foodBuy)
                    player.commanderShip.cargo.append(food)
                    galaxy.currentSystem!.food -= quantity
                    return true
                } else {
                    return false
                }
            case .Ore:
                let totalPrice = quantity * galaxy.currentSystem!.oreBuy
                if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
                    credits -= totalPrice
                    let ore = TradeItem(item: .Ore, quantity: quantity, pricePaid: galaxy.currentSystem!.oreBuy)
                    player.commanderShip.cargo.append(ore)
                    galaxy.currentSystem!.ore -= quantity
                    return true
                } else {
                    return false
                }
            case .Games:
                let totalPrice = quantity * galaxy.currentSystem!.gamesBuy
                if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
                    credits -= totalPrice
                    let games = TradeItem(item: .Games, quantity: quantity, pricePaid: galaxy.currentSystem!.gamesBuy)
                    player.commanderShip.cargo.append(games)
                    galaxy.currentSystem!.games -= quantity
                    return true
                } else {
                    return false
                }
            case .Firearms:
                let totalPrice = quantity * galaxy.currentSystem!.firearmsBuy
                if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
                    credits -= totalPrice
                    let firearms = TradeItem(item: .Firearms, quantity: quantity, pricePaid: galaxy.currentSystem!.firearmsBuy)
                    player.commanderShip.cargo.append(firearms)
                    galaxy.currentSystem!.firearms -= quantity
                    return true
                } else {
                    return false
                }
            case .Medicine:
                let totalPrice = quantity * galaxy.currentSystem!.medicineBuy
                if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
                    credits -= totalPrice
                    let medicine = TradeItem(item: .Medicine, quantity: quantity, pricePaid: galaxy.currentSystem!.medicineBuy)
                    player.commanderShip.cargo.append(medicine)
                    galaxy.currentSystem!.medicine -= quantity
                    return true
                } else {
                    return false
                }
            case .Machines:
                let totalPrice = quantity * galaxy.currentSystem!.machinesBuy
                if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
                    credits -= totalPrice
                    let machines = TradeItem(item: .Machines, quantity: quantity, pricePaid: galaxy.currentSystem!.machinesBuy)
                    player.commanderShip.cargo.append(machines)
                    galaxy.currentSystem!.machines -= quantity
                    return true
                } else {
                    return false
                }
            case .Narcotics:
                let totalPrice = quantity * galaxy.currentSystem!.narcoticsBuy
                if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
                    credits -= totalPrice
                    let narcotics = TradeItem(item: .Narcotics, quantity: quantity, pricePaid: galaxy.currentSystem!.narcoticsBuy)
                    player.commanderShip.cargo.append(narcotics)
                    galaxy.currentSystem!.narcotics -= quantity
                    return true
                } else {
                    return false
                }
            case .Robots:
                let totalPrice = quantity * galaxy.currentSystem!.robotsBuy
                if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
                    credits -= totalPrice
                    let robots = TradeItem(item: .Robots, quantity: quantity, pricePaid: galaxy.currentSystem!.robotsBuy)
                    player.commanderShip.cargo.append(robots)
                    galaxy.currentSystem!.robots -= quantity
                    return true
                } else {
                    return false
                }
            default: return false
        }
    }
    
    func sellAll(commodity: TradeItemType) -> Bool {
        var quantity: Int = 0
        var indices: [Int] = []
        var counter: Int = 0

        // get quantity, remove items from cargo
        for entry in player.commanderShip.cargo {
            if entry.item == commodity {
                quantity += entry.quantity
                indices.append(counter)
            }
            counter += 1
        }

        for number in indices {
            player.commanderShip.cargo.removeAtIndex(number)
        }
        
        // calculate price
        var salePrice: Int = 0
        switch commodity {
            case .Water:
                salePrice = quantity * galaxy.currentSystem!.waterSell
            case .Furs:
                salePrice = quantity * galaxy.currentSystem!.fursSell
            case .Food:
                salePrice = quantity * galaxy.currentSystem!.foodSell
            case .Ore:
                salePrice = quantity * galaxy.currentSystem!.oreSell
            case .Games:
                salePrice = quantity * galaxy.currentSystem!.gamesSell
            case .Firearms:
                salePrice = quantity * galaxy.currentSystem!.firearmsSell
            case .Medicine:
                salePrice = quantity * galaxy.currentSystem!.medicineSell
            case .Machines:
                salePrice = quantity * galaxy.currentSystem!.machinesSell
            case .Narcotics:
                salePrice = quantity * galaxy.currentSystem!.narcoticsSell
            case .Robots:
                salePrice = quantity * galaxy.currentSystem!.robotsSell
            default:
                salePrice = 0
        }
        print(salePrice)
        player.credits += salePrice
        
        
        
        if quantity > 0 {
            return true
        } else {
            return false
        }
    }
    
    func sell(commodity: TradeItemType, quantity: Int) -> Bool {
        var onHand: Int = 0
        var indices: [Int] = []
        var counter: Int = 0
        
        // get quantity, remove items from cargo
        for entry in player.commanderShip.cargo {
            if entry.item == commodity {
                onHand += entry.quantity
                indices.append(counter)
            }
            counter += 1
        }
        
        if onHand >= quantity {
            // get price paid for first one (kludge)
            let firstInBay = player.commanderShip.cargo[indices[0]]
            let paid = firstInBay.pricePaid
            
            // delete all in hold
            for number in indices {
                player.commanderShip.cargo.removeAtIndex(number)
            }
            
            // re-add balance
            let replacementQuantity = onHand - quantity
            let replacement = TradeItem(item: commodity, quantity: replacementQuantity, pricePaid: paid)
            player.commanderShip.cargo.append(replacement)
            
            // calculate price
            var salePrice: Int = 0
            switch commodity {
            case .Water:
                salePrice = quantity * galaxy.currentSystem!.waterSell
            case .Furs:
                salePrice = quantity * galaxy.currentSystem!.fursSell
            case .Food:
                salePrice = quantity * galaxy.currentSystem!.foodSell
            case .Ore:
                salePrice = quantity * galaxy.currentSystem!.oreSell
            case .Games:
                salePrice = quantity * galaxy.currentSystem!.gamesSell
            case .Firearms:
                salePrice = quantity * galaxy.currentSystem!.firearmsSell
            case .Medicine:
                salePrice = quantity * galaxy.currentSystem!.medicineSell
            case .Machines:
                salePrice = quantity * galaxy.currentSystem!.machinesSell
            case .Narcotics:
                salePrice = quantity * galaxy.currentSystem!.narcoticsSell
            case .Robots:
                salePrice = quantity * galaxy.currentSystem!.robotsSell
            default:
                salePrice = 0
            }
            player.credits += salePrice
            return true
        } else {
            return false
        }
        
        
    }
    
    func buyFuel(units: Int) -> Bool {
        let cost = units * player.commanderShip.costOfFuel
        if player.credits >= cost {
            player.commanderShip.fuel += units
            player.credits -= cost
            galaxy.getSystemsInRange()
            return true
        }
        return false
    }
    
    func buyMaxFuel() -> Bool {
        let fuelNeeded = player.commanderShip.fuelTanks - player.commanderShip.fuel
        let cost = fuelNeeded * player.commanderShip.costOfFuel
        
        if player.credits >= cost {
            player.commanderShip.fuel += fuelNeeded
            player.credits -= cost
            galaxy.getSystemsInRange()
            return true
        }
        return false
    }
    
    func buyRepairs(price: Int) -> Bool {
        if player.credits >= price {
            let unitsOfRepairs: Int = price / player.commanderShip.repairCosts
            
            player.commanderShip.hullStrength += unitsOfRepairs
            player.credits -= price
            return true
        }
        return false
    }
    
    func buyMaxRepairs() -> Bool {
        let repairsNeeded = player.commanderShip.hull - player.commanderShip.hullStrength
        let cost = repairsNeeded * player.commanderShip.repairCosts
        
        if player.credits >= cost {
            player.commanderShip.hullStrength = player.commanderShip.hull
            player.credits -= cost
            return true
        }
        return false
    }
    
    func getMax(commodity: TradeItemType) -> Int {
        var availableQuantity: Int {
            switch commodity {
                case .Water: return galaxy.currentSystem!.water
                case .Furs: return galaxy.currentSystem!.furs
                case .Food: return galaxy.currentSystem!.food
                case .Ore: return galaxy.currentSystem!.ore
                case .Games: return galaxy.currentSystem!.games
                case .Firearms: return galaxy.currentSystem!.firearms
                case .Medicine: return galaxy.currentSystem!.medicine
                case .Machines: return galaxy.currentSystem!.machines
                case .Narcotics: return galaxy.currentSystem!.narcotics
                case .Robots: return galaxy.currentSystem!.robots
                default: return 0
            }
        }
        var pricePerUnit: Int {
            switch commodity {
                case .Water: return galaxy.currentSystem!.waterBuy
                case .Furs: return galaxy.currentSystem!.fursBuy
                case .Food: return galaxy.currentSystem!.foodBuy
                case .Ore: return galaxy.currentSystem!.oreBuy
                case .Games: return galaxy.currentSystem!.gamesBuy
                case .Firearms: return galaxy.currentSystem!.firearmsBuy
                case .Medicine: return galaxy.currentSystem!.medicineBuy
                case .Machines: return galaxy.currentSystem!.machinesBuy
                case .Narcotics: return galaxy.currentSystem!.narcoticsBuy
                case .Robots: return galaxy.currentSystem!.robotsBuy
                default: return 0
            }
        }
        let maxMoney = player.credits / pricePerUnit
        return min(maxMoney, player.commanderShip.baysAvailable, availableQuantity)
    }
    
    func getCargoOnBoard(commodity: TradeItemType) -> (Int, Int) {
        var total: Int = 0
        var average: Int = 0
        for entry in player.commanderShip.cargo {
            if entry.item == commodity {
                total += entry.quantity
                average += (entry.pricePaid * entry.quantity)
            }
        }
        average = average / total
        return (total, average)
    }
    
    func getCargoQuantity(commodity: TradeItemType) -> Int {
        var total: Int = 0
        for entry in player.commanderShip.cargo {
            if entry.item == commodity {
                total += entry.quantity
            }
        }
        return total
    }
    
    func getPricePaid(commodity: TradeItemType) -> Int? {
        var total: Int = 0
        var average: Int = 0
        for entry in player.commanderShip.cargo {
            if entry.item == commodity {
                total += entry.quantity
                average += (entry.pricePaid * entry.quantity)
            }
        }
        if average > 0 {
            average = average / total
            return average
        } else {
            return nil
        }
    }
    
    func getPLString(commodity: TradeItemType) -> String {
        let pricePaid = getPricePaid(commodity)
        if pricePaid != nil {
            let PL = getLocalSellPriceOf(commodity) - pricePaid!
            if PL >= 0 {
                return "+\(PL)"
            } else {
                return "-\(abs(PL))"
            }
        } else {
            return "---"
        }
    }
    
    func getLocalSellPriceOf(commodity: TradeItemType) -> Int {
        switch commodity {
        case .Water:
            return galaxy.currentSystem!.waterSell
        case .Furs:
            return galaxy.currentSystem!.fursSell
        case .Food:
            return galaxy.currentSystem!.foodSell
        case .Ore:
            return galaxy.currentSystem!.oreSell
        case .Games:
            return galaxy.currentSystem!.gamesSell
        case .Firearms:
            return galaxy.currentSystem!.firearmsSell
        case .Medicine:
            return galaxy.currentSystem!.medicineSell
        case .Machines:
            return galaxy.currentSystem!.machinesSell
        case .Narcotics:
            return galaxy.currentSystem!.narcoticsSell
        case .Robots:
            return galaxy.currentSystem!.robotsSell
        default:
            return 0
        }
    }
    
    func getLocalBuyPriceOf(commodity: TradeItemType) -> Int {
        switch commodity {
        case .Water:
            return galaxy.currentSystem!.waterBuy
        case .Furs:
            return galaxy.currentSystem!.fursBuy
        case .Food:
            return galaxy.currentSystem!.foodBuy
        case .Ore:
            return galaxy.currentSystem!.oreBuy
        case .Games:
            return galaxy.currentSystem!.gamesBuy
        case .Firearms:
            return galaxy.currentSystem!.firearmsBuy
        case .Medicine:
            return galaxy.currentSystem!.medicineBuy
        case .Machines:
            return galaxy.currentSystem!.machinesBuy
        case .Narcotics:
            return galaxy.currentSystem!.narcoticsBuy
        case .Robots:
            return galaxy.currentSystem!.robotsBuy
        default:
            return 0
        }
    }
    
    func getDifficultyInt() -> Int {
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