//
//  Galaxy.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/8/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

class Galaxy {
    var planets: [StarSystem] = []
    
    func createGalaxy() {
        print("Initializing galaxy...")
        
        var i: Int = 0
        while i < MAXSOLARSYSTEM {
            var newStarSystem = StarSystem(name: "NOT SET YET", techLevel: TechLevelType.techLevel0, politics: PoliticsType.anarchy, status: StatusType.none, xCoord: 0, yCoord: 0, specialResources: SpecialResourcesType.none, size: SizeType.Tiny)
            

            if i < MAXWORMHOLE {
                // place each of the six with a wormhole within a square, defined as the middle of each square of the galaxy broken into a 3x2 grid
                switch i {
                case 0:
                    newStarSystem.xCoord = 1
                    newStarSystem.yCoord = 1
                case 1:
                    newStarSystem.xCoord = 1
                    newStarSystem.yCoord = 1
                case 2:
                    newStarSystem.xCoord = 1
                    newStarSystem.yCoord = 1
                case 3:
                    newStarSystem.xCoord = 1
                    newStarSystem.yCoord = 1
                case 4:
                    newStarSystem.xCoord = 1
                    newStarSystem.yCoord = 1
                case 5:
                    newStarSystem.xCoord = 1
                    newStarSystem.yCoord = 1
                default:
                    newStarSystem.xCoord = 100
                    newStarSystem.yCoord = 100
                }
                // set wormhole to true
                newStarSystem.wormhole = true
                
            } else {
                // place others randomly, not closer than 2 from the edge
                
                // make sure each one is no closer than MINDISTANCE to another planet
                
                // (later we will verify that all planets are within CLOSEDISTANCE of each other. If they aren't, we'll regenerate their coords until they satisfy this condition)
            }
            
            // set name
            var nameString = "system\(i)"
            newStarSystem.name = nameString
            
            // DEBUGGING:
            print("name: \(newStarSystem.name)")
            print("x coord: \(newStarSystem.xCoord)")
            print("y coord: \(newStarSystem.yCoord)")
            
            // end of loop
            planets.append(newStarSystem)
            i += 1
        }
        
        
    }
    
    func initializeTradeItems() {
    }
    
    // figure out how display is done
}