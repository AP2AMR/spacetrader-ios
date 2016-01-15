//
//  NewGameVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/9/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class NewGameVC: UIViewController {
    
    override func viewDidLoad() {
        if loadAutosavedGame() {
            print("autosaved game found")
            // MAYBE TRIGGER MODAL HERE TO ASK IF USER WANTS TO RESUME GAME?
            performSegueWithIdentifier("restoredGameSegue", sender: nil)    // not firing for some reason
            print("supposedly just performed restoredGameSegue")
        } else {
            print("no autosaved game found.")
        }

    }
    
    @IBAction func newGamePressed(sender: AnyObject) {
        performSegueWithIdentifier("newCommanderSegue", sender: nil)
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
//            if !autosaveGame.gameInProgress {
//                print("game was over. loadAutosavedGame is returning false to start a new game.")
//                return false
//            }
            player = autosaveGame.savedCommander
            galaxy = autosaveGame.savedGalaxy
            
            return true
        } else {
            return false
        }
    }
}
