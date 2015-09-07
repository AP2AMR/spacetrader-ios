//
//  DataTypes.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/7/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class TechLevelType {
    
    var name: String
    var index: Int
    
    init(name: String, index: Int) {
        self.name = name
        self.index = index
    }
}

let TechLevel0 = TechLevelType(name: "Pre-agricultural", index: 0)
let TechLevel1 = TechLevelType(name: "Agricultural", index: 1)
let TechLevel2 = TechLevelType(name: "Medieval", index: 2)
let TechLevel3 = TechLevelType(name: "Renaissance", index: 3)
let TechLevel4 = TechLevelType(name: "Early Industrial", index: 4)
let TechLevel5 = TechLevelType(name: "Industrial", index: 5)
let TechLevel6 = TechLevelType(name: "Post-industrial", index: 6)
let TechLevel7 = TechLevelType(name: "Hi-tech", index: 7)

// DEMONSTRATION:
//class Poop {
//    var techLevel: TechLevelType
//    let name: String
//    
//    init(techLevel: TechLevelType, name: String) {
//        self.techLevel = techLevel
//        self.name = name
//    }
//}
//
//var poopy = Poop(techLevel: TechLevel1, name: "Poopy")
//let uhoh = poopy.techLevel
//var poopy2 = Poop(techLevel: TechLevel5, name: "Poopy2")

class PoliticsType {
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

let Anarchy = PoliticsType(name: "Anarchy", index: 0, reactionIllegal: 0, activityPolice: 0, activityPirates: 7, activityTraders: 1, minTech: 0, maxTech: 5, bribeLevel: 7, drugsOk: true, firearmsOk: true, wanted: "Food")
let CapitalistState = PoliticsType(name: "Capitalist State", index: 1, reactionIllegal: 2, activityPolice: 3, activityPirates: 2, activityTraders: 7, minTech: 4, maxTech: 7, bribeLevel: 1, drugsOk: true, firearmsOk: true, wanted: "Ore")
let CommunistState = PoliticsType(name: "Communist State", index: 2, reactionIllegal: 6, activityPolice: 6, activityPirates: 4, activityTraders: 4, minTech: 1, maxTech: 5, bribeLevel: 5, drugsOk: true, firearmsOk: true, wanted: "None")
let Confederacy = PoliticsType(name: "Confederacy", index: 3, reactionIllegal: 5, activityPolice: 4, activityPirates: 3, activityTraders: 5, minTech: 1, maxTech: 6, bribeLevel: 3, drugsOk: true, firearmsOk: true, wanted: "Games")
let CorporateState = PoliticsType(name: "Corporate State", index: 4, reactionIllegal: 2, activityPolice: 6, activityPirates: 2, activityTraders: 7, minTech: 4, maxTech: 7, bribeLevel: 2, drugsOk: true, firearmsOk: true, wanted: "Robots")
let CyberneticState = PoliticsType(name: "Cybernetic State", index: 5, reactionIllegal: 0, activityPolice: 7, activityPirates: 7, activityTraders: 5, minTech: 6, maxTech: 7, bribeLevel: 0, drugsOk: false, firearmsOk: false, wanted: "Ore")
let Democracy = PoliticsType(name: "Democracy", index: 6, reactionIllegal: 4, activityPolice: 3, activityPirates: 2, activityTraders: 5, minTech: 3, maxTech: 7, bribeLevel: 2, drugsOk: true, firearmsOk: true, wanted: "Games")
let Dictatorship = PoliticsType(name: "Dictatorship", index: 7, reactionIllegal: 3, activityPolice: 4, activityPirates: 5, activityTraders: 3, minTech: 0, maxTech: 7, bribeLevel: 2, drugsOk: true, firearmsOk: true, wanted: "None")
let FascistState = PoliticsType(name: "Fascist State", index: 8, reactionIllegal: 7, activityPolice: 7, activityPirates: 7, activityTraders: 1, minTech: 4, maxTech: 7, bribeLevel: 0, drugsOk: false, firearmsOk: true, wanted: "Machinery")
let FeudalState = PoliticsType(name: "Feudal State", index: 9, reactionIllegal: 1, activityPolice: 1, activityPirates: 6, activityTraders: 2, minTech: 0, maxTech: 3, bribeLevel: 6, drugsOk: true, firearmsOk: true, wanted: "Firearms")
let MilitaryState = PoliticsType(name: "Military State", index: 10, reactionIllegal: 7, activityPolice: 7, activityPirates: 0, activityTraders: 6, minTech: 2, maxTech: 7, bribeLevel: 0, drugsOk: false, firearmsOk: true, wanted: "Robots")
let Monarchy = PoliticsType(name: "Monarchy", index: 11, reactionIllegal: 3, activityPolice: 4, activityPirates: 3, activityTraders: 4, minTech: 0, maxTech: 5, bribeLevel: 4, drugsOk: true, firearmsOk: true, wanted: "Medicine")
let PacifistState = PoliticsType(name: "Pacifist State", index: 12, reactionIllegal: 7, activityPolice: 2, activityPirates: 1, activityTraders: 5, minTech: 0, maxTech: 3, bribeLevel: 1, drugsOk: true, firearmsOk: false, wanted: "None")
let SocialistState = PoliticsType(name: "Socialist State", index: 13, reactionIllegal: 4, activityPolice: 2, activityPirates: 5, activityTraders: 3, minTech: 0, maxTech: 5, bribeLevel: 6, drugsOk: true, firearmsOk: true, wanted: "None")
let StateOfSatori = PoliticsType(name: "State of Satori", index: 14, reactionIllegal: 0, activityPolice: 1, activityPirates: 1, activityTraders: 1, minTech: 0, maxTech: 1, bribeLevel: 0, drugsOk: false, firearmsOk: false, wanted: "None")
let Technocracy = PoliticsType(name: "Technocracy", index: 15, reactionIllegal: 1, activityPolice: 6, activityPirates: 3, activityTraders: 6, minTech: 4, maxTech: 7, bribeLevel: 2, drugsOk: true, firearmsOk: true, wanted: "Water")
let Theocracy = PoliticsType(name: "Theocracy", index: 16, reactionIllegal: 5, activityPolice: 6, activityPirates: 1, activityTraders: 4, minTech: 0, maxTech: 4, bribeLevel: 0, drugsOk: true, firearmsOk: true, wanted: "Narcotics")


class StatusType {
    let status: String
    // items in demand (array of ItemTypes?)
    
    init(status: String) {
        self.status = status
    }
}

let Status0 = StatusType(status: "under no particular pressure")
let Status1 = StatusType(status: "at war")
let Status2 = StatusType(status: "ravaged by a plague")
let Status3 = StatusType(status: "suffering from a drought")
let Status4 = StatusType(status: "suffering from extreme boredom")
let Status5 = StatusType(status: "suffering from a cold spell")
let Status6 = StatusType(status: "suffering from a crop failure")
let Status7 = StatusType(status: "lacking enough workers")

