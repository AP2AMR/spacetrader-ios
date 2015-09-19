//
//  Globals.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/18/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import Foundation

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

// dummy data

