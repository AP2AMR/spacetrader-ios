//
//  NewGameVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/9/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class NewGameVC: UIViewController {
    
    var foundGame = false
    
    override func viewDidLoad() {
        if loadAutosavedGame() {
            foundGame = true
        } else {
            print("no autosaved game found.")
        }


    }
    
    override func viewDidAppear(animated: Bool) {
        if foundGame {
            performSegueWithIdentifier("restoreSegue", sender: nil)
        }
    }
    
    @IBAction func newGamePressed(sender: AnyObject) {
        let vc : UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("newCommander")
        self.presentViewController(vc, animated: true, completion: nil)
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
            savedGames = autosaveGame.savedGames
            
            return true
        } else {
            return false
        }
    }
}
