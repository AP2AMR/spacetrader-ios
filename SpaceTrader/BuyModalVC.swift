//
//  BuyModalVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/23/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class BuyModalVC: UIViewController {

    var tradeItem: TradeItemType?
    var tradeItemName: String?
    var tradeItemPrice: Int {
        get {
            switch buySellCommodity! {
            case .Water:
                return currentSystem.waterBuy
            case .Furs:
                return currentSystem.fursBuy
            case .Food:
                return currentSystem.foodBuy
            case .Ore:
                return currentSystem.oreBuy
            case .Games:
                return currentSystem.gamesBuy
            case .Firearms:
                return currentSystem.firearmsBuy
            case .Medicine:
                return currentSystem.medicineBuy
            case .Machines:
                return currentSystem.machinesBuy
            case .Narcotics:
                return currentSystem.narcoticsBuy
            case .Robots:
                return currentSystem.robotsBuy
            default:
                return 0
            }
        }
    }
    var max = player.getMax(buySellCommodity!)      // BUG ALERT: this causes the game to crash if you tap one of the nonexistent buttons for something not stocked in the system in question. Rather than checking here, need to make those buttons nonexistent.
    
    @IBOutlet weak var quantityField: UITextField!
    @IBOutlet weak var textField: UITextView!
        
    override func viewDidLoad() {
        quantityField.becomeFirstResponder()
        
        tradeItem = buySellCommodity
        //tradeItemName = BuySellCommodity()        // figure out how to render this from the enum w/o a switch
        
        
        
        if buyAsOpposedToSell {
            // SET TITLE FIELD
            textField.text = "At \(tradeItemPrice) cr. each, you can buy up to \(max). How many do you want to buy?"
        }
        
    }
    
    @IBAction func cancel() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
   
    @IBAction func buy() {
        if quantityField.text != nil {
            let quantity = Int(quantityField.text!)
            if quantity <= max {
                print("buy \(quantity!) items")
                self.dismissViewControllerAnimated(false, completion: nil)
            } else {
                self.dismissViewControllerAnimated(false, completion: nil)
            }
        }
    }

    
    
}
