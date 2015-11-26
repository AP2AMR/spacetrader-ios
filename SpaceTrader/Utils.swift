//
//  Utils.swift
//  SpaceTrader
//
//  Created by Marc Auger on 11/25/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import Foundation

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