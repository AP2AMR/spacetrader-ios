//
//  Globals.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/18/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import Foundation

// these things should remain, but should not necessarily be populated, or should be populated with default values, with proper initialization to follow

var player = Commander(commanderName: "default", difficulty: DifficultyType.normal, pilotSkill: 1, fighterSkill: 1, traderSkill: 1, engineerSkill: 1)
var galaxy = Galaxy()

var currentSystem = StarSystem(
    name: "Daled",
    techLevel: TechLevelType.techLevel3,
    politics: PoliticsType.democracy,
    status: StatusType.employment,
    xCoord: 40,
    yCoord: 50,
    specialResources: SpecialResourcesType.richSoil,
    size: SizeType.Large)

var targetSystem = StarSystem(
    name: "Drema",
    techLevel: TechLevelType.techLevel5,
    politics: PoliticsType.technocracy,
    status: StatusType.none,
    xCoord: 63,
    yCoord: 4,
    specialResources:
    SpecialResourcesType.none,
    size: SizeType.Medium)

var systemsInRange: [StarSystem] = []

var buySellCommodity: TradeItemType?
var buyAsOpposedToSell: Bool = true


// settable constants:

let MAXSOLARSYSTEM = 119
let MAXWORMHOLE = 6
let MINDISTANCE = 6
let CLOSEDISTANCE = 13
let GALAXYWIDTH = 150
let GALAXYHEIGHT = 110

let ACAMARSYSTEM = 0
let BARATASSYSTEM = 6
let DALEDSYSTEM = 17
let DEVIDIASYSTEM = 22
let GEMULONSYSTEM = 32
let JAPORISYSTEM = 41
let KRAVATSYSTEM = 50
let MELINASYSTEM = 59
let NIXSYSTEM = 67
let OGSYSTEM = 70
let REGULASSYSTEM = 82
let SOLSYSTEM = 92
let UTOPIASYSTEM = 109
let ZALKONSYSTEM = 118

// utilities
// arc4rand sucks. Let's fix it.
// rand is inclusive on the lower bound, exclusive on the upper.
func rand(max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max)))
}

func rand(max: Int, min: Int) -> Int {
    let maxUInt = UInt32(max)
    let minUInt = UInt32(min)
    return Int(arc4random_uniform(maxUInt - minUInt) + minUInt)
}

func randDouble(max: Double, min: Double) -> Double {
    let maxUInt = UInt32(max * 100)
    let minUInt = UInt32(min * 100)
    let resultInt = Int(arc4random_uniform(maxUInt - minUInt) + minUInt)
    let resultDouble = Double(resultInt)
    return (resultDouble / 100)
}

func getTechLevelInt(techLevel: TechLevelType) -> Int {
    switch techLevel {
        case .techLevel0:
            return 0
        case .techLevel1:
            return 1
        case .techLevel2:
            return 2
        case .techLevel3:
            return 3
        case .techLevel4:
            return 4
        case .techLevel5:
            return 5
        case .techLevel6:
            return 6
        case .techLevel7:
            return 7
        case .techLevel8:
            return 8
    }
}
