//
//  Ship.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class SpaceShip {
    var type: ShipType
    var name: String
    var cargoBays: Int
    var weaponSlots: Int
    var shieldSlots: Int
    var gadgetSlots: Int
    var crewQuarters: Int
    var fuelTanks: Int
    var size: String = ""
    var minTechLevel: TechLevelType
    var costOfFuel: Int
    var price: Int
    var bounty: Int
    var occurance: Int
    var hullStrength: Int
    var police: Int                 // encountered as police with at least this strength
    var pirates: Int
    var traders: Int
    var repairCosts: Int            // cost per one point of damage
    var probabilityOfHit: Int         // scale of 0 to 4, 4 is easiest to hit
    var totalWeapons: Int {
        get {
            var total: Int = 0
            for entry in weapon {
                total += entry.power
            }
            return total
        }
    }
    var photonDisruptor: Bool {
        get {
            var pd = false
            for item in weapon {
                if item.type == WeaponType.photonDisruptor {
                    pd = true
                }
            }
            return pd
        }
    }
    
    var totalShields: Int {
        if shield.count == 0 {
            return 0
        } else {
            var total = 0
            for item in shield {
                total += item.currentStrength
            }
            return total
        }
    }
    
    var totalBays: Int {
        var total = cargoBays
        for item in gadget {
            if item.type == GadgetType.CargoBays {
                total += 5
            }
        }
        return total
    }
    
    var value: Int {
        var total = self.price
        for item in weapon {
            total += Int((Double(item.price) * 0.75))
        }
        for item in shield {
            total += Int((Double(item.price) * 0.75))
        }
        for item in gadget {
            total += Int((Double(item.price) * 0.75))
        }
        
        let valueOfCargoOnBoard = getTotalWorthOfCargo()
        total += valueOfCargoOnBoard
    
        return total
    }
    
    var raided = false
    var artifactOnBoard = false
    var justLootedMarieCeleste = false
    var cloaked = false
    var disabled = false
    var specialCargo: [SpecialCargoItem] = []
    
    var IFFStatus: IFFStatusType    // player, police, pirate, trader
    // image
    // image shielded
    // image damaged
    
    
    var cargo: [TradeItem] = []     // initializing everything empty. Override this if needed.
    var weapon: [Weapon] = []
    var shield: [Shield] = []
    //var shieldStrength: [Int] = []  // these arrays are getting scary
    var gadget: [Gadget] = []
    var crew: [CrewMember] = []
    var fuel: Int
    var hull: Int
    var tribbles: Int = 0
    
    var hullPercentage: Int {
        get {
            return Int(((Double(hull) / Double(hullStrength)) * 100))
        }
        set(newPercentage) {
            hull = newPercentage * (hullStrength / 100)
        }
    }
    
    var shieldPercentage: Int {
        get {
            var totalPossible: Double = 0
            var totalShield: Double = 0
            
            for entry in shield {
                totalPossible += Double(entry.power)
                totalShield += Double(entry.currentStrength)
            }
            
            if totalPossible != 0 {
                let percentage = (totalShield / totalPossible) * 100
                return Int(percentage)
            } else {
                return 0
            }
        }
    }
    
    var totalCargo: Int {
        get {
            var totalItems: Int = 0
            for item in cargo {
                totalItems += item.quantity
            }
            return totalItems
        }
    }
    
    var baysAvailable: Int {
        get {
            return cargoBays - totalCargo
        }
    }
    
    var waterOnBoard: Int = 0
    var fursOnBoard: Int = 0
    var foodOnBoard: Int = 0
    var oreOnBoard: Int = 0
    var gamesOnBoard: Int = 0
    var firearmsOnBoard: Int = 0
    var medicineOnBoard: Int = 0
    var machinesOnBoard: Int = 0
    var narcoticsOnBoard: Int = 0
    var robotsOnBoard: Int = 0
    
    // escape pod currently is a global, as escape pods are transferred

    init(type: ShipType, IFFStatus: IFFStatusType) {
        self.type = type
        //self.cargo = []
        self.weapon = []
        self.shield = []
        //self.shieldStrength = []
        self.gadget = []
        self.crew = []
        
        // cargo
        let commodities: [TradeItemType] = [TradeItemType.Water, TradeItemType.Furs, TradeItemType.Food, TradeItemType.Ore, TradeItemType.Games, TradeItemType.Firearms, TradeItemType.Medicine, TradeItemType.Machines, TradeItemType.Narcotics, TradeItemType.Robots]
        for item in commodities {
            let newItem = TradeItem(item: item, quantity: 0, pricePaid: 0)
            self.cargo.append(newItem)
        }

        print("NEW CARGO INIT**********************************************************************")
        for item in cargo {
            print("item: \(item.name), quantity: \(item.quantity)")
        }
        
        switch type {
            case ShipType.Flea:
                self.type = ShipType.Flea
                self.name = "Flea"
                self.cargoBays = 10
                self.weaponSlots = 0
                self.shieldSlots = 0
                self.gadgetSlots = 0
                self.crewQuarters = 1
                self.fuelTanks = 20
                self.minTechLevel = TechLevelType.techLevel4
                self.costOfFuel = 1
                self.price = 2000
                self.bounty = 5
                self.occurance = 2
                self.hullStrength = 25
                self.police = -1
                self.pirates = -1
                self.traders = 0
                self.repairCosts = 1
                self.probabilityOfHit = 0
                self.size = "Tiny"
            case ShipType.Gnat:
                self.type = ShipType.Gnat
                self.name = "Gnat"
                self.cargoBays = 15
                self.weaponSlots = 1
                self.shieldSlots = 0
                self.gadgetSlots = 1
                self.crewQuarters = 1
                self.fuelTanks = 14
                self.minTechLevel = TechLevelType.techLevel5
                self.costOfFuel = 2
                self.price = 10000
                self.bounty = 50
                self.occurance = 28
                self.hullStrength = 100
                self.police = 0
                self.pirates = 0
                self.traders = 0
                self.repairCosts = 1
                self.probabilityOfHit = 1
                self.size = "Small"
            case ShipType.Firefly:
                self.type = ShipType.Firefly
                self.name = "Firefly"
                self.cargoBays = 20
                self.weaponSlots = 1
                self.shieldSlots = 1
                self.gadgetSlots = 1
                self.crewQuarters = 1
                self.fuelTanks = 17
                self.minTechLevel = TechLevelType.techLevel5
                self.costOfFuel = 3
                self.price = 25000
                self.bounty = 75
                self.occurance = 20
                self.hullStrength = 100
                self.police = 0
                self.pirates = 0
                self.traders = 0
                self.repairCosts = 1
                self.probabilityOfHit = 1
                self.size = "Small"
            case ShipType.Mosquito:
                self.type = ShipType.Mosquito
                self.name = "Mosquito"
                self.cargoBays = 15
                self.weaponSlots = 2
                self.shieldSlots = 1
                self.gadgetSlots = 1
                self.crewQuarters = 1
                self.fuelTanks = 13
                self.minTechLevel = TechLevelType.techLevel5
                self.costOfFuel = 5
                self.price = 30000
                self.bounty = 100
                self.occurance = 20
                self.hullStrength = 100
                self.police = 0
                self.pirates = 1
                self.traders = 0
                self.repairCosts = 1
                self.probabilityOfHit = 1
                self.size = "Small"
            case ShipType.Bumblebee:
                self.type = ShipType.Bumblebee
                self.name = "Bumblebee"
                self.cargoBays = 25
                self.weaponSlots = 1
                self.shieldSlots = 2
                self.gadgetSlots = 2
                self.crewQuarters = 2
                self.fuelTanks = 15
                self.minTechLevel = TechLevelType.techLevel5
                self.costOfFuel = 7
                self.price = 60000
                self.bounty = 125
                self.occurance = 15
                self.hullStrength = 100
                self.police = 1
                self.pirates = 1
                self.traders = 0
                self.repairCosts = 1
                self.probabilityOfHit = 2
                self.size = "Medium"
            case ShipType.Beetle:
                self.type = ShipType.Beetle
                self.name = "Beetle"
                self.cargoBays = 50
                self.weaponSlots = 0
                self.shieldSlots = 1
                self.gadgetSlots = 1
                self.crewQuarters = 3
                self.fuelTanks = 14
                self.minTechLevel = TechLevelType.techLevel5
                self.costOfFuel = 10
                self.price = 80000
                self.bounty = 50
                self.occurance = 3
                self.hullStrength = 50
                self.police = -1
                self.pirates = -1
                self.traders = 0
                self.repairCosts = 1
                self.probabilityOfHit = 2
                self.size = "Medium"
            case ShipType.Hornet:
                self.type = ShipType.Hornet
                self.name = "Hornet"
                self.cargoBays = 20
                self.weaponSlots = 3
                self.shieldSlots = 2
                self.gadgetSlots = 1
                self.crewQuarters = 2
                self.fuelTanks = 16
                self.minTechLevel = TechLevelType.techLevel6
                self.costOfFuel = 15
                self.price = 100000
                self.bounty = 200
                self.occurance = 6
                self.hullStrength = 150
                self.police = 2
                self.pirates = 3
                self.traders = 1
                self.repairCosts = 2
                self.probabilityOfHit = 3
                self.size = "Large"
            case ShipType.Grasshopper:
                self.type = ShipType.Grasshopper
                self.name = "Grasshopper"
                self.cargoBays = 30
                self.weaponSlots = 2
                self.shieldSlots = 2
                self.gadgetSlots = 3
                self.crewQuarters = 3
                self.fuelTanks = 15
                self.minTechLevel = TechLevelType.techLevel6
                self.costOfFuel = 15
                self.price = 150000
                self.bounty = 300
                self.occurance = 2
                self.hullStrength = 150
                self.police = 3
                self.pirates = 4
                self.traders = 2
                self.repairCosts = 3
                self.probabilityOfHit = 3
                self.size = "Large"
            case ShipType.Termite:
                self.type = ShipType.Termite
                self.name = "Termite"
                self.cargoBays = 60
                self.weaponSlots = 1
                self.shieldSlots = 3
                self.gadgetSlots = 2
                self.crewQuarters = 3
                self.fuelTanks = 13
                self.minTechLevel = TechLevelType.techLevel7
                self.costOfFuel = 20
                self.price = 225000
                self.bounty = 300
                self.occurance = 2
                self.hullStrength = 200
                self.police = 4
                self.pirates = 5
                self.traders = 3
                self.repairCosts = 4
                self.probabilityOfHit = 4
                self.size = "Huge"
            case ShipType.Wasp:
                self.type = ShipType.Wasp
                self.name = "Wasp"
                self.cargoBays = 35
                self.weaponSlots = 3
                self.shieldSlots = 2
                self.gadgetSlots = 2
                self.crewQuarters = 3
                self.fuelTanks = 14
                self.minTechLevel = TechLevelType.techLevel7
                self.costOfFuel = 20
                self.price = 300000
                self.bounty = 500
                self.occurance = 2
                self.hullStrength = 200
                self.police = 5
                self.pirates = 6
                self.traders = 4
                self.repairCosts = 5
                self.probabilityOfHit = 4
                self.size = "Huge"
            case ShipType.Custom:
                // THIS DATA LIFTED FROM WASP. FIX.
                self.type = ShipType.Wasp
                self.name = "Wasp"
                self.cargoBays = 35
                self.weaponSlots = 3
                self.shieldSlots = 2
                self.gadgetSlots = 2
                self.crewQuarters = 3
                self.fuelTanks = 14
                self.minTechLevel = TechLevelType.techLevel7
                self.costOfFuel = 20
                self.price = 300000
                self.bounty = 500
                self.occurance = 2
                self.hullStrength = 200
                self.police = 5
                self.pirates = 6
                self.traders = 4
                self.repairCosts = 5
                self.probabilityOfHit = 4
            case ShipType.SpaceMonster:
                self.type = ShipType.SpaceMonster
                self.name = "Space Monster"
                self.cargoBays = 0
                self.weaponSlots = 3
                self.shieldSlots = 0
                self.gadgetSlots = 0
                self.crewQuarters = 1
                self.fuelTanks = 1
                self.minTechLevel = TechLevelType.techLevel8
                self.costOfFuel = 1
                self.price = 500000
                self.bounty = 0
                self.occurance = 0
                self.hullStrength = 500
                self.police = 8
                self.pirates = 8
                self.traders = 8
                self.repairCosts = 1
                self.probabilityOfHit = 4
            case ShipType.Dragonfly:
                self.type = ShipType.Dragonfly
                self.name = "Dragonfly"
                self.cargoBays = 0
                self.weaponSlots = 2
                self.shieldSlots = 3
                self.gadgetSlots = 2
                self.crewQuarters = 1
                self.fuelTanks = 1
                self.minTechLevel = TechLevelType.techLevel8
                self.costOfFuel = 1
                self.price = 500000
                self.bounty = 0
                self.occurance = 0
                self.hullStrength = 10
                self.police = 8
                self.pirates = 8
                self.traders = 8
                self.repairCosts = 1
                self.probabilityOfHit = 1
            case ShipType.Mantis:
                self.type = ShipType.Mantis
                self.name = "Mantis"
                self.cargoBays = 0
                self.weaponSlots = 3
                self.shieldSlots = 1
                self.gadgetSlots = 3
                self.crewQuarters = 3
                self.fuelTanks = 1
                self.minTechLevel = TechLevelType.techLevel8
                self.costOfFuel = 1
                self.price = 500000
                self.bounty = 0
                self.occurance = 0
                self.hullStrength = 300
                self.police = 8
                self.pirates = 8
                self.traders = 8
                self.repairCosts = 1
                self.probabilityOfHit = 2
            case ShipType.Scarab:
                self.type = ShipType.Scarab
                self.name = "Scarab"
                self.cargoBays = 20
                self.weaponSlots = 2
                self.shieldSlots = 0
                self.gadgetSlots = 0
                self.crewQuarters = 2
                self.fuelTanks = 1
                self.minTechLevel = TechLevelType.techLevel8
                self.costOfFuel = 1
                self.price = 500000
                self.bounty = 0
                self.occurance = 0
                self.hullStrength = 400
                self.police = 8
                self.pirates = 8
                self.traders = 8
                self.repairCosts = 1
                self.probabilityOfHit = 3
            case ShipType.Scorpion:
                // THIS DATA LIFTED FROM SCARAB. FIX THIS.
                self.type = ShipType.Scarab
                self.name = "Scarab"
                self.cargoBays = 20
                self.weaponSlots = 2
                self.shieldSlots = 0
                self.gadgetSlots = 0
                self.crewQuarters = 2
                self.fuelTanks = 1
                self.minTechLevel = TechLevelType.techLevel8
                self.costOfFuel = 1
                self.price = 500000
                self.bounty = 0
                self.occurance = 0
                self.hullStrength = 400
                self.police = 8
                self.pirates = 8
                self.traders = 8
                self.repairCosts = 1
                self.probabilityOfHit = 3
            case ShipType.Bottle:
                self.type = ShipType.Bottle
                self.name = "Bottle"
                self.cargoBays = 0
                self.weaponSlots = 0
                self.shieldSlots = 0
                self.gadgetSlots = 0
                self.crewQuarters = 0
                self.fuelTanks = 1
                self.minTechLevel = TechLevelType.techLevel8
                self.costOfFuel = 1
                self.price = 100
                self.bounty = 0
                self.occurance = 0
                self.hullStrength = 10
                self.police = 8
                self.pirates = 8
                self.traders = 8
                self.repairCosts = 1
                self.probabilityOfHit = 1
            default:
                print("SCORPION AND CUSTOM NOT IMPLEMENTED YET. FIX IN SHIP.")
        }
        
        self.IFFStatus = IFFStatus
        self.fuel = fuelTanks
        self.hull = hullStrength
        // must presumably still populate weapons, shields, etc on non-player ships. See global.c for info
    }
    
    // THESE ARE THE ONLY METHODS THAT SHOULD DIRECTLY ADD, REMOVE, OR MEASURE AMOUNT OF CARGO************
    
    // addCargo and removeCargo functions assume quantities have been checked, but return false if not
    func addCargo(commodity: TradeItemType, quantity: Int, pricePaid: Int) -> Bool {
        // fail if not enough space
        if baysAvailable < quantity {
            return false
        }
        
        // get present quantity and pricePaid
        //var presentQuantity = 0
        //var oldPricePaid = 0
        for item in cargo {
            if item.item == commodity {
                let presentQuantity = item.quantity
                let oldPricePaid = item.pricePaid
                
                var newAverage = 0
                if presentQuantity != 0 {
                    newAverage = ((presentQuantity * oldPricePaid) + (quantity * pricePaid)) / (presentQuantity + quantity)
                } else {
                    newAverage = pricePaid
                }
                
                print("added \(quantity) new \(commodity.rawValue)")
                print("new average price paid: \(newAverage)")
                
                item.quantity += quantity
                item.pricePaid = newAverage
            }
        }
        
        return true
    }
    
    func removeCargo(commodity: TradeItemType, quantity: Int) -> Bool {
        // returns false if not that many on ship
        for item in cargo {
            if item.item == commodity {
                if item.quantity < quantity {
                    return false
                } else {
                    item.quantity -= quantity
                    // not really necessary
                    if item.quantity == 0 {
                        item.pricePaid = 0
                    }
                }
            }
        }
        
        return true
    }
    
    func getQuantity(commodity: TradeItemType) -> Int {
        var quantity = 0
        for item in cargo {
            if item.item == commodity {
                quantity = item.quantity
            }
        }
        return quantity
    }
    
    func getPricePaid(commodity: TradeItemType) -> Int {
        var pricePaid = 0
        for item in cargo {
            if item.item == commodity {
                pricePaid = item.pricePaid
            }
        }
        return pricePaid
    }
    
    func getTotalCargo() -> Int {
        var total = 0
        for item in cargo {
            total += item.quantity
        }
        return total
    }
    
    // END CARGO METHODS********************************************************************************
    
//    func sellAllCargo() {
//        let commodities: [TradeItemType] = [TradeItemType.Water, TradeItemType.Furs, TradeItemType.Food, TradeItemType.Ore, TradeItemType.Games, TradeItemType.Firearms, TradeItemType.Medicine, TradeItemType.Machines, TradeItemType.Narcotics, TradeItemType.Robots]
//        
//        for commodity in commodities {
//            let quantity = player.commanderShip.getQuantity(commodity)
//            player.sell(commodity, quantity: quantity)
//        }
//    }
    
    func getTotalWorthOfCargo() -> Int {
        var total = 0
        
        let commodities: [TradeItemType] = [TradeItemType.Water, TradeItemType.Furs, TradeItemType.Food, TradeItemType.Ore, TradeItemType.Games, TradeItemType.Firearms, TradeItemType.Medicine, TradeItemType.Machines, TradeItemType.Narcotics, TradeItemType.Robots]
        
        for commodity in commodities {
            let quantity = player.commanderShip.getQuantity(commodity)
            let salePrice = galaxy.currentSystem!.getSellPrice(commodity)
            let totalSalePrice = salePrice * quantity
            total += totalSalePrice
        }
        
        return total
    }
    
    func getMorgansLaserStatus() -> Bool {
        var status = false
        for item in weapon {
            if item.type == WeaponType.morgansLaser {
                status = true
            }
        }
        return status
    }
    
    func getFuelCompactorStatus() -> Bool {
        var status = false
        for item in gadget {
            if item.type == GadgetType.FuelCompactor {
                status = true
            }
        }
        return status
    }
    
    func getLightningShieldStatus() -> Bool {
        var status = false
        for item in shield {
            if item.type == ShieldType.lightningShield {
                status = true
            }
        }
        return status
    }
    
    func resetSpecialEquipment(morgansLaser: Bool, fuelCompactor: Bool, lightningShield: Bool) {
        // HANDLE POSSIBILITY OF NOT ALL STUFF BEING TRANSFERRABLE?

        if morgansLaser && (weaponSlots >= 1) {
            let laser = Weapon(type: WeaponType.morgansLaser)
            self.weapon.append(laser)
        }
        if fuelCompactor && (cargoBays >= 1) {
            let compactor = Gadget(type: GadgetType.FuelCompactor)
            self.gadget.append(compactor)
        }
        if lightningShield && (shieldSlots >= 1) {
            let lightning = Shield(type: ShieldType.lightningShield)
            self.shield.append(lightning)
        }
    }

}

class SpecialCargoItem {
    var name: String
    var quantity: Int
    var baysTakenUp: Int
    
    init(name: String, quantity: Int, baysTakenUp: Int) {
        self.name = name
        self.quantity = quantity
        self.baysTakenUp = baysTakenUp
    }
}