//
//  Enums.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/7/15.
//  Copyright (c) 2015 Marc Auger. All rights reserved.
//

import Foundation

enum TechLevelType: String {
    case TechLevel0 = "Pre-agricultural"
    case TechLevel1 = "Agricultural"
    case TechLevel2 = "Medieval"
    case TechLevel3 = "Renaissance"
    case TechLevel4 = "Early Industrial"
    case TechLevel5 = "Industrial"
    case TechLevel6 = "Post-industrial"
    case TechLevel7 = "Hi-tech"
}

enum Status: String {
    case none = "under no particular pressure"
    case war = "at war"
    case plague = "ravaged by a plague"
    case drought = "suffering from a drought"
    case boredom = "suffering from extreme boredom"
    case cold = "suffering from a cold spell"
    case cropFailure = "suffering from a crop failure"
    case employment = "lacking enough workers"
}