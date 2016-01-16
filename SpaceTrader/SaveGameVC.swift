//
//  SaveGameVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 1/15/16.
//  Copyright © 2016 Marc Auger. All rights reserved.
//

import UIKit

class SaveGameVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        // create NamedSavedGame
        // append namedSavedGame to savedGames
        // app delegate method will add that to the bundle that gets saved when app resigns active
        
        let title = "Game Saved"
        let message = "Your game has been saved."
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default ,handler: {
            (alert: UIAlertAction!) -> Void in
            // go back to menu
            self.navigationController?.popToRootViewControllerAnimated(true)
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
    
    func saveState() {
        
        
        let path = fileInDocumentsDirectory("autosave.plist")
        let autosaveGame = SavedGame(name: "Autosave", cdr: player, gxy: galaxy, gameInProgress: gameInProgress)
        
        NSKeyedArchiver.archiveRootObject(autosaveGame, toFile: path)
    }

}
