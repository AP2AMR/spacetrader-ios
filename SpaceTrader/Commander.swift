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
    var waterPaid: Int = 0
    var fursPaid: Int = 0
    var foodPaid: Int = 0
    var orePaid: Int = 0
    var gamesPaid: Int = 0
    var firearmsPaid: Int = 0
    var medicinePaid: Int = 0
    var machinesPaid: Int = 0
    var narcoticsPaid: Int = 0
    var robotsPaid: Int = 0
    
    
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
    
    func buyWater(quantity: Int) {
        let totalPrice = quantity * currentSystem.waterBuy
        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
            credits -= totalPrice
            player.commanderShip.waterOnBoard += quantity
            waterPaid = currentSystem.waterBuy
        }
    }
    
    func buyFurs(quantity: Int) {
        let totalPrice = quantity * currentSystem.fursBuy
        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
            credits -= totalPrice
            player.commanderShip.fursOnBoard += quantity
            fursPaid = currentSystem.fursBuy
        }
    }
    
    func buyFood(quantity: Int) {
        let totalPrice = quantity * currentSystem.foodBuy
        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
            credits -= totalPrice
            player.commanderShip.foodOnBoard += quantity
            foodPaid = currentSystem.foodBuy
        }
    }
    
    func buyOre(quantity: Int) {
        let totalPrice = quantity * currentSystem.oreBuy
        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
            credits -= totalPrice
            player.commanderShip.oreOnBoard += quantity
            orePaid = currentSystem.oreBuy
        }
    }
    
    func buyGames(quantity: Int) {
        let totalPrice = quantity * currentSystem.gamesBuy
        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
            credits -= totalPrice
            player.commanderShip.gamesOnBoard += quantity
            gamesPaid = currentSystem.gamesBuy
        }
    }
    
    func buyFirearms(quantity: Int) {
        let totalPrice = quantity * currentSystem.firearmsBuy
        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
            credits -= totalPrice
            player.commanderShip.firearmsOnBoard += quantity
            firearmsPaid = currentSystem.firearmsBuy
        }
    }
    
    func buyMedicine(quantity: Int) {
        let totalPrice = quantity * currentSystem.medicineBuy
        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
            credits -= totalPrice
            player.commanderShip.medicineOnBoard += quantity
            medicinePaid = currentSystem.medicineBuy
        }
    }
    
    func buyMachines(quantity: Int) {
        let totalPrice = quantity * currentSystem.machinesBuy
        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
            credits -= totalPrice
            player.commanderShip.machinesOnBoard += quantity
            machinesPaid = currentSystem.machinesBuy
        }
    }
    
    func buyNarcotics(quantity: Int) {
        let totalPrice = quantity * currentSystem.narcoticsBuy
        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
            credits -= totalPrice
            player.commanderShip.narcoticsOnBoard += quantity
            narcoticsPaid = currentSystem.narcoticsBuy
        }
    }
    
    func buyRobots(quantity: Int) {
        let totalPrice = quantity * currentSystem.robotsBuy
        if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
            credits -= totalPrice
            player.commanderShip.robotsOnBoard += quantity
            robotsPaid = currentSystem.robotsBuy
        }
    }
    
    func buy(commodity: TradeItemType, quantity: Int) -> Bool {
        switch commodity {
        case .Water:
            let totalPrice = quantity * currentSystem.waterBuy
            if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
                credits -= totalPrice
                player.commanderShip.waterOnBoard += quantity
                waterPaid = currentSystem.waterBuy
                return true
            } else {
                return false
            }
        case .Furs:
            let totalPrice = quantity * currentSystem.fursBuy
            if player.commanderShip.baysAvailable >= quantity && player.credits >= totalPrice {
                credits -= totalPrice
                player.commanderShip.fursOnBoard += quantity
                fursPaid = currentSystem.fursBuy
                return true
            } else {
                return false
            }
        }
    }
}