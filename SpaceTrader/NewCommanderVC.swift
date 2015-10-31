//
//  NewCommanderVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/11/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import UIKit

class NewCommanderVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var difficultyLevel: UILabel!
    @IBOutlet weak var OKButton: UIButton!
    @IBOutlet weak var skillPoints: UILabel!
    @IBOutlet weak var pilotPoints: UILabel!
    @IBOutlet weak var fighterPoints: UILabel!
    @IBOutlet weak var traderPoints: UILabel!
    @IBOutlet weak var engineerPoints: UILabel!
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    
    var availableSkill: Int {
        get {
            return NSNumberFormatter().numberFromString(skillPoints.text!)!.integerValue
        }
        set {
            skillPoints.text = "\(newValue)"
        }
    }
    var name = String()
    
    var difficulty: Int = 2 {
        didSet {
            // crappy kludge
            switch difficulty {
            case 0:
                difficultyLevel.text = "Beginner"
            case 1:
                difficultyLevel.text = "Easy"
            case 2:
                difficultyLevel.text = "Normal"
            case 3:
                difficultyLevel.text = "Hard"
            case 4:
                difficultyLevel.text = "Impossible"
            default:
                difficultyLevel.text = "UH OH"
            }
        }
    }
    var pilot: Int {
        get {
            return NSNumberFormatter().numberFromString(pilotPoints.text!)!.integerValue
        }
        set {
            pilotPoints.text = "\(newValue)"
        }
    }
    var fighter: Int {
        get {
            return NSNumberFormatter().numberFromString(fighterPoints.text!)!.integerValue
        }
        set {
            fighterPoints.text = "\(newValue)"
        }
}
    var trader: Int {
        get {
            return NSNumberFormatter().numberFromString(traderPoints.text!)!.integerValue
        }
        set {
            traderPoints.text = "\(newValue)"
        }
    }
    var engineer: Int {
        get {
            return NSNumberFormatter().numberFromString(engineerPoints.text!)!.integerValue
        }
        set {
            engineerPoints.text = "\(newValue)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        
        nameField.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OkButton() {
        var kludgeDifficulty = DifficultyType.normal
        switch difficulty {
        case 0:
            kludgeDifficulty = DifficultyType.beginner
        case 1:
            kludgeDifficulty = DifficultyType.easy
        case 2:
            kludgeDifficulty = DifficultyType.normal
        case 3:
            kludgeDifficulty = DifficultyType.hard
        case 4:
            kludgeDifficulty = DifficultyType.impossible
        default:
            print("fix difficulty switch")
            
        }
        
        // must check that information is complete--name must be present and valid.
        
        if nameField.text == nil {
            name = "Sampson"
        } else {
            name = nameField.text!
        }

        player = Commander(commanderName: "name", difficulty: kludgeDifficulty, pilotSkill: pilot, fighterSkill: fighter, traderSkill: trader, engineerSkill: engineer)
        galaxy.createGalaxy()
        
        // give player a pulse laser
        let pulseLaser = Weapon(type: WeaponType.pulseLaser)
        player.commanderShip.weapon.append(pulseLaser)
        
        // THIS IS THE PLACE TO SET THINGS DIFFERENTLY FOR TESTING*******************************
        
        let firearms = TradeItem(item: TradeItemType.Firearms, quantity: 5, pricePaid: 0)
        player.commanderShip.cargo.append(firearms)
        
        let games = TradeItem(item: TradeItemType.Games, quantity: 5, pricePaid: 0)
        player.commanderShip.cargo.append(games)
        
        let robots = TradeItem(item: TradeItemType.Robots, quantity: 5, pricePaid: 0)
        player.commanderShip.cargo.append(robots)
        
        //player.policeRecord = PoliceRecordType.dubiousScore
        
        player.escapePod = true
        
        let photonDisruptor = Weapon(type: WeaponType.photonDisruptor)
        player.commanderShip.weapon.append(photonDisruptor)
        
        
        // END TESTING STUFF ********************************************************************
        
        
        
        // segue should probably not be "show". Talk to steph about this.
        self.performSegueWithIdentifier("newCommanderToMain", sender: nil)
    }

    @IBAction func DifficultyPlusButton() {
        if difficulty < 4 {
            difficulty += 1
        }
    }

    @IBAction func DifficultyMinusButton() {
        if difficulty > 0 {
            difficulty -= 1
        }
    }
    
    @IBAction func PilotMinusButton() {
        if pilot > 1 {
            pilot -= 1
            availableSkill += 1
        }
    }

    @IBAction func PilotPlusButton() {
        if pilot < 9 && availableSkill > 0 {
            pilot += 1
            availableSkill -= 1
        }
    }


    @IBAction func FighterPlusButton() {
        if fighter < 9 && availableSkill > 0 {
            fighter += 1
            availableSkill -= 1
        }
    }

    @IBAction func FighterMinusButton() {
        if fighter > 1 {
            fighter -= 1
            availableSkill += 1
        }
    }
    
    @IBAction func TraderPlusButton() {
        if trader < 9 && availableSkill > 0 {
            trader += 1
            availableSkill -= 1
        }
    }
    
    @IBAction func TraderMinusButton() {
        if trader > 1 {
            trader -= 1
            availableSkill += 1
        }
    }
    
    @IBAction func EngineerPlusButton() {
        if engineer < 9 && availableSkill > 0 {
            engineer += 1
            availableSkill -= 1
        }
    }

    @IBAction func EngineerMinusButton() {
        if engineer > 1 {
            engineer -= 1
            availableSkill += 1
        }
    }
    
    // REMAINING ISSUES:
    // - done button on keyboard must make keyboard go away
    // (- very crappy implementation of difficulty label)
    // (- everything about the view)
    // - ok button

    
}
