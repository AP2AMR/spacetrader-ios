//
//  MercenariesVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 11/9/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class MercenariesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    
    
    var displayItems: [String] = ["first thing", "second thing", "third thing"]
    var otherArray: [String] = ["one", "two", "three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView1.registerClass(UITableViewCell.self, forCellReuseIdentifier: "topCell")
        self.tableView2.registerClass(UITableViewCell.self, forCellReuseIdentifier: "bottomCell")
        
    }
    
    @IBAction func done(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // TABLE VIEW FUNCTIONS****************************************************************************
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tableView1 {
            return displayItems.count
        } else {
            return otherArray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == tableView1 {
            let cell: UITableViewCell = self.tableView1.dequeueReusableCellWithIdentifier("topCell")!
            cell.textLabel?.text = self.displayItems[indexPath.row]
            return cell
        } else {
            let cell: UITableViewCell = self.tableView2.dequeueReusableCellWithIdentifier("bottomCell")!
            cell.textLabel?.text = self.otherArray[indexPath.row]
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("selected row \(indexPath.row)")
    }
    
    

}
