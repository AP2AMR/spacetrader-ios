//
//  EquipmentListVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 11/9/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class EquipmentListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var availableTableView: UITableView!
    
    let weaponsArray: [WeaponType] = [WeaponType.pulseLaser, WeaponType.beamLaser, WeaponType.militaryLaser, WeaponType.photonDisruptor]
    let shieldsArray: [ShieldType] = [ShieldType.energyShield, ShieldType.reflectiveShield]
    let gadgetsArray: [GadgetType] = [GadgetType.CargoBays, GadgetType.AutoRepair, GadgetType.Navigation, GadgetType.Targeting, GadgetType.Cloaking]
    
    let universalArray: [UniversalGadgetType] = [UniversalGadgetType.pulseLaser, UniversalGadgetType.beamLaser, UniversalGadgetType.militaryLaser, UniversalGadgetType.photonDisruptor, UniversalGadgetType.energyShield, UniversalGadgetType.reflectiveShield, UniversalGadgetType.CargoBays, UniversalGadgetType.AutoRepair, UniversalGadgetType.Navigation, UniversalGadgetType.Targeting, UniversalGadgetType.Cloaking]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.availableTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CustomCell")
    }

    @IBAction func done(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.items.count
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: BuyEquipmentCell = self.availableTableView.dequeueReusableCellWithIdentifier("CustomCell")! as! BuyEquipmentCell
        let item = self.universalArray[indexPath.row]
        cell.setCell(item)
        
        return cell

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print("You selected cell #\(indexPath.row)!")
        chosenShip = items[indexPath.row]
        chosenShipType = ships[indexPath.row]
        print("You selected \(chosenShip)")
        performSegueWithIdentifier("shipDetail", sender: chosenShip)
    }
    
}
