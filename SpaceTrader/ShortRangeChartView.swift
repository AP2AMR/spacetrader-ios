//
//  ShortRangeChartView.swift
//  SpaceTrader
//
//  Created by Marc Auger on 10/5/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

protocol ShortRangeChartDelegate: class {
    func targetSystemDidChange()
}

class ShortRangeChartView: UIView {
    weak var delegate: ShortRangeChartDelegate?
    
    var planetsOnMap: [mapPlanet] = []
    
    let pointsPerParsec: CGFloat = 7
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
        
        // draw only if on the map and not on the edge
        if isItOnTheMap(xCoord, yCoord: yCoord) {
            drawPlanetCircle(location, visited: visited)
            
            // add name
            let nameLocationX: CGFloat = xCoord - 15
            let nameLocationY: CGFloat = yCoord - 20
            let nameLocation = CGPointMake(nameLocationX, nameLocationY)
            let text = NSAttributedString(string: system.name)
            text.drawAtPoint(nameLocation)
            
            // add to planetsOnMap
            let mapEntry = mapPlanet(system: system, mapLocation: location)
            planetsOnMap.append(mapEntry)
        }
        
        // draw target crosshairs
        for planet in planetsOnMap {
            if planet.system.name == galaxy.targetSystem!.name {
                print("target system found")
                drawTargetCrosshairs(planet)
            }
        }
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // print("view touched!")
        let touch = touches.first!
        let touchLocation = touch.locationInView(self)
        // print(touchLocation)
        
        // identify planet in mapPlanet that was touched
        for mapPlanet in planetsOnMap {
            let distance = distanceFromTouchToPlanet(touchLocation, planet: mapPlanet)
            // print("planet: \(mapPlanet.system.name), distance: \(distance)")
            if distance < 20 {
                print("\(mapPlanet.system.name) touched")
                galaxy.targetSystem = mapPlanet.system
                print("new target system: \(galaxy.targetSystem!.name)")
                delegate?.targetSystemDidChange()
                // now, must redraw warp page to show new target system
                // must also indicate graphically that system is highlighted
                //redrawTarget()
                self.setNeedsDisplay()
            }
        }
        
        
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
    
    func isItOnTheMap(xCoord: CGFloat, yCoord: CGFloat) -> Bool {
     
        var xOk = false
        var yOk = false
        if xCoord > 20 && xCoord < (self.frame.width - 20) {
            xOk = true
        }
        if yCoord > 20 && yCoord < (self.frame.height - 20) {
            yOk = true
        }
        
        if xOk && yOk {
            return true
        }
        return false
    }
    
    func distanceFromTouchToPlanet(touchLocation: CGPoint, planet: mapPlanet) -> CGFloat {
        let xDistance = abs(touchLocation.x - planet.mapLocation.x)
        let yDistance = abs(touchLocation.y - planet.mapLocation.y)
        let distance = sqrt((xDistance * xDistance) + (yDistance * yDistance))
        return distance
    }
    
    func redrawTarget() {
        // remove old target indicator
        
        for system in planetsOnMap {
            drawTargetCrosshairs(system)
        }
    }
    
    func drawTargetCrosshairs(planetOnMap: mapPlanet) {
        let planetZeroX = planetOnMap.mapLocation.x
        let planetZeroY = planetOnMap.mapLocation.y
        
        let upperTick = UIBezierPath()
        upperTick.moveToPoint(CGPoint(x: planetZeroX, y: planetZeroY - 5))
        upperTick.addLineToPoint(CGPoint(x: planetZeroX, y: planetZeroY - 8))
        upperTick.lineWidth = 2.0
        UIColor.blackColor().setStroke()
        upperTick.stroke()
        
        let lowerTick = UIBezierPath()
        lowerTick.moveToPoint(CGPoint(x: planetZeroX, y: planetZeroY + 5))
        lowerTick.addLineToPoint(CGPoint(x: planetZeroX, y: planetZeroY + 10))
        lowerTick.lineWidth = 2.0
        UIColor.blackColor().setStroke()
        lowerTick.stroke()
        
        let rightTick = UIBezierPath()
        rightTick.moveToPoint(CGPoint(x: planetZeroX + 5, y: planetZeroY))
        rightTick.addLineToPoint(CGPoint(x: planetZeroX + 10, y: planetZeroY))
        rightTick.lineWidth = 2.0
        UIColor.blackColor().setStroke()
        rightTick.stroke()
        
        let leftTick = UIBezierPath()
        leftTick.moveToPoint(CGPoint(x: planetZeroX - 5, y: planetZeroY))
        leftTick.addLineToPoint(CGPoint(x: planetZeroX - 10, y: planetZeroY))
        leftTick.lineWidth = 2.0
        UIColor.blackColor().setStroke()
        leftTick.stroke()
    }
}

class mapPlanet {
    let system: StarSystem
    let mapLocation: CGPoint
    
    init(system: StarSystem, mapLocation: CGPoint) {
        self.system = system
        self.mapLocation = mapLocation
    }
}
