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



    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controlState = UIControlState()

        //qtyWater.setTitle("poop", forState: controlState)
        
        let testPrice01 = 158
        gamesQty.setTitle("12", forState: controlState)
        gamesPrice.text = "\(testPrice01) cr."
    }

    
}
