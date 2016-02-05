//
//  SpecialVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 12/3/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class SpecialVC: UIViewController {

    @IBOutlet weak var specialEventTitle: UILabel!
    @IBOutlet weak var specialEventText: UITextView!
    @IBOutlet weak var dismissButtonOutlet: CustomButton!
    @IBOutlet weak var noButtonOutlet: CustomButton!
    
    override func viewDidLoad() {
        // DEBUG
        print("special screen invoked. Special event to load: \(galaxy.currentSystem!.specialEvent)")
        print("title: \(player.specialEvents.specialEventTitle)")
        
        super.viewDidLoad()
        loadData()
        
        let gameOverNotification = NSNotificationCenter.defaultCenter().addObserver(self, selector: "messageHandler:", name: "gameOverFromSpecialVC", object: nil)
        
        let _ = NSNotificationCenter.defaultCenter().addObserver(self, selector: "alertHandler:", name: "generateSpecialAlert", object: nil)
    }
    
    func messageHandler(notification: NSNotification) {
        gameOver()
    }
    
    func alertHandler(notification: NSNotification) {
        print("SpecialVC: alertHandler firing")
        let newAlert = specialVCAlert!
        specialVCAlert = nil
    }
    
    func loadData() {
        if player.specialEvents.special {
            // DEBUG
            print("SpecialVC reporting in. specialEventID: \(galaxy.currentSystem!.specialEvent)")
            print("title, from player.specialEvents: \(player.specialEvents.specialEventTitle)")
            
            specialEventTitle.text = player.specialEvents.specialEventTitle
            specialEventText.text = player.specialEvents.specialEventText
            
            // set button texts
            let controlState = UIControlState()
            dismissButtonOutlet.setTitle(player.specialEvents.yesDismissButtonText, forState: controlState)
            noButtonOutlet.setTitle(player.specialEvents.noButtonText, forState: controlState)
            
            dismissButtonOutlet.enabled = player.specialEvents.yesDismissButtonEnabled
            noButtonOutlet.enabled = player.specialEvents.noButtonEnabled
        }
    }

    @IBAction func dismissButton(sender: AnyObject) {
        // NEW WAY--entire functionality goes here, no further callback to SpecialEvent
        // TODO
        
        // END yesDismiss FUNCTIONALITY*************************************************************
        // OLD WAY--call relevant function in SpecialEvent
        player.specialEvents.yesDismissButton()
        
        // dismiss and remove special. No button will not remove special, that can be done manually in SpecialEvent
        
        if player.endGameType == EndGameStatus.GameNotOver {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        // spare special event if dontDeleteLocalSpecialEvent flag is true
        if !dontDeleteLocalSpecialEvent {
            print("flag not set, deleting special event")
            galaxy.currentSystem!.specialEvent = nil
            player.specialEvents.special = false
        } else {
            print("not deleting special event, as per flag")
            // spare special event. It has been reset to something else, like claim item

            // make sure button points to correct special
        }
        dontDeleteLocalSpecialEvent = false
        
    }

    @IBAction func noButton(sender: AnyObject) {
        // for now, I'm going to assume that this will be unnecessary. Maybe I can change the text on it, but I think it will just dismiss the window without taking away the special?
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func gameOver() {
        print("this is the gameOver method in special")
        //performSegueWithIdentifier("gameOverFromSpecial", sender: nil)
        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("gameOverVC")
        self.presentViewController(vc, animated: false, completion: nil)
        
        // this goes to a blank, test VC
//        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("testGameOver")
//        self.presentViewController(vc, animated: false, completion: nil)
    }
    
    func generateAlert(alert: Alert) -> Bool {
        var outcome = false
        
        // create actual alert
        
        let alertController = UIAlertController(title: alert.header, message: alert.text, preferredStyle: UIAlertControllerStyle.Alert)
        
        if alert.yesIsDestructive {
            // destructive yes version
            alertController.addAction(UIAlertAction(title: alert.yesButton, style: UIAlertActionStyle.Destructive ,handler: {
                (alert: UIAlertAction!) -> Void in
                // if yes pressed, return true
                outcome = true
            }))
        } else {
            // non-destructive yes version
            alertController.addAction(UIAlertAction(title: alert.yesButton, style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // if yes pressed, return true
                outcome = true
            }))
        }
        // add "no" button only if called for
        if alert.noButton != nil {
            alertController.addAction(UIAlertAction(title: alert.noButton!, style: UIAlertActionStyle.Default ,handler: {
                (alert: UIAlertAction!) -> Void in
                // if no pressed, return false
                outcome = false
            }))
        }
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        print("generateAlert returning \(outcome)")
        return outcome
    }

}
