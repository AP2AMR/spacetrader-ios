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
        minTechLevel = TechLevelType.techLevel4     // hopefully this is zero indexed!
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
        
        fuel = 20
        hull = 25
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
        
        fuel = 14
        hull = 100
        
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
        
        fuel = 17
        hull = 100
        
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
        
        fuel = 13
        hull = 100
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
        
        fuel = 15
        hull = 100
        
    }
    
    func initBeetle() {
        
    }
    
    func initHornet() {
        
    }
    
    func initGrasshopper() {
        
    }
    
    func initTermite() {
        
    }
    
    func initWasp() {
        
    }
    
    func initSpaceMonster() {
        
    }
    
    func initDragonfly() {
        
    }
    
    func initMantis() {
        
    }
    
    func initScarab() {
        
    }
    
    func initBottle() {
        
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
    }
    


}

//    {
//    { "Flea",          10, 0, 0, 0, 1, MAXRANGE, 4,  1,   2000,   5,  2,  25, -1, -1,  0, 1, 0 },
//    { "Gnat",          15, 1, 0, 1, 1, 14,       5,  2,  10000,  50, 28, 100,  0,  0,  0, 1, 1 },
//    { "Firefly",       20, 1, 1, 1, 1, 17,       5,  3,  25000,  75, 20, 100,  0,  0,  0, 1, 1 },
//    { "Mosquito",      15, 2, 1, 1, 1, 13,       5,  5,  30000, 100, 20, 100,  0,  1,  0, 1, 1 },
//    { "Bumblebee",     25, 1, 2, 2, 2, 15,       5,  7,  60000, 125, 15, 100,  1,  1,  0, 1, 2 },
//    { "Beetle",        50, 0, 1, 1, 3, 14,       5, 10,  80000,  50,  3,  50, -1, -1,  0, 1, 2 },
//    { "Hornet",        20, 3, 2, 1, 2, 16, 	   6, 15, 100000, 200,  6, 150,  2,  3,  1, 2, 3 },
//    { "Grasshopper",   30, 2, 2, 3, 3, 15,       6, 15, 150000, 300,  2, 150,  3,  4,  2, 3, 3 },
//    { "Termite",       60, 1, 3, 2, 3, 13,       7, 20, 225000, 300,  2, 200,  4,  5,  3, 4, 4 },
//    { "Wasp",          35, 3, 2, 2, 3, 14,       7, 20, 300000, 500,  2, 200,  5,  6,  4, 5, 4 },
//    // The ships below can't be bought
//    { "Space monster",  0, 3, 0, 0, 1,  1,       8,  1, 500000,   0,  0, 500,  8,  8,  8, 1, 4 },
//    { "Dragonfly",      0, 2, 3, 2, 1,  1,       8,  1, 500000,   0,  0,  10,  8,  8,  8, 1, 1 },
//    { "Mantis",         0, 3, 1, 3, 3,  1,       8,  1, 500000,   0,  0, 300,  8,  8,  8, 1, 2 },
//    { "Scarab",        20, 2, 0, 0, 2,  1,       8,  1, 500000,   0,  0, 400,  8,  8,  8, 1, 3 },
//    { "Bottle",         0, 0, 0, 0, 0,  1,       8,  1,    100,   0,  0,  10,  8,  8,  8, 1, 1 }
//    };

// big question: what to do about prepopulated vs specific things?

// proposal: an enum of shiptypes, and an init method that sets things up specifically based on shiptype. A separate CustomizeShip method.

// another question: do we go whole hog for any ship, or do we have different classes for player and opponent ships?

// struct for shipType
//char* Name;
//Byte CargoBays;		// Number of cargo bays
//Byte WeaponSlots;	// Number of lasers possible
//Byte ShieldSlots;	// Number of shields possible
//Byte GadgetSlots;	// Number of gadgets possible (e.g. docking computers)
//Byte CrewQuarters;	// Number of crewmembers possible
//Byte FuelTanks;		// Each tank contains enough fuel to travel 10 parsecs
//Byte MinTechLevel;	// Minimum tech level needed to build ship
//Byte CostOfFuel;	// Cost to fill one tank with fuel
//long Price;			// Base ship cost
//int Bounty;			// Base bounty
//int Occurrence;		// Percentage of the ships you meet
//long HullStrength;	// Hull strength
//int Police;			// Encountered as police with at least this strength
//int Pirates;		// idem Pirates
//int Traders;		// idem Traders
//Byte RepairCosts;	// Repair costs for 1 point of hull strength.
//Byte Size;			// Determines how easy it is to hit this ship
//} SHIPTYPE;