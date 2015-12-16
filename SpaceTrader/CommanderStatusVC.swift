//
//  CommanderStatusVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 12/8/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class CommanderStatusVC: UIViewController  {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var pilotLabel: UILabel!
    @IBOutlet weak var fighterLabel: UILabel!
    @IBOutlet weak var traderLabel: UILabel!
    @IBOutlet weak var engineerLabel: UILabel!
    
    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var debtLabel: UILabel!
    @IBOutlet weak var netWorthLabel: UILabel!
    
    @IBOutlet weak var killsLabel: UILabel!
    @IBOutlet weak var reputationLabel: UILabel!
    @IBOutlet weak var policeRecordLabel: UILabel!
    
    override func viewDidLoad() {
        loadData()
    }
    
    func loadData() {
        nameLabel.text = player.commanderName
        difficultyLabel.text = player.difficulty.rawValue
        timeLabel.text = "\(player.days) days"
        
        
    }

  }
