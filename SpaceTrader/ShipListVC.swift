//
//  ShipListVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 11/9/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class ShipListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var items: [String] = ["Flea", "Gnat", "Firefly", "Mosquito", "Bumblebee", "Beetle", "Hornet", "Grasshopper", "Termite", "Wasp"]
    
//    case Flea
//    case Gnat
//    case Firefly
//    case Mosquito
//    case Bumblebee
//    case Beetle
//    case Hornet
//    case Grasshopper
//    case Termite
//    case Wasp
//    case Custom
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerClass(UITableViewCell.self, forHeaderFooterViewReuseIdentifier: "cell")
    }
    
    @IBAction func done(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }

}
