//
//  UniversalGadget.swift
//  SpaceTrader
//
//  Created by Marc Auger on 12/1/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import Foundation
import UIKit

class UniversalGadget {
    var typeIndex: Int = 0          // 0 is weapon, 1 is shield, 2 is gadget
    var wType: WeaponType? = nil
    var sType: ShieldType? = nil
    var gType: GadgetType? = nil
    var weaponItem: Weapon? = nil
    var shieldItem: Shield? = nil
    var gadgetItem: Gadget? = nil
    
    var name: String = ""
    var price: Int = 0
    var sellPrice: Int = 0
    var techLevel: TechLevelType = TechLevelType.techLevel8
    var image: UIImage? = nil
    
    init(typeIndex: Int, wType: WeaponType?, sType: ShieldType?, gType: GadgetType?) {
        self.typeIndex = typeIndex
        self.wType = wType
        self.sType = sType
        self.gType = gType
        
        if wType != nil {
            self.weaponItem = Weapon(type: wType!)
            self.name = weaponItem!.name
            self.price = weaponItem!.price
            self.sellPrice = weaponItem!.sellPrice
            self.techLevel = weaponItem!.techLevel
            self.image = weaponItem!.image
        }
        if sType != nil {
            self.shieldItem = Shield(type: sType!)
            self.name = shieldItem!.name
            self.price = shieldItem!.price
            self.sellPrice = shieldItem!.sellPrice
            self.techLevel = shieldItem!.techLevel
            self.image = shieldItem!.image
        }
        if gType != nil {
            self.gadgetItem = Gadget(type: gType!)
            self.name = gadgetItem!.name
            self.price = gadgetItem!.price
            self.sellPrice = gadgetItem!.sellPrice
            self.techLevel = gadgetItem!.techLevel
            self.image = gadgetItem!.image
        }
    }
    
    
}