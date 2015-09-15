//
//  NewCommanderVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/11/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import UIKit

class NewCommanderVC: UIViewController {

    @IBOutlet weak var NameField: UITextField!
    
    @IBOutlet weak var DifficultyLevel: UILabel!
    @IBOutlet weak var OKButton: UIButton!
    @IBOutlet weak var skillPoints: UILabel!
    @IBOutlet weak var pilotPoints: UILabel!
    @IBOutlet weak var fighterPoints: UILabel!
    @IBOutlet weak var traderPoints: UILabel!
    @IBOutlet weak var engineerPoints: UILabel!
    
    var availableSkill: Int {
        get {
            return NSNumberFormatter().numberFromString(skillPoints.text!)!.integerValue
        }
        set {
            skillPoints.text = "\(newValue)"
        }
    }
    var name = String()
    
    var difficulty: DifficultyType {
        get {
            
        }
        set {
            
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OkButton() {
    }

    @IBAction func DifficultyPlusButton() {
    }

    @IBAction func DifficultyMinusButton() {
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

    
}
