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

        encounterText1.text = galaxy.currentJourney!.currentEncounter!.encounterText1
        encounterText2.text = galaxy.currentJourney!.currentEncounter!.encounterText2
        encounterText3.text = galaxy.currentJourney!.currentEncounter!.encounterText3
        encounterText4.text = galaxy.currentJourney!.currentEncounter!.encounterText4
        
        let controlState = UIControlState()
        button1Text.setTitle("\(galaxy.currentJourney!.currentEncounter!.button1Text)", forState: controlState)
        button2Text.setTitle("\(galaxy.currentJourney!.currentEncounter!.button2Text)", forState: controlState)
        button3Text.setTitle("\(galaxy.currentJourney!.currentEncounter!.button3Text)", forState: controlState)
    }

    
    @IBOutlet weak var encounterText1: UILabel!
    @IBOutlet weak var encounterText2: UILabel!
    @IBOutlet weak var encounterText3: UILabel!
    @IBOutlet weak var encounterText4: UILabel!

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
