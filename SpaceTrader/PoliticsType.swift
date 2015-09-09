//
//  PoliticsType.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class Politics {
    let type: PoliticsType
    let name: String
    let reactionIllegal: Int    // reaction level to illegal goods. 0 = total acceptance
    let activityPolice: Int     // occurance rate of police. 0 = no police
    let activityPirates: Int    // occurance rate of pirates. 0 = no pirates
    let activityTraders: Int    // occurance rate of traders. 0 = no traders
    let minTech: TechLevelType  // minimum tech level needed
    let maxTech: TechLevelType  // maximum tech level where this is found
    let bribeLevel: Int         // indicates how easily police can be bribed. 0 = unbribable/high bribe costs
    let drugsOk: Bool           // drugs can be traded (if not, people aren't interested or the governemnt is too strict)
    let firearmsOk: Bool        // firearms can be traded (if not, people aren't interested or the governemnt is too strict)
    let wanted: TradeItemType            // Tradeitem requested in particular in this type of government
    
    init(type: PoliticsType){
        self.type = type
        
        switch type {
        case PoliticsType.anarchy:
            self.name = "Anarchy"
            self.reactionIllegal = 0
            self.activityPolice = 0
            self.activityPirates = 7
            self.activityTraders = 1
            self.minTech = TechLevelType.techLevel0
            self.maxTech = TechLevelType.techLevel5
            self.bribeLevel = 7
            self.drugsOk = true
            self.firearmsOk = true
            self.wanted = TradeItemType.Food
        case PoliticsType.capitalist:
            
            
//            { "Anarchy",          0, 0, 7, 1, 0, 5, 7, true,  true,  FOOD },
//            { "Capitalist State", 2, 3, 2, 7, 4, 7, 1, true,  true,  ORE },
//            { "Communist State",  6, 6, 4, 4, 1, 5, 5, true,  true,  -1 },
//            { "Confederacy",      5, 4, 3, 5, 1, 6, 3, true,  true,  GAMES },
//            { "Corporate State",  2, 6, 2, 7, 4, 7, 2, true,  true,  ROBOTS },
//            { "Cybernetic State", 0, 7, 7, 5, 6, 7, 0, false, false, ORE },
//            { "Democracy",        4, 3, 2, 5, 3, 7, 2, true,  true,  GAMES },
//            { "Dictatorship",     3, 4, 5, 3, 0, 7, 2, true,  true,  -1 },
//            { "Fascist State",    7, 7, 7, 1, 4, 7, 0, false, true,  MACHINERY },
//            { "Feudal State",     1, 1, 6, 2, 0, 3, 6, true,  true,  FIREARMS },
//            { "Military State",   7, 7, 0, 6, 2, 7, 0, false, true,  ROBOTS },
//            { "Monarchy",         3, 4, 3, 4, 0, 5, 4, true,  true,  MEDICINE },
//            { "Pacifist State",   7, 2, 1, 5, 0, 3, 1, true,  false, -1 },
//            { "Socialist State",  4, 2, 5, 3, 0, 5, 6, true,  true,  -1 },
//            { "State of Satori",  0, 1, 1, 1, 0, 1, 0, false, false, -1 },
//            { "Technocracy",      1, 6, 3, 6, 4, 7, 2, true,  true,  WATER },
//            { "Theocracy",        5, 6, 1, 4, 0, 4, 0, true,  true,  NARCOTICS }
        }
        
        
    }
}