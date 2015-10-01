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
    

    
    // quantities
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
    
    // price label
    
    // P/L label
    
    // things at the bottom
    @IBOutlet weak var targetSystemLabel: UILabel!
    @IBOutlet weak var baysAvailableLabel: UILabel!
    @IBOutlet weak var cashLabel: UILabel!

    
    
    // "All" buttons
    @IBAction func waterAll() {
        player.sellAll(.Water)
        recurringUpdate()
    }
    
    @IBAction func fursAll() {
        player.sellAll(.Furs)
        recurringUpdate()
    }
    
    @IBAction func foodAll() {
        player.sellAll(.Food)
        recurringUpdate()
    }
    
    @IBAction func oreAll() {
        player.sellAll(.Ore)
        recurringUpdate()
    }

    @IBAction func gamesAll() {
        player.sellAll(.Games)
        recurringUpdate()
    }
    
    @IBAction func firearmsAll() {
        player.sellAll(.Firearms)
        recurringUpdate()
    }
    
    @IBAction func medicineAll() {
        player.sellAll(.Medicine)
        recurringUpdate()
    }
    
    @IBAction func machinesAll() {
        player.sellAll(.Machines)
        recurringUpdate()
    }
    
    @IBAction func narcoticsAll() {
        player.sellAll(.Narcotics)
        recurringUpdate()
    }
    
    @IBAction func robotsAll() {
        player.sellAll(.Robots)
        recurringUpdate()
    }
    
    // sell buttons--need sender, unfortunately
    
    @IBAction func sellWater(sender: AnyObject) {
        buySellCommodity = TradeItemType.Water
        performSegueWithIdentifier("sellModal", sender: sender)
    }
    
    @IBAction func sellFurs(sender: AnyObject) {
        buySellCommodity = TradeItemType.Furs
        performSegueWithIdentifier("sellModal", sender: sender)
    }
    
    @IBAction func sellFood(sender: AnyObject) {
        buySellCommodity = TradeItemType.Food
        performSegueWithIdentifier("sellModal", sender: sender)
    }
    
    @IBAction func sellOre(sender: AnyObject) {
        buySellCommodity = TradeItemType.Ore
        performSegueWithIdentifier("sellModal", sender: sender)
    }
    
    @IBAction func sellGames(sender: AnyObject) {
        buySellCommodity = TradeItemType.Games
        performSegueWithIdentifier("sellModal", sender: sender)
    }
    
    @IBAction func sellFirearms(sender: AnyObject) {
        buySellCommodity = TradeItemType.Firearms
        performSegueWithIdentifier("sellModal", sender: sender)
    }

    @IBAction func sellMedicine(sender: AnyObject) {
        buySellCommodity = TradeItemType.Medicine
        performSegueWithIdentifier("sellModal", sender: sender)
    }

    @IBAction func sellMachines(sender: AnyObject) {
        buySellCommodity = TradeItemType.Machines
        performSegueWithIdentifier("sellModal", sender: sender)
    }
    
    @IBAction func sellNarcotics(sender: AnyObject) {
        buySellCommodity = TradeItemType.Narcotics
        performSegueWithIdentifier("sellModal", sender: sender)
    }
    
    @IBAction func sellRobots(sender: AnyObject) {
        buySellCommodity = TradeItemType.Robots
        performSegueWithIdentifier("sellModal", sender: sender)
    }
    
    
    
    
    
    override func viewDidLoad() {
        recurringUpdate()
        buyAsOpposedToSell = false
        
        // DUMMY DATA
        currentSystem.waterSell = 45
        currentSystem.fursSell = 290
        currentSystem.foodSell = 120
        currentSystem.oreSell = 441
        currentSystem.gamesSell = 178
        currentSystem.firearmsSell = 752
        // END DUMMY DATA
        
        
    }
    
    func recurringUpdate() {
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
        
        cashLabel.text = "Cash: \(player.credits) cr."
    }
    
    // this updates quantities when this page becomes active
    override func viewWillAppear(animated: Bool) {
        recurringUpdate()
        buyAsOpposedToSell = false
    }
    
}
