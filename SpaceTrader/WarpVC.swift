//
//  WarpVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/3/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class WarpVC: UIViewController {

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
    }
    
    @IBAction func cycleForwards() {
        galaxy.cycleForward()
        updateView()
    }
    
    @IBAction func warpButton() {
        galaxy.warp()
        updateView()
    }

    override func viewDidLoad() {
        // let politics = Politics(type: galaxy.currentSystem!.politics)
        // make function to get police/pirate activity word from int. Maybe bake into StarSystem?
        
        updateView()
        
    }
    
    func updateView() {
        nameLabel.text = galaxy.targetSystem!.name
        sizeLabel.text = galaxy.targetSystem!.size.rawValue
        techLevelLabel.text = galaxy.targetSystem!.techLevel.rawValue
        governmentLabel.text = galaxy.targetSystem!.politics.rawValue
        resourceLabel.text = galaxy.targetSystem!.specialResources.rawValue
        policeLabel.text = "placeholder"
        piratesLabel.text = "placeholder"
        distanceLabel.text = "\(galaxy.getDistance(galaxy.currentSystem!, system2: galaxy.targetSystem!))"
    }
    
}
