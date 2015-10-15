//
//  EncounterVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/10/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class EncounterVC: UIViewController {

    
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        super.viewDidLoad()

        encounterText.text = galaxy.currentJourney!.currentEncounter!.encounterText1
    }

    @IBOutlet weak var encounterText: UITextView!
    @IBOutlet weak var button1Text: UIButton!
    @IBOutlet weak var button2Text: UIButton!
    @IBOutlet weak var button3Text: UIButton!
    
    @IBAction func button1(sender: AnyObject) {
        galaxy.currentJourney!.currentEncounter!.resumeEncounter(1)
    }

    @IBAction func button2(sender: AnyObject) {
        galaxy.currentJourney!.currentEncounter!.resumeEncounter(2)
    }

    @IBAction func button3(sender: AnyObject) {
        galaxy.currentJourney!.currentEncounter!.resumeEncounter(3)
    }
}
