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

var buySellCommodity: TradeItemType?
var buyAsOpposedToSell: Bool = true

// dummy data

