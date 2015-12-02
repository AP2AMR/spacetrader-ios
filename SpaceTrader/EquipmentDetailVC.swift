//
//  EquipmentDetailVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 12/1/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class EquipmentDetailVC: UIViewController {

    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var buyPrice: UILabel!
    @IBOutlet weak var sellPrice: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var blurb: UITextView!
    @IBOutlet weak var buyButtonLabel: UIButton!
    
    
    var chosenItem: UniversalGadget?
    var buyNotSell: Bool?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()

        // Do any additional setup after loading the view.
    }

    @IBAction func buySellButton(sender: AnyObject) {
    }
    
    func setData() {
        imageOutlet.image = chosenItem!.image
        nameLabel.text = chosenItem!.name
        typeLabel.text = chosenItem!.type
        powerLabel.text = chosenItem!.power
        blurb.text = chosenItem!.blurb
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .DecimalStyle
        let buyPriceFormatted = numberFormatter.stringFromNumber(chosenItem!.price)
        buyPrice.text = "\(buyPriceFormatted!) credits"
        let sellPriceFormatted = numberFormatter.stringFromNumber(chosenItem!.sellPrice)
        sellPrice.text = "\(sellPriceFormatted!) credits"
        
        let controlState = UIControlState()
        if buyNotSell! {
            buyButtonLabel.setTitle("Buy", forState: controlState)
        } else {
            buyButtonLabel.setTitle("Sell", forState: controlState)
        }
        
        
    }

}
