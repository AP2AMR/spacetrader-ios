//
//  BankQuantityVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 12/17/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class BankQuantityVC: UIViewController {

    var getVsPayBack: Bool?
    var maxLoan: Int?

    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if getVsPayBack! {
            self.title = "Get Loan"
        } else {
            self.title = "Pay Back Loan"
        }
        
    }



}
