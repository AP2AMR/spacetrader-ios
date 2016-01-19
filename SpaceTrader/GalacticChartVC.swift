//
//  GalacticChartVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/9/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class GalacticChartVC: UIViewController, ShortRangeChartDelegate {
    
    @IBOutlet weak var targetSystemLabel: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        targetSystemDidChange()
    }
    
    
    @IBOutlet weak var galacticChart: GalacticChartView! {
        didSet {
            galacticChart.delegate = self
        }
    }
    @IBOutlet weak var shortRangeChart: ShortRangeChartView! {
        didSet {
            shortRangeChart.delegate = self
        }
    }
    
    
    
    override func viewDidLoad() {

    }
    
    @IBAction func closeButton() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func targetSystemDidChange() {
        galacticChart.redrawSelf()
        shortRangeChart.redrawSelf()
        targetSystemLabel.text = "Target System: \(galaxy.targetSystem!.name)"
    }
    
}
