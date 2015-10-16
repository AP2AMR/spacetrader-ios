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
    
    init(type: OpponentType) {
        // figure out what information we actually need to instantiate an opponent, and generate the rest here
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
            
            
        } else if type == OpponentType.trader {
            
        }
}
