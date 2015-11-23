//
//  ShipDetailVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 11/23/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit


class ShipDetailVC: UIViewController {

    var ship: String!
    var typeOfShip: ShipType!
    var prototypeShip: SpaceShip!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var cargoLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var hullLabel: UILabel!
    @IBOutlet weak var weaponLabel: UILabel!
    @IBOutlet weak var shieldLabel: UILabel!
    @IBOutlet weak var gadgetLabel: UILabel!
    @IBOutlet weak var crewLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeVars()
        
        setData()
    }
    
    func setData() {
        
    }
    
    func initializeVars() {
        
        switch ship {
            case "Flea":
                typeOfShip = ShipType.Flea
            case "Gnat":
                typeOfShip = ShipType.Gnat
            case "Firefly":
                typeOfShip = ShipType.Firefly
            case "Mosquito":
                typeOfShip = ShipType.Mosquito
            case "Bumblebee":
                typeOfShip = ShipType.Bumblebee
            case "Beetle":
                typeOfShip = ShipType.Beetle
            case "Hornet":
                typeOfShip = ShipType.Hornet
            case "Grasshopper":
                typeOfShip = ShipType.Grasshopper
            case "Termite":
                typeOfShip = ShipType.Termite
            case "Wasp":
                typeOfShip = ShipType.Wasp
            default:
                print("unrecognized ship type")
        }
        
        prototypeShip = SpaceShip(type: typeOfShip, IFFStatus: IFFStatusType.Player)
    }

}
