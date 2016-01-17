//
//  OptionsMenuVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 1/16/16.
//  Copyright © 2016 Marc Auger. All rights reserved.
//

import UIKit

class OptionsMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var section0 = ["Full tanks on arrival", "Hull repair on arrival", "Newspaper on arrival"]
    var section1 = ["Remind about loans"]
    var section2 = ["Ignore pirates when safe", "Ignore police when safe", "Ignore traders when safe"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = UIRectEdge.None
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")!
        
        if indexPath.section == 0 {
            cell.textLabel?.text = section0[indexPath.row]
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Full tanks on arrival"
                if player.fullTanksOnArrival {
                    cell.accessoryType = .Checkmark
                } else {
                    cell.accessoryType = .None
                }
            case 1:
                cell.textLabel?.text = "Hull repair on arrival"
                if player.hullRepairsOnArrival {
                    cell.accessoryType = .Checkmark
                } else {
                    cell.accessoryType = .None
                }
            case 2:
                cell.textLabel?.text = "Newspaper on arrival"
                if player.newspaperOnArrival {
                    cell.accessoryType = .Checkmark
                } else {
                    cell.accessoryType = .None
                }
            default:
                print("error")
            }
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "Remind about loans"
            if player.remindLoans {
                cell.accessoryType = .Checkmark
            } else {
                cell.accessoryType = .None
            }
        } else {
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Ignore pirates when safe"
                if player.ignorePirates {
                    cell.accessoryType = .Checkmark
                } else {
                    cell.accessoryType = .None
                }
            case 1:
                cell.textLabel?.text = "Ignore police when safe"
                if player.ignorePolice {
                    cell.accessoryType = .Checkmark
                } else {
                    cell.accessoryType = .None
                }
            case 2:
                cell.textLabel?.text = "Ignore traders when safe"
                if player.ignoreTraders {
                    cell.accessoryType = .Checkmark
                } else {
                    cell.accessoryType = .None
                }
            default:
                print("error")
            }
        }
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else if section == 1 {
            return 1
        } else {
            return 3
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.accessoryType == .Checkmark
            {
                cell.accessoryType = .None
                if indexPath.section == 0 {
                    switch indexPath.row {
                    case 0:
                        player.fullTanksOnArrival = true
                    case 1:
                        player.hullRepairsOnArrival = true
                    case 2:
                        player.newspaperOnArrival = true
                    default:
                        print("error")
                    }
                } else if indexPath.section == 1 {
                    player.remindLoans = true
                } else {
                    switch indexPath.row {
                    case 0:
                        player.ignorePirates = true
                    case 1:
                        player.ignorePolice = true
                    case 2:
                        player.ignoreTraders = true
                    default:
                        print("error")
                    }
                }
            }
            else
            {
                cell.accessoryType = .Checkmark
                if indexPath.section == 0 {
                    switch indexPath.row {
                    case 0:
                        
                        player.fullTanksOnArrival = true
                    case 1:
                        player.hullRepairsOnArrival = true
                    case 2:
                        player.newspaperOnArrival = true
                    default:
                        print("error")
                    }
                } else if indexPath.section == 1 {
                    player.remindLoans = true
                } else {
                    switch indexPath.row {
                    case 0:
                        player.ignorePirates = true
                    case 1:
                        player.ignorePolice = true
                    case 2:
                        player.ignoreTraders = true
                    default:
                        print("error")
                    }
                }
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
}
