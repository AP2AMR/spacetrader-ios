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
    
    var savedCommander: Commander?
    var savedGalaxy: Galaxy?
    
    override init() {
        name = "not initialized"
        savedCommander = nil
        savedGalaxy = nil
    }
    
    // NSCODING METHODS
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObjectForKey("name") as! String
        self.savedCommander = decoder.decodeObjectForKey("savedCommander") as! Commander?
        self.savedGalaxy = decoder.decodeObjectForKey("savedGalaxy") as! Galaxy?

        super.init()
    }

    func encodeWithCoder(encoder: NSCoder) {
        encoder.encodeObject(name, forKey: "name")
        encoder.encodeObject(savedCommander, forKey: "savedCommander")
        encoder.encodeObject(savedGalaxy, forKey: "savedGalaxy")
    }
}