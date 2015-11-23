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
    
    var price: Int = 0
    
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
    
    @IBOutlet weak var buyButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeVars()
        
        setData()
        
        // handle not for sale
        // handle player can't afford
    }
    
    @IBAction func buy(sender: AnyObject) {
        // check if enough money
        
        // alert asking of user wants to buy
    }
    
    
    func setData() {
        
        switch typeOfShip! {
            case ShipType.Flea:
                image.image = UIImage(named: "ship0")
            case ShipType.Gnat:
                image.image = UIImage(named: "ship1")
            case ShipType.Firefly:
                image.image = UIImage(named: "ship2")
            case ShipType.Mosquito:
                image.image = UIImage(named: "ship3")
            case ShipType.Bumblebee:
                image.image = UIImage(named: "ship4")
            case ShipType.Beetle:
                image.image = UIImage(named: "ship5")
            case ShipType.Hornet:
                image.image = UIImage(named: "ship6")
            case ShipType.Grasshopper:
                image.image = UIImage(named: "ship7")
            case ShipType.Termite:
                image.image = UIImage(named: "ship8")
            case ShipType.Wasp:
                image.image = UIImage(named: "ship9")
            default:
                print("error")
        }
        
        nameLabel.text = prototypeShip.name
        sizeLabel.text = prototypeShip.size
        cargoLabel.text = "\(prototypeShip.cargoBays)"
        rangeLabel.text = "\(prototypeShip.fuelTanks) parsecs"
        hullLabel.text = "\(prototypeShip.hullStrength)"
        weaponLabel.text = "\(prototypeShip.weaponSlots)"
        shieldLabel.text = "\(prototypeShip.shieldSlots)"
        gadgetLabel.text = "\(prototypeShip.gadgetSlots)"
        crewLabel.text = "\(prototypeShip.crewQuarters)"
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .DecimalStyle
        let priceFormatted = numberFormatter.stringFromNumber(price)
        priceLabel.text = "\(priceFormatted!) credits"
        
        let controlState = UIControlState()
        buyButton.setTitle("Buy \(ship)", forState: controlState)
        
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
        
        price = prototypeShip.price
        price -= player.commanderShip.value
    }

}
