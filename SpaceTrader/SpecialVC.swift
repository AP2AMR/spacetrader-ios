//
//  SpecialVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 12/3/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class SpecialVC: UIViewController {

    @IBOutlet weak var specialEventTitle: UILabel!
    @IBOutlet weak var specialEventText: UITextView!
    @IBOutlet weak var dismissButtonOutlet: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        if player.specialEvents.special {
            specialEventTitle.text = player.specialEvents.specialEventTitle
            specialEventText.text = player.specialEvents.specialEventText
        }
    }

    @IBAction func dismissButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        player.specialEvents.special = false
    }


}
