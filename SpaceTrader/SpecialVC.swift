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
    }
    
    func messageHandler(notification: NSNotification) {
        gameOver()
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
        player.specialEvents.yesDismissButton()
        
        // dismiss and remove special. No button will not remove special, that can be done manually in SpecialEvent
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
        print("yes/dismiss pushed. dontDeleteLocalSpecialEventFlag: \(dontDeleteLocalSpecialEvent)")
        print("special event currently set: \(galaxy.currentSystem!.specialEvent)")
        
        // spare special event if dontDeleteLocalSpecialEvent flag is true
        if !dontDeleteLocalSpecialEvent {
            galaxy.currentSystem!.specialEvent = nil
            player.specialEvents.special = false
        } else {
            // spare special event. It has been reset to something else, like claim item

            // make sure button points to correct special
        }
        dontDeleteLocalSpecialEvent = false
        
        print("code run. Special is now \(galaxy.currentSystem!.specialEvent)")
        
    }

    @IBAction func noButton(sender: AnyObject) {
        // for now, I'm going to assume that this will be unnecessary. Maybe I can change the text on it, but I think it will just dismiss the window without taking away the special?
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func gameOver() {
        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("gameOverVC")
        self.presentViewController(vc, animated: false, completion: nil)
    }

}
