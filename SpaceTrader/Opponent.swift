//
//  Opponent.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/16/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class Opponent {
    var ship: SpaceShip
    var commander: Commander
    var type: IFFStatusType
    
    init(type: IFFStatusType) {
        print("initializing opponent...")

        self.type = type
        
        // these are placeholders only, because I want to be able to do the instantiating function in multiple pieces
        self.commander = Commander(commanderName: "Opponent", difficulty: DifficultyType.easy, pilotSkill: 1, fighterSkill: 1, traderSkill: 1, engineerSkill: 1)
        self.ship = SpaceShip(type: ShipType.Gnat, IFFStatus: type)
    }
    
    func generateOpponent() {
        print("generateOpponent called")
        var tries = 1
        let name = "NAME"                           // not sure whether he properly needs a name...
        
        if type == IFFStatusType.FamousCaptain {
            ship = SpaceShip(type: ShipType.Wasp, IFFStatus: IFFStatusType.FamousCaptain)
            commander = Commander(commanderName: name, difficulty: DifficultyType.easy, pilotSkill: 9, fighterSkill: 9, traderSkill: 9, engineerSkill: 9)
            
            // max crew
            
            // max shields
            
            // max weapons
            
            // return
        }
        
        if type == .Mantis {
            tries = 1 + player.getDifficultyInt()
        }
        
        if type == IFFStatusType.Police {
            if player.policeRecordInt <= 1 && player.wildStatus {
                tries = 3
            } else if player.policeRecordInt == 0 || player.wildStatus {
                tries = 5
            }
        }
        
        // pirates get better as you get richer
        if type ==  .Pirate {
            tries = 1 + (player.netWorth / 100000)
        }
        
        // set shiptype
        let shipType = pickShipRandomlyBasedOnOccurance(tries)
        ship = SpaceShip(type: shipType, IFFStatus: type)
        
        
        // determine gadgets
        let gadgetSlots = ship.gadgetSlots
        var numberOfGadgets: Int = 0
        
        if player.difficultyInt >= 3 {
            numberOfGadgets = gadgetSlots
        } else {
            numberOfGadgets = Int(arc4random_uniform(UInt32(gadgetSlots + 1)))
            if (numberOfGadgets < gadgetSlots) && tries > 3 {
                numberOfGadgets += 1
            }
        }
        
        print("gadgets: \(gadgetSlots) slots, \(numberOfGadgets) actual gadgets")
        
        for _ in 0..<numberOfGadgets {
            addRandomlyChosenGadget(tries)
        }
        
        // fill cargo bays
        var cargoBays: Int = ship.cargoBays
        for gadget in ship.gadget {
            if gadget.type == GadgetType.CargoBays {
                cargoBays += 5
            }
        }
        //print("cargo bays: \(cargoBays)")

        
        let m = 3 + rand(cargoBays - 5)
        //print("m = \(m)")
        var sum = min(m, 15)
        //print("first result for sum: \(sum)")
        if player.difficultyInt <= 2 {
            cargoBays = sum
        }
        
        //print("sum before pirate adjustment: \(sum)")
        if ship.IFFStatus == IFFStatusType.Pirate {
            if player.difficultyInt < 2 {
                sum = (sum * 4) / 5
            } else {
                sum = sum / player.difficultyInt
            }
        }
        
        if sum < 1 {
            sum = 1
        }
        
        if ship.IFFStatus == IFFStatusType.Police {
            sum = 0
        }
        
        // populate commodities
        let commodities: [TradeItemType] = [TradeItemType.Water, TradeItemType.Furs, TradeItemType.Food, TradeItemType.Ore, TradeItemType.Games, TradeItemType.Firearms, TradeItemType.Medicine, TradeItemType.Machines, TradeItemType.Narcotics, TradeItemType.Robots]
        
        var i = 0
        //print("initial sum = \(sum)")
        while i < sum {
            let randomIndex = rand(10)
            let randomCommodity = commodities[randomIndex]
            var numberToAdd = 1 + rand(10 - randomIndex)
            if (randomIndex + numberToAdd) > sum {
                numberToAdd = sum - i
            }
            //print("add \(numberToAdd) of commodity \(randomCommodity.rawValue)")
            i += numberToAdd
            //print("i = \(i), sum = \(sum)")
            
            let cargo = TradeItem(item: randomCommodity, quantity: numberToAdd, pricePaid: 0)
            ship.cargo.append(cargo)
        }
        
        
        
        
        // fill tanks, set no tribbles
        
        // fill weapon slots
        
        // fill shield slots
        
        // set shield & hull strength
        
        // set crew
        
        displayResults()
    }
    
    func displayResults() {
        print("*****************Results of generateOpponent()********************")
        print("ship type: \(ship.type)")
        print("GADGETS:")
        var slot = 0
        for gadget in ship.gadget {
            print("slot \(slot): \(gadget.name)")
            slot += 1
        }
        print("CARGO:")
        for item in ship.cargo {
            print("item: \(item.name), quantity: \(item.quantity)")
        }
    }
    
    
    
    
    
    func pickShipRandomlyBasedOnOccurance(tries: Int) -> ShipType {
        let ships: [ShipType] = [ShipType.Flea, ShipType.Gnat, ShipType.Firefly, ShipType.Mosquito, ShipType.Bumblebee, ShipType.Beetle, ShipType.Hornet, ShipType.Grasshopper, ShipType.Termite, ShipType.Wasp]
        let chancePerShip: [Int] = [2, 28, 20, 20, 15, 3, 6, 2, 2, 2]       // CHANCES SETTABLE HERE
        var resultRandom: [Int] = []
        

        // maxIndex created outside loop, logs the best ship of all the times the loop runs
        
        // maxIndex should log the index of chancePerShip representing the best so far
        
        var runningBestShipIndex: Int = 0
        for _ in 0...tries {
            var maxIndex: Int = 0
            var max: Int = 0
            resultRandom = []
            for number in chancePerShip {
                let result = Int(arc4random_uniform(UInt32(number)))
                resultRandom.append(result)
            }
            print(resultRandom)
            
            //var max: Int = 0

            var j: Int = 0
            for result in resultRandom {
                if result >= max {
                    max = result
                    maxIndex = j
                }
                j += 1
                //print("inside loop, j is \(j), max is \(max), result is \(result), maxIndex is: \(maxIndex)")
            }
            //print("winner is \(ships[maxIndex])")
            if maxIndex > runningBestShipIndex {
                runningBestShipIndex = maxIndex
            }
        }
        //print("executed \(tries) tries")
        print("overall winner is \(ships[runningBestShipIndex])")
        return ships[runningBestShipIndex]
    }
    
    func addRandomlyChosenGadget(tries: Int) {
        let gadgets: [GadgetType] = [GadgetType.CargoBays, GadgetType.AutoRepair, GadgetType.Navigation, GadgetType.Targeting]
        let chances: [Int] = [35, 20, 20, 20, 5]
        
        var runningBestGadgetIndex: Int = 0
        for _ in 0...tries {
            var max: Int = 0
            var maxIndex: Int = 0
            var randomResults: [Int] = []
            var j = 0
            for chance in chances {
                let result = Int(arc4random_uniform(UInt32(chance)))
                randomResults.append(result)
                if result >= max {
                    max = result
                    maxIndex = j
                }
                j += 1
            }
            if maxIndex > runningBestGadgetIndex {
                runningBestGadgetIndex = maxIndex
            }
        }
        print("result: \(gadgets[runningBestGadgetIndex])")
        let newGadget = Gadget(type: gadgets[runningBestGadgetIndex])
        ship.gadget.append(newGadget)
    }
}
