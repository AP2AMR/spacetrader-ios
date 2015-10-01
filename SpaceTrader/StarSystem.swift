//
//  StarSystem.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/6/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

// NOT DONE, COMMENTED OUT SO WON'T INTERFERE

class StarSystem {
    var name: String
    var techLevel: TechLevelType
    var politics: PoliticsType
    var status: StatusType
    var xCoord: Int = 0        // requires init
    var yCoord: Int = 0
    var specialResources: SpecialResourcesType
    var size: SizeType
    // trade items?
    var countdown: Int? = 1
    var visited: Bool = false
    var wormhole: Bool = false              // DEAL WITH THESE
    var wormholeDestination: Int = 0        // DEAL WITH THESE
    //var special: SpecialEventType

    // quantities and prices
    var water: Int = 0
    var furs: Int = 0
    var food: Int = 0
    var ore: Int = 0
    var games: Int = 0
    var firearms: Int = 0
    var medicine: Int = 0
    var machines: Int = 0
    var narcotics: Int = 0
    var robots: Int = 0
    
    var waterBuy: Int = 0
    var fursBuy: Int = 0
    var foodBuy: Int = 0
    var oreBuy: Int = 0
    var gamesBuy: Int = 0
    var firearmsBuy: Int = 0
    var medicineBuy: Int = 0
    var machinesBuy: Int = 0
    var narcoticsBuy: Int = 0
    var robotsBuy: Int = 0
    var waterSell: Int = 0
    var fursSell: Int = 0
    var foodSell: Int = 0
    var oreSell: Int = 0
    var gamesSell: Int = 0
    var firearmsSell: Int = 0
    var medicineSell: Int = 0
    var machinesSell: Int = 0
    var narcoticsSell: Int = 0
    var robotsSell: Int = 0
    
    init(name: String, techLevel: TechLevelType, politics: PoliticsType, status: StatusType, xCoord: Int, yCoord: Int, specialResources: SpecialResourcesType, size: SizeType) {
        self.name = name
        self.techLevel = techLevel
        self.politics = politics
        self.status = status
        self.xCoord = xCoord
        self.yCoord = yCoord
        self.specialResources = specialResources
        self.size = size
        self.countdown = nil
        self.visited = false
    }
}