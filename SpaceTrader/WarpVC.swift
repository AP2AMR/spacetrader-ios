//
//  WarpVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/3/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit


class WarpVC: UIViewController, ShortRangeChartDelegate {

    @IBOutlet weak var shortRangeChart: ShortRangeChartView! {
        didSet {
            shortRangeChart.delegate = self
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var techLevelLabel: UILabel!
    @IBOutlet weak var governmentLabel: UILabel!
    @IBOutlet weak var resourceLabel: UILabel!
    @IBOutlet weak var policeLabel: UILabel!
    @IBOutlet weak var piratesLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBAction func cycleBackwards() {
        galaxy.cycleBackward()
        updateView()
        shortRangeChart.redrawSelf()
    }
    
    @IBAction func cycleForwards() {
        galaxy.cycleForward()
        updateView()
        shortRangeChart.redrawSelf()
    }
    
    @IBAction func warpButton() {
        galaxy.warp()
        updateView()
        shortRangeChart.redrawSelf()
    }

    override func viewDidLoad() {
        
        updateView()
        
    }
    
    func updateView() {
        let politics = Politics(type: galaxy.targetSystem!.politics)
        
        nameLabel.text = galaxy.targetSystem!.name
        sizeLabel.text = galaxy.targetSystem!.size.rawValue
        techLevelLabel.text = galaxy.targetSystem!.techLevel.rawValue
        governmentLabel.text = galaxy.targetSystem!.politics.rawValue
        resourceLabel.text = galaxy.targetSystem!.specialResources.rawValue
        policeLabel.text = galaxy.getActivityForInt(politics.activityPolice)
        piratesLabel.text = galaxy.getActivityForInt(politics.activityPirates)
        distanceLabel.text = "\(galaxy.getDistance(galaxy.currentSystem!, system2: galaxy.targetSystem!))"
    }
    
    override func viewDidAppear(animated: Bool) {
        updateView()
        shortRangeChart.redrawSelf()
    }
    
    func targetSystemDidChange() {
        updateView()
    }
    
}
