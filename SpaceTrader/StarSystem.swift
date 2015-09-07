//
//  StarSystem.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/6/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class StarSystem {
    var name: String?
    var techLevel: TechLevelType?          // = TechLevelStruct.Agricultural()
    var politics: PoliticsType?            // struct
    var status              // struct
    var xCoord: Int?        // requires init
    var yCoord: Int?        // requires init
    var specialResources    // struct
    var size                // struct
    // trade items?
    var countdown: Int = 1  // init?
    var visited: Bool = false
    var special             // struct
    
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
    
    init() {
        
    }
    
    // DATA STORAGE
    
    // encapsulating things in a class doesn't really solve the problem
    class TechLevelType {
        class TechLevelClass {
            
            var name: String
            var index: Int
            
            init(name: String, index: Int) {
                self.name = name
                self.index = index
            }
        }
        
        let TechLevel0 = TechLevelClass(name: "Pre-agricultural", index: 0)
        let TechLevel1 = TechLevelClass(name: "Agricultural", index: 1)
        let TechLevel2 = TechLevelClass(name: "Medieval", index: 2)
        let TechLevel3 = TechLevelClass(name: "Renaissance", index: 3)
        let TechLevel4 = TechLevelClass(name: "Early Industrial", index: 4)
        let TechLevel5 = TechLevelClass(name: "Industrial", index: 5)
        let TechLevel6 = TechLevelClass(name: "Post-industrial", index: 6)
        let TechLevel7 = TechLevelClass(name: "Hi-tech", index: 7)
    }
    
    
    
    
    
    
//    struct TechLevelType {
//        // index isn't ideal. Maybe this should be an enum, with a return method?
//        struct PreAg {
//            let name = "Pre-agricultural"
//            let index = 0
//        }
//        
//        struct Agricultural {
//            let name = "Agricultural"
//            let index = 1
//        }
//        struct Medieval {
//            let name = "Medieval"
//            let index = 2
//        }
//        struct Renaissance {
//            let name = "Renaissance"
//            let index = 3
//        }
//        struct EarlyInd {
//            let name = "Early Industrial"
//            let index = 4
//        }
//        struct Industrial {
//            let name = "Industrial"
//            let index = 5
//        }
//        struct PostInd {
//            let name = "Post-industrial"
//            let index = 6
//        }
//        struct HiTech {
//            let name = "Hi-tech"
//            let index = 7
//        }
//    }
    
    struct PoliticsType {
        // note: this system does use enums for tech levels, trade items.
        // note: scales presumably go to ten(?)
        struct Demo {
            let name = "political system"
            let index: Int = 0
            let reactionIllegal: Int = 0    // reaction level to illegal goods. 0 = total acceptance
            let activityPolice: Int = 0     // occurance rate of police. 0 = no police
            let activityPirates: Int = 0    // occurance rate of pirates. 0 = no pirates
            let activityTraders: Int = 0    // occurance rate of traders. 0 = no traders
            let minTech: Int = 0            // minimum tech level needed
            let maxTech: Int = 0            // maximum tech level where this is found
            let bribeLevel: Int = 0         // indicates how easily police can be bribed. 0 = unbribable/high bribe costs
            let drugsOk: Bool = false       // drugs can be traded (if not, people aren't interested or the governemnt is too strict)
            let firearmsOk: Bool = false    // firearms can be traded (if not, people aren't interested or the governemnt is too strict)
            let wanted: Bool = false        // Tradeitem requested in particular in this type of government
        }
        struct Model {
            let name = "political system"
            let index: Int = 0
            let reactionIllegal: Int = 0
            let activityPolice: Int = 0
            let activityPirates: Int = 0
            let activityTraders: Int = 0
            let minTech: Int = 0
            let maxTech: Int = 0
            let bribeLevel: Int = 0
            let drugsOk: Bool = false
            let firearmsOk: Bool = false
            let wanted: Bool = false
        }
    }
    
    class PoliticsClass {
        let name: String
        let index: Int
        let reactionIllegal: Int    // reaction level to illegal goods. 0 = total acceptance
        let activityPolice: Int     // occurance rate of police. 0 = no police
        let activityPirates: Int    // occurance rate of pirates. 0 = no pirates
        let activityTraders: Int    // occurance rate of traders. 0 = no traders
        let minTech: Int            // minimum tech level needed
        let maxTech: Int            // maximum tech level where this is found
        let bribeLevel: Int         // indicates how easily police can be bribed. 0 = unbribable/high bribe costs
        let drugsOk: Bool           // drugs can be traded (if not, people aren't interested or the governemnt is too strict)
        let firearmsOk: Bool        // firearms can be traded (if not, people aren't interested or the governemnt is too strict)
        let wanted: String            // Tradeitem requested in particular in this type of government
        
        init(name: String, index: Int, reactionIllegal: Int, activityPolice: Int, activityPirates: Int, activityTraders: Int, minTech: Int, maxTech: Int, bribeLevel: Int, drugsOk: Bool, firearmsOk: Bool, wanted: String) {   // NOTE: CHANGE "STRING" TO APPROPRIATE CLASS
            
            self.name = name
            self.index = index
            self.reactionIllegal = reactionIllegal
            self.activityPolice = activityPolice
            self.activityPirates = activityPirates
            self.activityTraders = activityTraders
            self.minTech = minTech
            self.maxTech = maxTech
            self.bribeLevel = bribeLevel
            self.drugsOk = drugsOk
            self.firearmsOk = firearmsOk
            self.wanted = wanted
        }
    }
    
    let Anarchy = PoliticsClass(name: "Anarchy", index: 0, reactionIllegal: 0, activityPolice: 0, activityPirates: 7, activityTraders: 1, minTech: 0, maxTech: 5, bribeLevel: 7, drugsOk: true, firearmsOk: true, wanted: "Food")
    let CapState = PoliticsClass(name: "Capitalist State", index: 1, reactionIllegal: 2, activityPolice: 3, activityPirates: 2, activityTraders: 7, minTech: 4, maxTech: 7, bribeLevel: 1, drugsOk: true, firearmsOk: true, wanted: "Ore")
    
    
    class Poop {
        var techLevel: TechLevelType
        
        init(techLevel: TechLevelType) {
            self.techLevel = techLevel
        }
    }
    
    var poopy = Poop(techLevel: TechLevelType.TechLevel0)
    
    
 
}