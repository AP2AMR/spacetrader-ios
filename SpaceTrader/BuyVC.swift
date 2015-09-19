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


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controlState = UIControlState()

        currentSystem.water = 20
        currentSystem.furs = 1
        currentSystem.food = 7
        currentSystem.ore = 57
        currentSystem.games = 12
        currentSystem.firearms = 38
        
        
        
        
        
        // set quantities. The star system will eventually be currentSystem in Player
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

        player.oreBuy = 397
        
        
        waterPrice.text = "\(player.waterBuy) cr."
        fursPrice.text = "\(player.fursBuy) cr."
        foodPrice.text = "\(player.foodBuy) cr."
        orePrice.text = "\(player.oreBuy) cr."
        gamesPrice.text = "\(player.gamesBuy) cr."
        firearmsPrice.text = "\(player.firearmsBuy) cr."
        medicinePrice.text = "\(player.medicineBuy) cr."
        machinesPrice.text = "\(player.machinesBuy) cr."
        narcoticsPrice.text = "\(player.narcoticsBuy) cr."
        robotsPrice.text = "\(player.robotsBuy) cr."
        
        
        
    }

    
}
