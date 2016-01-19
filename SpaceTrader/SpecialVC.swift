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
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        if player.specialEvents.special {
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
        player.specialEvents.special = false
        galaxy.currentSystem!.specialEvent = nil
    }

    @IBAction func noButton(sender: AnyObject) {
        // for now, I'm going to assume that this will be unnecessary. Maybe I can change the text on it, but I think it will just dismiss the window without taking away the special?
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
