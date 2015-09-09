//
//  TradeItem.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class TradeItem {
    let item: TradeItemType
    let name: String
    let techProduction: TechLevelType       // Tech level needed for production
    let techUsage: TechLevelType            // Tech level needed to use
    let techTopProduction: TechLevelType    // Tech level which produces this item the most
    let priceLowTech: Int                   // Medium price at lowest tech level
    let priceIncrease: Int                  // Price increase per tech level
    let variance: Int                       // Max percentage above or below calculated price
    let doublePriceStatus: StatusType       // Price increases considerably when this event occurs
    let cheapResource: SpecialResourcesType // When this resource is available, this trade item is cheap
    let expensiveResource: SpecialResourcesType
    let minTradePrice: Int                  // Minimum price to buy/sell in orbit
    let maxTradePrice: Int                  // Maximum price to buy/sell in orbit
    let roundOff: Int                       // Roundoff price for trade in orbit
    
    init(item: TradeItemType) {
        self.item = item
        
        switch item {
        case TradeItemType.Water:
            self.name = "Water"
            self.techProduction = TechLevelType.techLevel0
            self.techUsage = TechLevelType.techLevel0
            self.techTopProduction = TechLevelType.techLevel2
            self.priceLowTech = 30
            self.priceIncrease = +3
            self.variance = 4
            self.doublePriceStatus = StatusType.drought
            self.cheapResource = SpecialResourcesType.lotsOfWater
            self.expensiveResource = SpecialResourcesType.desert
            self.minTradePrice = 30
            self.maxTradePrice = 50
            self.roundOff = 1
        case TradeItemType.Furs:
            self.name = "Furs"
            self.techProduction = TechLevelType.techLevel0
            self.techUsage = TechLevelType.techLevel0
            self.techTopProduction = TechLevelType.techLevel0
            self.priceLowTech = 250
            self.priceIncrease = +10
            self.variance = 10
            self.doublePriceStatus = StatusType.cold
            self.cheapResource = SpecialResourcesType.richFauna
            self.expensiveResource = SpecialResourcesType.lifeless
            self.minTradePrice = 230
            self.maxTradePrice = 280
            self.roundOff = 5
        default:
            self.name = "Water"
            self.techProduction = TechLevelType.techLevel0
            self.techUsage = TechLevelType.techLevel0
            self.techTopProduction = TechLevelType.techLevel2
            self.priceLowTech = 30
            self.priceIncrease = +3
            self.variance = 4
            self.doublePriceStatus = StatusType.drought
            self.cheapResource = SpecialResourcesType.lotsOfWater
            self.expensiveResource = SpecialResourcesType.desert
            self.minTradePrice = 30
            self.maxTradePrice = 50
            self.roundOff = 1
        }
    }
}

//{ "Furs", 	  0, 0, 0,  250,  +10,  10, COLD,          RICHFAUNA,      LIFELESS,     230,  280,   5 },
//{ "Food", 	  1, 0, 1,  100,   +5,   5, CROPFAILURE,   RICHSOIL,       POORSOIL,      90,  160,   5 },
//{ "Ore", 	  2, 2, 3,  350,  +20,  10, WAR,           MINERALRICH,    MINERALPOOR,  350,  420,  10 },
//{ "Games",     3, 1, 6,  250,  -10,   5, BOREDOM,       ARTISTIC,       -1,           160,  270,   5 },
//{ "Firearms",  3, 1, 5, 1250,  -75, 100, WAR,           WARLIKE,        -1,           600, 1100,  25 },
//{ "Medicine",  4, 1, 6,  650,  -20,  10, PLAGUE,        LOTSOFHERBS,    -1,           400,  700,  25 },
//{ "Machines",  4, 3, 5,  900,  -30,   5, LACKOFWORKERS, -1,             -1,           600,  800,  25 },
//{ "Narcotics", 5, 0, 5, 3500, -125, 150, BOREDOM,       WEIRDMUSHROOMS, -1,          2000, 3000,  50 },
//{ "Robots",    6, 4, 7, 5000, -150, 100, LACKOFWORKERS, -1,             -1,          3500, 5000, 100 }