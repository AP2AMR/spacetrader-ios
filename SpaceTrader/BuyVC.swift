//
//  BuyVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/17/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import UIKit

class BuyVC: UIViewController {

    @IBOutlet weak var waterQty: UIButton!
    @IBOutlet weak var fursQty: UIButton!
    @IBOutlet weak var foodQty: UIButton!
    @IBOutlet weak var oreQty: UIButton!
    @IBOutlet weak var gamesQty: UIButton!
    @IBOutlet weak var firearmsQty: UIButton!
    @IBOutlet weak var medicineQty: UIButton!
    @IBOutlet weak var machinesQty: UIButton!
    @IBOutlet weak var narcoticsQty: UIButton!
    @IBOutlet weak var robotsQty: UIButton!

    @IBOutlet weak var waterPrice: UILabel!
    @IBOutlet weak var fursPrice: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var orePrice: UILabel!
    @IBOutlet weak var gamesPrice: UILabel!
    @IBOutlet weak var firearmsPrice: UILabel!
    @IBOutlet weak var medicinePrice: UILabel!
    @IBOutlet weak var machinesPrice: UILabel!
    @IBOutlet weak var narcoticsPrice: UILabel!
    @IBOutlet weak var robotsPrice: UILabel!

    @IBOutlet weak var waterProjectedPL: UILabel!
    @IBOutlet weak var fursProjectedPL: UILabel!
    @IBOutlet weak var foodProjectedPL: UILabel!
    @IBOutlet weak var oreProjectedPL: UILabel!
    @IBOutlet weak var gamesProjectedPL: UILabel!
    @IBOutlet weak var firearmsProjectedPL: UILabel!
    @IBOutlet weak var medicineProjectedPL: UILabel!
    @IBOutlet weak var machinesProjectedPL: UILabel!
    @IBOutlet weak var narcoticsProjectedPL: UILabel!
    @IBOutlet weak var robotsProjectedPL: UILabel!
    
    
    @IBOutlet weak var targetSystemLabel: UILabel!
    @IBOutlet weak var baysLabel: UILabel!
    @IBOutlet weak var cashLabel: UILabel!



    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controlState = UIControlState()
        buyAsOpposedToSell = true

        // DUMMY DATA
        currentSystem.water = 20
        currentSystem.furs = 1
        currentSystem.food = 7
        currentSystem.ore = 57
        currentSystem.games = 12
        currentSystem.firearms = 38
        
        currentSystem.waterBuy = 37
        currentSystem.fursBuy = 274
        currentSystem.foodBuy = 108
        currentSystem.oreBuy = 397
        currentSystem.gamesBuy = 158
        currentSystem.firearmsBuy = 1101
        
        targetSystem.waterSell = 45
        targetSystem.fursSell = 290
        targetSystem.foodSell = 0
        targetSystem.oreSell = 441
        targetSystem.gamesSell = 178
        targetSystem.firearmsSell = 752
        // END DUMMY DATA
        

        waterQty.setTitle("\(currentSystem.water)", forState: controlState)
        fursQty.setTitle("\(currentSystem.furs)", forState: controlState)
        foodQty.setTitle("\(currentSystem.food)", forState: controlState)
        oreQty.setTitle("\(currentSystem.ore)", forState: controlState)
        gamesQty.setTitle("\(currentSystem.games)", forState: controlState)
        firearmsQty.setTitle("\(currentSystem.firearms)", forState: controlState)
        medicineQty.setTitle("\(currentSystem.medicine)", forState: controlState)
        machinesQty.setTitle("\(currentSystem.machines)", forState: controlState)
        narcoticsQty.setTitle("\(currentSystem.narcotics)", forState: controlState)
        robotsQty.setTitle("\(currentSystem.robots)", forState: controlState)
        
        waterPrice.text = "\(currentSystem.waterBuy) cr."
        fursPrice.text = "\(currentSystem.fursBuy) cr."
        foodPrice.text = "\(currentSystem.foodBuy) cr."
        orePrice.text = "\(currentSystem.oreBuy) cr."
        gamesPrice.text = "\(currentSystem.gamesBuy) cr."
        firearmsPrice.text = "\(currentSystem.firearmsBuy) cr."
        medicinePrice.text = "\(currentSystem.medicineBuy) cr."
        machinesPrice.text = "\(currentSystem.machinesBuy) cr."
        narcoticsPrice.text = "\(currentSystem.narcoticsBuy) cr."
        robotsPrice.text = "\(currentSystem.robotsBuy) cr."
        
        waterProjectedPL.text = "\(getPPLString(targetSystem.waterSell, currentBuy: currentSystem.waterBuy))"
        fursProjectedPL.text = "\(getPPLString(targetSystem.fursSell, currentBuy: currentSystem.fursBuy))"
        foodProjectedPL.text = "\(getPPLString(targetSystem.foodSell, currentBuy: currentSystem.foodBuy))"
        oreProjectedPL.text = "\(getPPLString(targetSystem.oreSell, currentBuy: currentSystem.oreBuy))"
        gamesProjectedPL.text = "\(getPPLString(targetSystem.gamesSell, currentBuy: currentSystem.gamesBuy))"
        firearmsProjectedPL.text = "\(getPPLString(targetSystem.firearmsSell, currentBuy: currentSystem.firearmsBuy))"
        medicineProjectedPL.text = "\(getPPLString(targetSystem.medicineSell, currentBuy: currentSystem.medicineBuy))"
        machinesProjectedPL.text = "\(getPPLString(targetSystem.machinesSell, currentBuy: currentSystem.machinesBuy))"
        narcoticsProjectedPL.text = "\(getPPLString(targetSystem.narcoticsSell, currentBuy: currentSystem.narcoticsBuy))"
        robotsProjectedPL.text = "\(getPPLString(targetSystem.robotsSell, currentBuy: currentSystem.robotsBuy))"
        
        // experiment
        robotsQty.setTitle("", forState: controlState)
        
        // eliminating buttons/labels for things not traded
        if currentSystem.water == 0 {
            waterQty.setTitle("", forState: controlState)
            waterPrice.text = "not sold"
            waterProjectedPL.text = "---"
        }
        if currentSystem.furs == 0 {
            fursQty.setTitle("", forState: controlState)
            fursPrice.text = "not sold"
            fursProjectedPL.text = "---"
        }
        if currentSystem.food == 0 {
            foodQty.setTitle("", forState: controlState)
            foodPrice.text = "not sold"
            foodProjectedPL.text = "---"
        }
        if currentSystem.ore == 0 {
            oreQty.setTitle("", forState: controlState)
            orePrice.text = "not sold"
            oreProjectedPL.text = "---"
        }
        if currentSystem.games == 0 {
            gamesQty.setTitle("", forState: controlState)
            gamesPrice.text = "not sold"
            gamesProjectedPL.text = "---"
        }
        if currentSystem.firearms == 0 {
            firearmsQty.setTitle("", forState: controlState)
            firearmsPrice.text = "not sold"
            firearmsProjectedPL.text = "---"
        }
        if currentSystem.medicine == 0 {
            medicineQty.setTitle("", forState: controlState)
            medicinePrice.text = "not sold"
            medicineProjectedPL.text = "---"
        }
        if currentSystem.machines == 0 {
            machinesQty.setTitle("", forState: controlState)
            machinesPrice.text = "not sold"
            machinesProjectedPL.text = "---"
        }
        if currentSystem.narcotics == 0 {
            narcoticsQty.setTitle("", forState: controlState)
            narcoticsPrice.text = "not sold"
            narcoticsProjectedPL.text = "---"
        }
        if currentSystem.robots == 0 {
            robotsQty.setTitle("", forState: controlState)
            robotsPrice.text = "not sold"
            robotsProjectedPL.text = "---"
        }
        
        if targetSystem.waterSell == 0 {
            waterProjectedPL.text = "---"
        }
        if targetSystem.fursSell == 0 {
            fursProjectedPL.text = "---"
        }
        if targetSystem.foodSell == 0 {
            foodProjectedPL.text = "---"
        }
        if targetSystem.oreSell == 0 {
            oreProjectedPL.text = "---"
        }
        if targetSystem.gamesSell == 0 {
            gamesProjectedPL.text = "---"
        }
        if targetSystem.firearmsSell == 0 {
            firearmsProjectedPL.text = "---"
        }
        if targetSystem.medicineSell == 0 {
            medicineProjectedPL.text = "---"
        }
        if targetSystem.machinesSell == 0 {
            machinesProjectedPL.text = "---"
        }
        if targetSystem.narcoticsSell == 0 {
            narcoticsProjectedPL.text = "---"
        }
        if targetSystem.robotsSell == 0 {
            robotsProjectedPL.text = "---"
        }
        
        // fill out info at the bottom
        
        targetSystemLabel.text = "Target system: \(targetSystem.name)"
        baysLabel.text = "Bays: 0/\(player.commanderShip.cargoBays)"    // FIX
        cashLabel.text = "Cash: \(player.credits) cr."
        
        
    }
    
    func getPPLString(targetSell: Int, currentBuy: Int) -> String {
        let value = targetSell - currentBuy
        var sign: String = ""
        if value > 0 {
            sign = "+"
        } else {
            sign = ""
        }
        let string = "\(sign)\(value) cr."
        print(string)
        return string
    }
    
    
    @IBAction func buyWaterTapped(sender: AnyObject) {
        print("buy water tapped, sender side")
        buySellCommodity = TradeItemType.Water
        performSegueWithIdentifier("buyModal", sender: sender) //TradeItemType.Water)
    }
    
    @IBAction func buyFursTapped(sender: AnyObject) {
        buySellCommodity = TradeItemType.Furs
        performSegueWithIdentifier("buyModal", sender: sender)
    }
    
    @IBAction func buyFoodTapped(sender: AnyObject) {
        buySellCommodity = TradeItemType.Food
        buyAsOpposedToSell = true
        performSegueWithIdentifier("buyModal", sender: sender)
    }
    
    @IBAction func buyOreTapped(sender: AnyObject) {
        buySellCommodity = TradeItemType.Ore
        performSegueWithIdentifier("buyModal", sender: sender)
    }
    
    @IBAction func buyGamesTapped(sender: AnyObject) {
        buySellCommodity = TradeItemType.Games
        performSegueWithIdentifier("buyModal", sender: sender)
    }
    
    @IBAction func buyFirearmsTapped(sender: AnyObject) {
        buySellCommodity = TradeItemType.Firearms
        performSegueWithIdentifier("buyModal", sender: sender)
    }
    
    @IBAction func buyMedicineTapped(sender: AnyObject) {
        buySellCommodity = TradeItemType.Medicine
        performSegueWithIdentifier("buyModal", sender: sender)
    }
    
    @IBAction func buyMachinesTapped(sender: AnyObject) {
        buySellCommodity = TradeItemType.Machines
        performSegueWithIdentifier("buyModal", sender: sender)
    }
    
    @IBAction func buyNarcoticsTapped(sender: AnyObject) {
        buySellCommodity = TradeItemType.Narcotics
        performSegueWithIdentifier("buyModal", sender: sender)
    }
    
    @IBAction func buyRobotsTapped(sender: AnyObject) {
        buySellCommodity = TradeItemType.Robots
        performSegueWithIdentifier("buyModal", sender: sender)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("prepareForSegue firing")
//        if segue.identifier == "buyModal" {
//            if let colorViewController = segue.destinationViewController as? ColorViewController {
//                colorViewController.color = sender as? UIColor
//            }
//        }
    }
}

//class BuyModalVCSuper: UIViewController {
//    
//    var item: TradeItemType?
//    var buy: Bool?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.item = item
//        view.buy = buy
//}
