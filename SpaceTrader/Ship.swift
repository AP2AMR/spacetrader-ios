//
//  Ship.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class Ship {
    var type: ShipType
    var name: String
    var cargoBays: Int
    var weaponSlots: Int
    var shieldSlots: Int
    var gadgetSlots: Int
    var crewQuarters: Int
    var fuelTanks: Int
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
    
    var IFFStatus: IFFStatusType    // player, police, pirate, trader
    // image
    // image shielded
    // image damaged
    
    
    var cargo: [TradeItem] = []     // initializing everything empty. Override this if needed.
    var weapon: [Weapon] = []
    var shield: [Shield] = []
    var shieldStrength: [Int] = []  // these arrays are getting scary
    var gadget: [Gadget] = []
    var crew: [CrewMember] = []
    var fuel: Int
    var hull: Int
    var tribbles: Int = 0
    
    // escape pod currently is a global, as escape pods are transferred

    init(type: ShipType, IFFStatus: IFFStatusType) {
        self.type = type
        self.cargo = []
        self.weapon = []
        self.shield = []
        self.shieldStrength = []
        self.gadget = []
        self.crew = []
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
        }
        
        self.IFFStatus = IFFStatus
        self.fuel = fuelTanks
        self.hull = hullStrength
        // must presumably still populate weapons, shields, etc on non-player ships. See global.c for info
    }
}