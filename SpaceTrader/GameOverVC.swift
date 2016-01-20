//
//  GameOverVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 1/20/16.
//  Copyright © 2016 Marc Auger. All rights reserved.
//

import UIKit

class GameOverVC: UIViewController {
    
    var madeHighScores = false

    override func viewDidLoad() {
        // set background image based on game over type
        // this can be found at player.endGameType
        
        // create HighScore object
        let newHighScore = HighScore(name: player.commanderName, status: player.endGameType, days: player.days, worth: player.netWorth, difficulty: player.difficulty)
        madeHighScores = highScoreArchive.addScore(newHighScore)
        
        // DEBUG
        print("high score created. madeHighScores? \(madeHighScores)")
        print("current high scores list:")
        for score in highScoreArchive.highScores {
            print("name: \(score.name), score: \(score.score)")
        }
        
        // save high scores archive to file
        saveHighScoresArchive()
    }
    
    override func viewDidAppear(animated: Bool) {
        // wait, display alert
        sleep(1)
        
        var title = ""
        var message = ""
        
        // number formatter business
        
        if madeHighScores {
            
            title = "High Score!"
            message = "You scored \() and made the high score list."
        } else {
            title = "High Score"
            message = "This will tell you whether you made the high score list."
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            // do nothing
            
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    // PERSISTANCE METHODS
    func documentsDirectory() -> String {
        let documentsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        return documentsFolderPath
    }
    
    func fileInDocumentsDirectory(filename: String) -> String {
        return documentsDirectory().stringByAppendingPathComponent(filename)
    }
    
    func saveHighScoresArchive() {
        let path = fileInDocumentsDirectory("highScores.plist")
        NSKeyedArchiver.archiveRootObject(highScoreArchive, toFile: path)
    }
}
