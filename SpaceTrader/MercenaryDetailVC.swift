//
//  MercenaryDetailVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 12/2/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class MercenaryDetailVC: UIViewController {

    var selectedMercenary: CrewMember?
    var hireNotFire: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("name: \(selectedMercenary!.name), hireNotFire: \(hireNotFire!)")
    }


}
