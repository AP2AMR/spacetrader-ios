//
//  Galaxy.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/6/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class SolarSystem {
    var name: String?
    var techLevel: TechLevelStruct?          // = TechLevelStruct.Agricultural()
    var politics: PoliticsStruct?            // struct
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
    struct TechLevelStruct {
        struct PreAg {
            let name = "Pre-agricultural"
        }
        
        struct Agricultural {
            let name = "Agricultural"
        }
        struct Medieval {
            let name = "Medieval"
        }
        struct Renaissance {
            let name = "Renaissance"
        }
        struct EarlyInd {
            let name = "Early Industrial"
        }
        struct Industrial {
            let name = "Industrial"
        }
        struct PostInd {
            let name = "Post-industrial"
        }
        struct HiTech {
            let name = "Hi-tech"
        }
    }
    
    struct PoliticsStruct {
        
    }
 
}