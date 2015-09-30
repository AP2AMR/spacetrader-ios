//
//  SellVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/22/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class SellVC: UIViewController {
    
    let controlState = UIControlState()
    
    @IBOutlet weak var waterQuantity: UIButton!
    @IBOutlet weak var fursQuantity: UIButton!
    @IBOutlet weak var foodQuantity: UIButton!
    @IBOutlet weak var oreQuantity: UIButton!
    @IBOutlet weak var gamesQuantity: UIButton!
    @IBOutlet weak var firearmsQuantity: UIButton!
    @IBOutlet weak var medicineQuantity: UIButton!
    @IBOutlet weak var machinesQuantity: UIButton!
    @IBOutlet weak var narcoticsQuantity: UIButton!
    @IBOutlet weak var robotsQuantity: UIButton!
    
    override func viewDidLoad() {
        updateQuantities()
        
        
    }
    
    func updateQuantities() {
        waterQuantity.setTitle("\(player.commanderShip.getQuantity(.Water))", forState: controlState)
        fursQuantity.setTitle("\(player.commanderShip.getQuantity(.Furs))", forState: controlState)
        foodQuantity.setTitle("\(player.commanderShip.getQuantity(.Food))", forState: controlState)
        oreQuantity.setTitle("\(player.commanderShip.getQuantity(.Ore))", forState: controlState)
        gamesQuantity.setTitle("\(player.commanderShip.getQuantity(.Games))", forState: controlState)
        firearmsQuantity.setTitle("\(player.commanderShip.getQuantity(.Firearms))", forState: controlState)
        medicineQuantity.setTitle("\(player.commanderShip.getQuantity(.Medicine))", forState: controlState)
        machinesQuantity.setTitle("\(player.commanderShip.getQuantity(.Machines))", forState: controlState)
        narcoticsQuantity.setTitle("\(player.commanderShip.getQuantity(.Narcotics))", forState: controlState)
        robotsQuantity.setTitle("\(player.commanderShip.getQuantity(.Robots))", forState: controlState)
    }
}
