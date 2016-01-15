//
//  NewGameVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/9/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class NewGameVC: UIViewController {
    
    override func viewDidAppear(animated: Bool) {
        //triggerSegue()
        
        if loadAutosavedGame() {
            print("autosaved game found")
            // MAYBE TRIGGER MODAL HERE TO ASK IF USER WANTS TO RESUME GAME?
            performSegueWithIdentifier("restoredGameSegue", sender: nil)
        } else {
            print("no autosaved game found.")
        }
    }
    

    
    // PERSISTANCE METHODS
    func documentsDirectory() -> String {
        let documentsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        return documentsFolderPath
    }
    
    func fileInDocumentsDirectory(filename: String) -> String {
        return documentsDirectory().stringByAppendingPathComponent(filename)
    }
    
    func loadAutosavedGame() -> Bool {
        let path = fileInDocumentsDirectory("autosave.plist")
        print("path: \(path)")
        if let autosaveGame = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? SavedGame {
            player = autosaveGame.savedCommander
            galaxy = autosaveGame.savedGalaxy
            return true
        } else {
            return false
        }
    }
}
