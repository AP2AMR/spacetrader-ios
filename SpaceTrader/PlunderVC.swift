//
//  PlunderVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/31/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class PlunderVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        // Do any additional setup after loading the view.
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
    
    func updateUI() {
        let controlState = UIControlState()
        
        // set quantities
        waterQuantity.setTitle("\(galaxy.currentSystem!.water)", forState: controlState)
    }

}
