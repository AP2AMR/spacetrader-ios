//
//  EquipmentListDualTableVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 12/1/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class EquipmentListDualTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //let universalArray: [UniversalGadgetType] = [UniversalGadgetType.pulseLaser, UniversalGadgetType.beamLaser, UniversalGadgetType.militaryLaser, UniversalGadgetType.photonDisruptor, UniversalGadgetType.energyShield, UniversalGadgetType.reflectiveShield, UniversalGadgetType.CargoBays, UniversalGadgetType.AutoRepair, UniversalGadgetType.Navigation, UniversalGadgetType.Targeting, UniversalGadgetType.Cloaking]
    
    var selectorIndex = 0
    
    let weaponsArray: [WeaponType] = [WeaponType.pulseLaser, WeaponType.beamLaser, WeaponType.militaryLaser, WeaponType.photonDisruptor]
    let shieldsArray: [ShieldType] = [ShieldType.energyShield, ShieldType.reflectiveShield]
    let gadgetsArray: [GadgetType] = [GadgetType.CargoBays, GadgetType.AutoRepair, GadgetType.Navigation, GadgetType.Targeting, GadgetType.Cloaking]
    
    var tableView1TextArray: [String] = []
    var tableView2TextArray: [String] = ["first available item", "second available item", "third available item"]
    
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var slotsLabel: UILabel!
    @IBOutlet weak var availableLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView1.registerClass(UITableViewCell.self, forCellReuseIdentifier: "topCell")
        self.tableView2.registerClass(UITableViewCell.self, forCellReuseIdentifier: "bottomCell")
        
        refreshView()
    }
    
    @IBAction func SCIndexChanged(sender: AnyObject) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("weapons selected")
            selectorIndex = 0
            refreshView()
        case 1:
            print("shields selected")
            selectorIndex = 1
            refreshView()
        case 2:
            print("gadgets selected")
            selectorIndex = 2
            refreshView()
        default:
            print("error")
        }
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func refreshView() {
        if selectorIndex == 0 {
            slotsLabel.text = "Weapon Slots on Your Ship:"
            availableLabel.text = "Weapons Available:"
            
            // populate current weapons
            tableView1TextArray = []
            let weaponSlotCount = player.commanderShip.weaponSlots
            if weaponSlotCount == 0 {
                tableView1TextArray.append("<Your Ship Has No Weapon Slots>")
            } else {
                // add weapons
                var slotNumber = 1
                for item in player.commanderShip.weapon {
                    tableView1TextArray.append("Slot \(slotNumber): \(item.name)")
                    slotNumber += 1
                }
                // add empty slots
                while (weaponSlotCount + 1) > slotNumber {
                    tableView1TextArray.append("Slot \(slotNumber): <empty>")
                    slotNumber += 1
                }
            }
            self.tableView1.reloadData()
 
            // populate available weapons
            
            self.tableView2.reloadData()
        } else if selectorIndex == 1 {
            slotsLabel.text = "Shield Slots on Your Ship:"
            availableLabel.text = "Shields Available:"
            
            // populate current shields
            tableView1TextArray = []
            let shieldSlotCount = player.commanderShip.shieldSlots
            if shieldSlotCount == 0 {
                tableView1TextArray.append("<Your Ship Has No Shield Slots>")
            } else {
                // add shields
                var slotNumber = 1
                for item in player.commanderShip.shield {
                    tableView1TextArray.append("Slot \(slotNumber): \(item.name)")
                    slotNumber += 1
                }
                // add empty slots
                while (shieldSlotCount + 1) > slotNumber {
                    tableView1TextArray.append("Slot \(slotNumber): <empty>")
                    slotNumber += 1
                }
            }
            self.tableView1.reloadData()
            
            // populate available shields
            
            self.tableView2.reloadData()
        } else {
            slotsLabel.text = "Gadget Slots on Your Ship:"
            availableLabel.text = "Gadgets Available:"
            
            // populate current gadgets
            tableView1TextArray = []
            let gadgetSlotCount = player.commanderShip.gadgetSlots
            if gadgetSlotCount == 0 {
                tableView1TextArray.append("<Your Ship Has No Gadget Slots>")
            } else {
                // add gadget
                var slotNumber = 1
                for item in player.commanderShip.gadget {
                    tableView1TextArray.append("Slot \(slotNumber): \(item.name)")
                    slotNumber += 1
                }
                // add empty slots
                while (gadgetSlotCount + 1) > slotNumber {
                    tableView1TextArray.append("Slot \(slotNumber): <empty>")
                    slotNumber += 1
                }
            }
            self.tableView1.reloadData()
            
            // populate available gadgets
            
            self.tableView2.reloadData()
        }

    }
    
    
    // TABLE VIEW METHODS************************************************************************
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
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == tableView1 {
            
        } else {
            
        }
    }
    
}
