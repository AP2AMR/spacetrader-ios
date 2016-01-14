//
//  ShipVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 12/15/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class ShipVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
   
    var tableView1TextArray: [String] = ["1 Photon Disruptor", "2 Reflective Shields"]
    var tableView2TextArray: [String] = ["10 Bays of Antidote"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView1.registerClass(UITableViewCell.self, forCellReuseIdentifier: "topCell")
        self.tableView2.registerClass(UITableViewCell.self, forCellReuseIdentifier: "bottomCell")
        
        updateData()
    }
    
    func updateData() {
        typeLabel.text = player.commanderShip.name
        
        class equipmentEntry {
            var name: String
            var quantity: Int
            
            init(name: String, quantity: Int) {
                self.name = name
                self.quantity = quantity
            }
        }
        
        var equipmentOnBoard: [equipmentEntry] = []
        
        for item in player.commanderShip.weapon {
            // if item is not already in equipmentOnBoard, add it
            var alreadyInList = false
            for item2 in equipmentOnBoard {
                // update quantity if already present
                if item2.name == item.name {
                    item2.quantity += 1
                    alreadyInList = true
                }
            }
            // add it if not present yet, quantity 1
            if !alreadyInList {
                let newEntry = equipmentEntry(name: item.name, quantity: 1)
                equipmentOnBoard.append(newEntry)
            }
        }
        
        for item in player.commanderShip.shield {
            // if item is not already in equipmentOnBoard, add it
            var alreadyInList = false
            for item2 in equipmentOnBoard {
                // update quantity if already present
                if item2.name == item.name {
                    item2.quantity += 1
                    alreadyInList = true
                }
            }
            // add it if not present yet, quantity 1
            if !alreadyInList {
                let newEntry = equipmentEntry(name: item.name, quantity: 1)
                equipmentOnBoard.append(newEntry)
            }
        }
        
        for item in player.commanderShip.gadget {
            // if item is not already in equipmentOnBoard, add it
            var alreadyInList = false
            for item2 in equipmentOnBoard {
                // update quantity if already present
                if item2.name == item.name {
                    item2.quantity += 1
                    alreadyInList = true
                }
            }
            // add it if not present yet, quantity 1
            if !alreadyInList {
                let newEntry = equipmentEntry(name: item.name, quantity: 1)
                equipmentOnBoard.append(newEntry)
            }
        }
        
        // equipment
        tableView1TextArray = []
        for entry in equipmentOnBoard {
            var plural = false
            var newString = ""
            if entry.quantity > 1 {
                plural = true
            }
            if plural {
                newString = "\(entry.quantity) \(entry.name)s"
            } else {
                newString = "\(entry.quantity) \(entry.name)"
            }
            tableView2TextArray = []
            print(newString)
            tableView1TextArray.append(newString)
        }
        
        // report empty slots
        let emptyWeaponString = "(\(player.commanderShip.weaponSlots - player.commanderShip.weapon.count) empty weapon slots)"
        tableView1TextArray.append(emptyWeaponString)
        let emptyShieldString = "(\(player.commanderShip.shieldSlots - player.commanderShip.shield.count) empty shield slots)"
        tableView1TextArray.append(emptyShieldString)
        let emptyGadgetString = "(\(player.commanderShip.gadgetSlots - player.commanderShip.gadget.count) empty gadget slots)"
        tableView1TextArray.append(emptyGadgetString)
        
        // special cargo
        
        for item in player.commanderShip.specialCargo {
            tableView2TextArray.append(item.name)
        }
        
        self.tableView1.reloadData()
        self.tableView2.reloadData()
    }



    // TABLE VIEW METHODS*************************************************************************
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView1 {
            return tableView1TextArray.count
        } else {
            return tableView2TextArray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if tableView == tableView1 {
            let cell: UITableViewCell = self.tableView1.dequeueReusableCellWithIdentifier("topCell")!
            cell.textLabel?.text = self.tableView1TextArray[indexPath.row]
            return cell
        } else {
            let cell: UITableViewCell = self.tableView2.dequeueReusableCellWithIdentifier("bottomCell")!
            cell.textLabel?.text = self.tableView2TextArray[indexPath.row]
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == tableView1 {
            //print("indexPath.row: \(indexPath.row), shipItems.count: \(shipItems.count)")
            
        } else {
            
        }
    }
}