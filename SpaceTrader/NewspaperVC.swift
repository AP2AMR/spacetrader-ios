//
//  NewspaperVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 12/2/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class NewspaperVC: UIViewController {

    @IBOutlet weak var newspaperTitleLabel: UILabel!
    @IBOutlet weak var story1TextView: UITextView!
    @IBOutlet weak var story2TextView: UITextView!
    @IBOutlet weak var story3TextView: UITextView!
    @IBOutlet weak var story4TextView: UITextView!
    @IBOutlet weak var story5TextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        newspaperTitleLabel.text = galaxy.currentSystem!.localNewspaperTitle
    }

    @IBAction func doneButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
