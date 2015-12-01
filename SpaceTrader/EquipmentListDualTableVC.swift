//
//  EquipmentListDualTableVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 12/1/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class EquipmentListDualTableVC: UIViewController {

    //let universalArray: [UniversalGadgetType] = [UniversalGadgetType.pulseLaser, UniversalGadgetType.beamLaser, UniversalGadgetType.militaryLaser, UniversalGadgetType.photonDisruptor, UniversalGadgetType.energyShield, UniversalGadgetType.reflectiveShield, UniversalGadgetType.CargoBays, UniversalGadgetType.AutoRepair, UniversalGadgetType.Navigation, UniversalGadgetType.Targeting, UniversalGadgetType.Cloaking]
    
    let weaponsArray: [WeaponType] = [WeaponType.pulseLaser, WeaponType.beamLaser, WeaponType.militaryLaser, WeaponType.photonDisruptor]
    let shieldsArray: [ShieldType] = [ShieldType.energyShield, ShieldType.reflectiveShield]
    let gadgetsArray: [GadgetType] = [GadgetType.CargoBays, GadgetType.AutoRepair, GadgetType.Navigation, GadgetType.Targeting, GadgetType.Cloaking]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func initialize
}
