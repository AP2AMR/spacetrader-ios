//
//  Opponent.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/16/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class Opponent {
    var ship: SpaceShip
    var commander: Commander
    var type: IFFStatusType
    
    init(type: IFFStatusType) {

        self.type = type
        
        // these are placeholders only, because I want to be able to do the instantiating function in multiple pieces
        self.commander = Commander(commanderName: "Opponent", difficulty: DifficultyType.easy, pilotSkill: 1, fighterSkill: 1, traderSkill: 1, engineerSkill: 1)
        self.ship = SpaceShip(type: ShipType.Gnat, IFFStatus: type)
    }
    
    func generateOpponent() {
        var tries = 1
        let name = "NAME"                           // not sure whether he properly needs a name...
        
        if type == IFFStatusType.FamousCaptain {
            ship = SpaceShip(type: ShipType.Wasp, IFFStatus: IFFStatusType.FamousCaptain)
            commander = Commander(commanderName: name, difficulty: DifficultyType.easy, pilotSkill: 9, fighterSkill: 9, traderSkill: 9, engineerSkill: 9)
            
            // max crew
            
            // max shields
            
            // max weapons
            
            // return
        }
        
        if type == .Mantis {
            tries = 1 + player.getDifficultyInt()
        }
        
        if type == IFFStatusType.Police {
            if player.policeRecordInt <= 1 && player.wildStatus {
                tries = 3
            } else if player.policeRecordInt == 0 || player.wildStatus {
                tries = 5
            }
        }
        
        // pirates get better as you get richer
        if type ==  .Pirate {
            tries = 1 + (player.netWorth / 100000)
        }
        
        // determine gadgets
        
        // fill cargo bays
        
        // fill tanks, set no tribbles
        
        // fill weapon slots
        
        // fill shield slots
        
        // set shield & hull strength
        
        // set crew
        
        
    }
    
    func displayResults() {
        
    }
}
