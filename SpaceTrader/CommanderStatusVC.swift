//
//  CommanderStatusVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 12/8/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class CommanderStatusVC: UITableViewController  {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func viewDidLoad() {
        loadData()
    }
    
    func loadData() {
        nameLabel.text = player.commanderName
        difficultyLabel.text = player.difficulty.rawValue
        timeLabel.text = "\(player.days) days"
    }

  }
