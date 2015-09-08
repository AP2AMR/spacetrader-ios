//
//  StarSystem.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/6/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation


class StarSystem {
    //var name: String?
    var techLevel: TechLevelType
    var politics: PoliticsType
    var status: StatusType
    var xCoord: Int?        // requires init
    var yCoord: Int?
    var specialResources: SpecialResourcesType
    var size: SizeType
    // trade items?
    var countdown: Int = 1
    var visited: Bool = false
    var special: SpecialEventType

    var water: Int
    var furs: Int
    var food: Int
    var ore: Int
    var games: Int
    var firearms: Int
    var medicine: Int
    var machines: Int
    var narcotics: Int
    var robots: Int
    
    init(techLevel: TechLevelType) {
        self.techLevel = techLevel
    }
    
    
    
//    struct PoliticsType {
//        // note: this system does use enums for tech levels, trade items.
//        // note: scales presumably go to ten(?)
//        struct Demo {
//            let name = "political system"
//            let index: Int = 0
//            let reactionIllegal: Int = 0    // reaction level to illegal goods. 0 = total acceptance
//            let activityPolice: Int = 0     // occurance rate of police. 0 = no police
//            let activityPirates: Int = 0    // occurance rate of pirates. 0 = no pirates
//            let activityTraders: Int = 0    // occurance rate of traders. 0 = no traders
//            let minTech: Int = 0            // minimum tech level needed
//            let maxTech: Int = 0            // maximum tech level where this is found
//            let bribeLevel: Int = 0         // indicates how easily police can be bribed. 0 = unbribable/high bribe costs
//            let drugsOk: Bool = false       // drugs can be traded (if not, people aren't interested or the governemnt is too strict)
//            let firearmsOk: Bool = false    // firearms can be traded (if not, people aren't interested or the governemnt is too strict)
//            let wanted: Bool = false        // Tradeitem requested in particular in this type of government
//        }
//        struct Model {
//            let name = "political system"
//            let index: Int = 0
//            let reactionIllegal: Int = 0
//            let activityPolice: Int = 0
//            let activityPirates: Int = 0
//            let activityTraders: Int = 0
//            let minTech: Int = 0
//            let maxTech: Int = 0
//            let bribeLevel: Int = 0
//            let drugsOk: Bool = false
//            let firearmsOk: Bool = false
//            let wanted: Bool = false
//        }
//    }
}

var test2 = StarSystem(techLevel: TechLevel3)