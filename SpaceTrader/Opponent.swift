//
//  Opponent.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/16/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class Opponent {
    let ship: SpaceShip
    let commander: Commander
    let type: OpponentType
    let tries: Int                      // WTF is this?
    let typeInt: Int
    
    
    
    init(type: OpponentType) {
        var d: Int = 0
        var i: Int = 0
        var j: Int = 0
        var k: Int = 0
        var sum: Int = 0
        let shipTypeForOccurance: [Int] = [2, 28, 20, 20, ]
        
        
        self.type = type
        
        if type == OpponentType.famousCaptain {
            // do famous captain things
        } else if type == OpponentType.mantis {
            // mantis things
        } else if type == OpponentType.dragonfly {
            // dragonfly
        } else if type == OpponentType.spaceMonster {
            // spaceMonster
        } else if type == OpponentType.scarab {
            // scarab
        } else if type == OpponentType.marieCeleste {
            // marie celeste
        } else if type == OpponentType.bottle {
            // bottle
        }
        
        if type == OpponentType.police {
            // The police will try to hunt you down with better ships if you are a villain, and they will try even harder when you are considered to be a psychopath (or are transporting Jonathan Wild)
            if (commander.policeRecord.rawValue <= 1) && !player.wildStatus {
                print("you are a villain, police will be trying hard")
                tries = 3
            } else if commander.policeRecord.rawValue == 0 || player.wildStatus {
                print("you are a psycho and or have Wild on board. Police will be trying REALLY hard")
                tries = 5
            }
            
            
        } else if type == OpponentType.pirate {
            // pirates get better as you get richer
            tries = 1 + (player.netWorth / 100000)
            tries = max(1, tries + (player.getDifficultyInt() - 2) )
            print("how good pirate will be based on wealth--tries: \(tries)")
            
        } else if type == OpponentType.trader {
            typeInt = 0
        }
        
        if type != OpponentType.trader {
            typeInt = 1
        }
        
        if player.getDifficultyInt() >= 2 {
            k = 1
        } else {
            k = 0
        }
        
        
        var redo = true
        while j < tries {
            redo = true
            while(redo) {
                d = Int(arc4random_uniform(100))
                i = 0
                sum = 2         // gnat occurance? Is this what we want?
                
            }
            
        }
}
