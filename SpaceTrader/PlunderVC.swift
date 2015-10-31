//
//  PlunderVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/31/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

protocol PlunderDelegate: class {
    func plunderDidFinish(controller: PlunderVC)
}

class PlunderVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        updateUI()
    }
    
    
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

    @IBOutlet weak var baysLabel: UILabel!
    
    weak var delegate: PlunderDelegate?
    
    func updateUI() {
        let controlState = UIControlState()
        
        // set quantities
        waterQuantity.setTitle("\(galaxy.currentJourney!.currentEncounter!.opponent.ship.getQuantity(TradeItemType.Water))", forState: controlState)
        fursQuantity.setTitle("\(galaxy.currentJourney!.currentEncounter!.opponent.ship.getQuantity(TradeItemType.Furs))", forState: controlState)
        foodQuantity.setTitle("\(galaxy.currentJourney!.currentEncounter!.opponent.ship.getQuantity(TradeItemType.Food))", forState: controlState)
        oreQuantity.setTitle("\(galaxy.currentJourney!.currentEncounter!.opponent.ship.getQuantity(TradeItemType.Ore))", forState: controlState)
        gamesQuantity.setTitle("\(galaxy.currentJourney!.currentEncounter!.opponent.ship.getQuantity(TradeItemType.Games))", forState: controlState)
        firearmsQuantity.setTitle("\(galaxy.currentJourney!.currentEncounter!.opponent.ship.getQuantity(TradeItemType.Firearms))", forState: controlState)
        medicineQuantity.setTitle("\(galaxy.currentJourney!.currentEncounter!.opponent.ship.getQuantity(TradeItemType.Medicine))", forState: controlState)
        machinesQuantity.setTitle("\(galaxy.currentJourney!.currentEncounter!.opponent.ship.getQuantity(TradeItemType.Machines))", forState: controlState)
        narcoticsQuantity.setTitle("\(galaxy.currentJourney!.currentEncounter!.opponent.ship.getQuantity(TradeItemType.Narcotics))", forState: controlState)
        robotsQuantity.setTitle("\(galaxy.currentJourney!.currentEncounter!.opponent.ship.getQuantity(TradeItemType.Robots))", forState: controlState)
        
        baysLabel.text = "Bays: \(player.commanderShip.baysAvailable)/\(player.commanderShip.cargoBays)"
    }
    
    func getMaxQuantity(commodity: TradeItemType) -> Int {
        var quantityOnBoard = 0
        for item in galaxy.currentJourney!.currentEncounter!.opponent.ship.cargo {
            if item.item == commodity {
                quantityOnBoard += item.quantity
            }
        }
        let baysAvailable = player.commanderShip.baysAvailable
        
        return min(quantityOnBoard, baysAvailable)
    }
    
    func plunder(commodity: TradeItemType, amount: Int) -> Bool {
        // make sure space to go through
        if amount > getMaxQuantity(commodity) {
            return false
        }
        
        // add to player
        player.commanderShip.addCargo(commodity, quantity: amount, pricePaid: 0)
        
        // remove from opponent
        galaxy.currentJourney!.currentEncounter!.opponent.ship.removeCargo(commodity, quantity: amount)
        
        return true
    }

    @IBAction func doneButton(sender: AnyObject) {
        // CLUSTERFUCK
        
        // this works for encounters generally
        self.dismissViewControllerAnimated(false, completion: nil)
        
        delegate?.plunderDidFinish(self)
    }
    
    @IBAction func waterAll(sender: AnyObject) {
    }
    
    @IBAction func fursAll(sender: AnyObject) {
    }
    
    @IBAction func foodAll(sender: AnyObject) {
    }
    
    @IBAction func oreAll(sender: AnyObject) {
    }
    
    @IBAction func gamesAll(sender: AnyObject) {
    }
    
    @IBAction func firearmsAll(sender: AnyObject) {
    }
    
    @IBAction func medicineAll(sender: AnyObject) {
    }
    
    @IBAction func machinesAll(sender: AnyObject) {
    }
    
    @IBAction func narcoticsAll(sender: AnyObject) {
    }
    
    @IBAction func robotsAll(sender: AnyObject) {
    }
    
    
    
}
