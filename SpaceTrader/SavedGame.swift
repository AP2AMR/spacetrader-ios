//
//  SavedGame.swift
//  SpaceTrader
//
//  Created by Marc Auger on 1/15/16.
//  Copyright © 2016 Marc Auger. All rights reserved.
//

import Foundation

class SavedGame: NSObject, NSCoding {
    var name: String = ""
    //let timestamp:
    
    var savedCommander: Commander
    var savedGalaxy: Galaxy
    var gameInProgress: Bool
    
    init(name: String, cdr: Commander, gxy: Galaxy, gameInProgress: Bool) {
        self.name = name
        self.savedCommander = cdr
        self.savedGalaxy = gxy
        self.gameInProgress = gameInProgress
        
    }
    
    // NSCODING METHODS
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObjectForKey("name") as! String
        self.savedCommander = decoder.decodeObjectForKey("savedCommander") as! Commander
        self.savedGalaxy = decoder.decodeObjectForKey("savedGalaxy") as! Galaxy
        self.gameInProgress = decoder.decodeObjectForKey("gameInProgress") as! Bool

        super.init()
    }

    func encodeWithCoder(encoder: NSCoder) {
        encoder.encodeObject(name, forKey: "name")
        encoder.encodeObject(savedCommander, forKey: "savedCommander")
        encoder.encodeObject(savedGalaxy, forKey: "savedGalaxy")
        encoder.encodeObject(gameInProgress, forKey: "gameInProgress")
    }
}