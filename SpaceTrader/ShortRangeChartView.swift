//
//  ShortRangeChartView.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/5/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class ShortRangeChartView: UIView {
    let pointsPerParsec: CGFloat = 5
    let circleColor = UIColor.blackColor()
    
    var locationOfCurrentPlanet: CGPoint {
        get {
            return convertPoint(center, fromCoordinateSpace: superview!)
        }
    }
    
    var rangeCircleRadius: CGFloat {
        return CGFloat(player.commanderShip.fuelTanks) * pointsPerParsec
    }
    
    override func drawRect(rect: CGRect) {
        let rangeCirclePath = UIBezierPath(arcCenter: locationOfCurrentPlanet, radius: rangeCircleRadius, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true)
        rangeCirclePath.lineWidth = 1
        circleColor.set()
        rangeCirclePath.stroke()
        
        // populate planets
        
        // test structure for displaying planet name
        drawPlanetCircle(locationOfCurrentPlanet, visited: true)
        let nameLocationX: CGFloat = locationOfCurrentPlanet.x - 15
        let nameLocationY: CGFloat = locationOfCurrentPlanet.y - 20
        let nameLocation = CGPointMake(nameLocationX, nameLocationY)
        let text = NSAttributedString(string: galaxy.currentSystem!.name)
        text.drawAtPoint(nameLocation)
        
        
        for planet in galaxy.planets {
            drawPlanet(planet)
        }
        
        // let x = galaxy.currentSystem!.xCoord + 5
        // let y = galaxy.currentSystem!.yCoord + 7
        
        // let testPlanet = StarSystem(name: "test", techLevel: TechLevelType.techLevel4, politics: PoliticsType.socialist, status: StatusType.none, xCoord: x, yCoord: y, specialResources: SpecialResourcesType.none, size: SizeType.Small)
        // drawPlanet(testPlanet)
    }
    
    
    
    func drawPlanet(system: StarSystem) {
        let currentSystemMapXCoord: CGFloat = locationOfCurrentPlanet.x
        let currentSystemMapYCoord: CGFloat = locationOfCurrentPlanet.y
        
        let xDifference: CGFloat = CGFloat(galaxy.currentSystem!.xCoord) - CGFloat(system.xCoord)
        let yDifference: CGFloat = CGFloat(galaxy.currentSystem!.yCoord) - CGFloat(system.yCoord)
        
        let xCoord: CGFloat = currentSystemMapXCoord + (xDifference * CGFloat(pointsPerParsec))
        let yCoord: CGFloat = currentSystemMapYCoord + (yDifference * CGFloat(pointsPerParsec))
        
        print("************************************************************")
        print("second planet: \(system.name)")
        print("DEBUG DRAW currentSystem: galaxy xCoord: \(galaxy.currentSystem!.xCoord)")
        print("DEBUG DRAW currentSystem: galaxy yCoord: \(galaxy.currentSystem!.yCoord)")
        print("DEBUG DRAW currentSystem: map xCoord: \(currentSystemMapXCoord)")
        print("DEBUG DRAW currentSystem: map yCoord: \(currentSystemMapYCoord)")
        
        print("DEBUG DRAW second planet: galaxy xCoord: \(system.xCoord)")
        print("DEBUG DRAW second planet: galaxy yCoord: \(system.yCoord)")
        print("DEBUG DRAW second planet: map xCoord: \(xCoord)")
        print("DEBUG DRAW second planet: map yCoord: \(yCoord)")

        let location = CGPointMake(xCoord, yCoord)
        let visited: Bool = system.visited
        
        drawPlanetCircle(location, visited: visited)
    }
    
    // make function to draw planet, given StarSystem. Draws from planet info to determine if visited or has wormhole. Early version could take coordinates, specs from arguments.
    // locations are relative to current planet
    func drawPlanetCircle(location: CGPoint, visited: Bool) {
        let planetRadius = CGFloat(4)
        //let location = CGPointMake(xCoord, yCoord)
        let planetCircle = UIBezierPath(arcCenter: location, radius: planetRadius, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true)
        let unvisitedColor: UIColor = UIColor.greenColor()
        let visitedColor: UIColor = UIColor.blueColor()
        
        if visited == true {
            visitedColor.set()
        } else {
            unvisitedColor.set()
        }
        
        planetCircle.stroke()
        planetCircle.fill()
    }
}
