//
//  Ship.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

// one class for both player and opponent ships. Optionals are used for fields only needed for player ship
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

    
    func initFlea() {
        type = ShipType.Flea
        name = "Flea"
        cargoBays = 10
        weaponSlots = 0
        shieldSlots = 0
        gadgetSlots = 0
        crewQuarters = 1
        fuelTanks = 20
        minTechLevel = TechLevelType.techLevel4
        costOfFuel = 1
        price = 2000
        bounty = 5
        occurance = 2
        hullStrength = 25
        police = -1
        pirates = -1
        traders = 0
        repairCosts = 1
        probabilityOfHit = 0
    }
    
    func initGnat() {
        type = ShipType.Gnat
        name = "Gnat"
        cargoBays = 15
        weaponSlots = 1
        shieldSlots = 0
        gadgetSlots = 1
        crewQuarters = 1
        fuelTanks = 14
        minTechLevel = TechLevelType.techLevel5
        costOfFuel = 2
        price = 10000
        bounty = 50
        occurance = 28
        hullStrength = 100
        police = 0
        pirates = 0
        traders = 0
        repairCosts = 1
        probabilityOfHit = 1
    }
    
    func initFirefly() {
        type = ShipType.Firefly
        name = "Firefly"
        cargoBays = 20
        weaponSlots = 1
        shieldSlots = 1
        gadgetSlots = 1
        crewQuarters = 1
        fuelTanks = 17
        minTechLevel = TechLevelType.techLevel5
        costOfFuel = 3
        price = 25000
        bounty = 75
        occurance = 20
        hullStrength = 100
        police = 0
        pirates = 0
        traders = 0
        repairCosts = 1
        probabilityOfHit = 1
    }
    
    func initMosquito() {
        type = ShipType.Mosquito
        name = "Mosquito"
        cargoBays = 15
        weaponSlots = 2
        shieldSlots = 1
        gadgetSlots = 1
        crewQuarters = 1
        fuelTanks = 13
        minTechLevel = TechLevelType.techLevel5
        costOfFuel = 5
        price = 30000
        bounty = 100
        occurance = 20
        hullStrength = 100
        police = 0
        pirates = 1
        traders = 0
        repairCosts = 1
        probabilityOfHit = 1
    }
    
    func initBumblebee() {
        type = ShipType.Bumblebee
        name = "Bumblebee"
        cargoBays = 25
        weaponSlots = 1
        shieldSlots = 2
        gadgetSlots = 2
        crewQuarters = 2
        fuelTanks = 15
        minTechLevel = TechLevelType.techLevel5
        costOfFuel = 7
        price = 60000
        bounty = 125
        occurance = 15
        hullStrength = 100
        police = 1
        pirates = 1
        traders = 0
        repairCosts = 1
        probabilityOfHit = 2
    }
    
    func initBeetle() {
        type = ShipType.Beetle
        name = "Beetle"
        cargoBays = 50
        weaponSlots = 0
        shieldSlots = 1
        gadgetSlots = 1
        crewQuarters = 3
        fuelTanks = 14
        minTechLevel = TechLevelType.techLevel5
        costOfFuel = 10
        price = 80000
        bounty = 50
        occurance = 3
        hullStrength = 50
        police = -1
        pirates = -1
        traders = 0
        repairCosts = 1
        probabilityOfHit = 2
    }
    
    func initHornet() {
        type = ShipType.Hornet
        name = "Hornet"
        cargoBays = 20
        weaponSlots = 3
        shieldSlots = 2
        gadgetSlots = 1
        crewQuarters = 2
        fuelTanks = 16
        minTechLevel = TechLevelType.techLevel6
        costOfFuel = 15
        price = 100000
        bounty = 200
        occurance = 6
        hullStrength = 150
        police = 2
        pirates = 3
        traders = 1
        repairCosts = 2
        probabilityOfHit = 3
    }
    
    func initGrasshopper() {
        type = ShipType.Grasshopper
        name = "Grasshopper"
        cargoBays = 30
        weaponSlots = 2
        shieldSlots = 2
        gadgetSlots = 3
        crewQuarters = 3
        fuelTanks = 15
        minTechLevel = TechLevelType.techLevel6
        costOfFuel = 15
        price = 150000
        bounty = 300
        occurance = 2
        hullStrength = 150
        police = 3
        pirates = 4
        traders = 2
        repairCosts = 3
        probabilityOfHit = 3
    }
    
    func initTermite() {
        type = ShipType.Termite
        name = "Termite"
        cargoBays = 60
        weaponSlots = 1
        shieldSlots = 3
        gadgetSlots = 2
        crewQuarters = 3
        fuelTanks = 13
        minTechLevel = TechLevelType.techLevel7
        costOfFuel = 20
        price = 225000
        bounty = 300
        occurance = 2
        hullStrength = 200
        police = 4
        pirates = 5
        traders = 3
        repairCosts = 4
        probabilityOfHit = 4
    }
    
    func initWasp() {
        type = ShipType.Wasp
        name = "Wasp"
        cargoBays = 35
        weaponSlots = 3
        shieldSlots = 2
        gadgetSlots = 2
        crewQuarters = 3
        fuelTanks = 14
        minTechLevel = TechLevelType.techLevel7
        costOfFuel = 20
        price = 300000
        bounty = 500
        occurance = 2
        hullStrength = 200
        police = 5
        pirates = 6
        traders = 4
        repairCosts = 5
        probabilityOfHit = 4
    }
    
    func initSpaceMonster() {
        type = ShipType.SpaceMonster
        name = "Space Monster"
        cargoBays = 0
        weaponSlots = 3
        shieldSlots = 0
        gadgetSlots = 0
        crewQuarters = 1
        fuelTanks = 1
        minTechLevel = TechLevelType.techLevel8
        costOfFuel = 1
        price = 500000
        bounty = 0
        occurance = 0
        hullStrength = 500
        police = 8
        pirates = 8
        traders = 8
        repairCosts = 1
        probabilityOfHit = 4
    }
    
    func initDragonfly() {
        type = ShipType.Dragonfly
        name = "Dragonfly"
        cargoBays = 0
        weaponSlots = 2
        shieldSlots = 3
        gadgetSlots = 2
        crewQuarters = 1
        fuelTanks = 1
        minTechLevel = TechLevelType.techLevel8
        costOfFuel = 1
        price = 500000
        bounty = 0
        occurance = 0
        hullStrength = 10
        police = 8
        pirates = 8
        traders = 8
        repairCosts = 1
        probabilityOfHit = 1
    }
    
    func initMantis() {
        type = ShipType.Mantis
        name = "Mantis"
        cargoBays = 0
        weaponSlots = 3
        shieldSlots = 1
        gadgetSlots = 3
        crewQuarters = 3
        fuelTanks = 1
        minTechLevel = TechLevelType.techLevel8
        costOfFuel = 1
        price = 500000
        bounty = 0
        occurance = 0
        hullStrength = 300
        police = 8
        pirates = 8
        traders = 8
        repairCosts = 1
        probabilityOfHit = 2
    }
    
    func initScarab() {
        type = ShipType.Scarab
        name = "Scarab"
        cargoBays = 20
        weaponSlots = 2
        shieldSlots = 0
        gadgetSlots = 0
        crewQuarters = 2
        fuelTanks = 1
        minTechLevel = TechLevelType.techLevel8
        costOfFuel = 1
        price = 500000
        bounty = 0
        occurance = 0
        hullStrength = 400
        police = 8
        pirates = 8
        traders = 8
        repairCosts = 1
        probabilityOfHit = 3
    }
    
    func initBottle() {
        type = ShipType.Bottle
        name = "Bottle"
        cargoBays = 0
        weaponSlots = 0
        shieldSlots = 0
        gadgetSlots = 0
        crewQuarters = 0
        fuelTanks = 1
        minTechLevel = TechLevelType.techLevel8
        costOfFuel = 1
        price = 100
        bounty = 0
        occurance = 0
        hullStrength = 10
        police = 8
        pirates = 8
        traders = 8
        repairCosts = 1
        probabilityOfHit = 1
    }
    
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
            self.initFlea()
        case ShipType.Gnat:
            self.initGnat()
        case ShipType.Firefly:
            self.initFirefly()
        case ShipType.Mosquito:
            self.initMosquito()
        case ShipType.Bumblebee:
            self.initBumblebee()
        case ShipType.Beetle:
            self.initBeetle()
        case ShipType.Hornet:
            self.initHornet()
        case ShipType.Grasshopper:
            self.initGrasshopper()
        case ShipType.Termite:
            self.initTermite()
        case ShipType.Wasp:
            self.initWasp()
        case ShipType.SpaceMonster:
            self.initSpaceMonster()
        case ShipType.Dragonfly:
            self.initDragonfly()
        case ShipType.Mantis:
            self.initMantis()
        case ShipType.Scarab:
            self.initScarab()
        case ShipType.Bottle:
            self.initBottle()
        default:
            self.initFlea()
        
        self.IFFStatus = IFFStatus
        self.fuel = self.fuelTanks
        self.hull = self.hullStrength
    }
}