//
//  BankVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 12/17/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class BankVC: UIViewController {

    @IBOutlet weak var currentDebtLabel: UILabel!
    @IBOutlet weak var maximumLoanLabel: UILabel!
    @IBOutlet weak var shipValueLabel: UILabel!
    @IBOutlet weak var noClaimDiscountLabel: UILabel!
    @IBOutlet weak var costsLabel: UILabel!
    
    var getVsPayBack = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
    }
    
    func setData() {
        // current debt
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .DecimalStyle
        let currentDebtFormatted = numberFormatter.stringFromNumber(player.debt)
        currentDebtLabel.text = "\(currentDebtFormatted!) cr."
        
        // maximum loan
        let maxLoan = getMaxLoan()
        let maxLoanFormatted = numberFormatter.stringFromNumber(maxLoan)
        maximumLoanLabel.text = "\(maxLoanFormatted!) cr."
        
        // ship value
        let shipValueFormatted = numberFormatter.stringFromNumber(player.commanderShip.value)
        shipValueLabel.text = "\(shipValueFormatted!) cr."
        
        
        
        
        
    }
    
    func getMaxLoan() -> Int {
        var maxLoan = 0
        if player.policeRecordInt >= 5 {
            print("at least clean police record")
            maxLoan = max(1000, (player.netWorth / 10))
            maxLoan = min (25000, maxLoan)
            
            // round to 200
            if maxLoan > 1000 {
                maxLoan = maxLoan - (maxLoan % 200)
            }
            
            return maxLoan
        } else {
            return 500
        }
    }

    @IBAction func getLoan(sender: AnyObject) {
        getVsPayBack = true
        performSegueWithIdentifier("bankQuantitySegue", sender: nil)
    }
    
    @IBAction func payBackLoan(sender: AnyObject) {
        getVsPayBack = false
        performSegueWithIdentifier("bankQuantitySegue", sender: nil)
    }

    @IBAction func buyInsurance(sender: AnyObject) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "bankQuantitySegue") {
            // set up VC, add getVsPayBack to it as Bool?, maxLoan as Int?
            
            let vc = (segue.destinationViewController as! BankQuantityVC)
            vc.getVsPayBack = getVsPayBack
            vc.maxLoan = getMaxLoan()
        }
        
    }
    
}
