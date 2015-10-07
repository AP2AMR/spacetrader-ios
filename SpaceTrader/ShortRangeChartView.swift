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
    var wormholeAsOpposedToPlanet = false
    
    let pointsPerParsec: CGFloat = 6
    let circleColor = UIColor.blackColor()
    
    var locationOfCurrentPlanet: CGPoint {
        get {
            return convertPoint(center, fromCoordinateSpace: superview!)
        }
    }
    
    var rangeCircleRadius: CGFloat {
        return CGFloat(player.commanderShip.fuel) * pointsPerParsec
    }
    
    override func drawRect(rect: CGRect) {
        
        let rangeCirclePath = UIBezierPath(arcCenter: locationOfCurrentPlanet, radius: rangeCircleRadius, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true)
        rangeCirclePath.lineWidth = 1
        circleColor.set()
        rangeCirclePath.stroke()
        
        // populate planets
        planetsOnMap = []                       // IMPORTANT: CLEAR PLANETSONMAP AS PART OF REFRESH
        for planet in galaxy.planets {
            drawPlanet(planet)
        }
        //print("[after big drawPlanet loop] planetsOnMap.count: \(planetsOnMap.count)")
        //print("there should be something here: \(planetsOnMap[0].system.name)")
    }
    
    
    
    func drawPlanet(system: StarSystem) {
        //print("DRAW PLANET BEING CALLED")
        
        let currentSystemMapXCoord: CGFloat = locationOfCurrentPlanet.x
        let currentSystemMapYCoord: CGFloat = locationOfCurrentPlanet.y
        
        let xDifference: CGFloat = CGFloat(galaxy.currentSystem!.xCoord) - CGFloat(system.xCoord)
        let yDifference: CGFloat = CGFloat(galaxy.currentSystem!.yCoord) - CGFloat(system.yCoord)
        
        let xCoord: CGFloat = currentSystemMapXCoord + (xDifference * CGFloat(pointsPerParsec))
        let yCoord: CGFloat = currentSystemMapYCoord + (yDifference * CGFloat(pointsPerParsec))

        let location = CGPointMake(xCoord, yCoord)
        let visited: Bool = system.visited
        
        var add = false
        // draw only if on the map and not on the edge
        if isItOnTheMap(xCoord, yCoord: yCoord) {
            add = true
        } else {        // KLUDGE FIX--hopefully eliminate need for this?
            for systemInRange in galaxy.systemsInRange {
                if system.name == systemInRange.name {
                    add = true
                }
            }
        }
        
        if add {
            drawPlanetCircle(location, visited: visited, wormhole: system.wormhole)
            
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
   
        // draw target crosshairs--non wormhole edition
        if system.name == galaxy.targetSystem!.name {
            let mostRecentPlanet = planetsOnMap.last
           
//            if !wormholeAsOpposedToPlanet {
//                drawTargetCrosshairs(mostRecentPlanet!, wormhole: false)
//                print("target system: \(galaxy.targetSystem!.name)")
//                redrawSelf()
//            } else {
//                drawTargetCrosshairs(mostRecentPlanet!, wormhole: true)
//                wormholeAsOpposedToPlanet = false
//                // proceed with caution
//                galaxy.targetSystem = mostRecentPlanet?.system.wormholeDestination
//                print("target system: \(galaxy.targetSystem!.name)")
//                redrawSelf()        // necessary?
//            } 
            
            
            //drawTargetCrosshairs(mostRecentPlanet!, wormhole: false)
            
            if !wormholeAsOpposedToPlanet {
                drawTargetCrosshairs(mostRecentPlanet!, wormhole: false)
            } else {
                drawTargetCrosshairs(mostRecentPlanet!, wormhole: true)
                wormholeAsOpposedToPlanet = false
            }
        }
        
//        print("cycling through systems to draw crosshairs")
//        for planet in planetsOnMap {
//            if planet.system.name == galaxy.targetSystem!.name {
//                
//                // IMPLEMENT LESS DYSFUNCTIONAL VERSION OF BELOW
//                
////                if !wormholeAsOpposedToPlanet {
////                    drawTargetCrosshairs(planet, wormhole: false)
////                } else {
////                    drawTargetCrosshairs(planet, wormhole: true)
////                    wormholeAsOpposedToPlanet = false
////                }    
//            }
//        }
     
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.locationInView(self)
        //print(touchLocation)
        
        // identify planet in mapPlanet that was touched
        for mapPlanet in planetsOnMap {
            
            let distance = distanceFromTouchToPlanet(touchLocation, planet: mapPlanet)
            // print("planet: \(mapPlanet.system.name), distance: \(distance)")
            if distance < 20 {
                //print("touch recorded near a planet")
                //print("\(mapPlanet.system.name) touched")
                
                if mapPlanet.system.wormhole {
                    //print("THIS PLANET HAS A WORMHOLE")
                    
                    let wormholePoint = CGPoint(x: mapPlanet.mapLocation.x + 10, y: mapPlanet.mapLocation.y)
                    let tapDistanceFromWormhole = distanceFromTouchToPoint(touchLocation, point: wormholePoint)
                    //print("distance to planet: \(distance), distance to wormhole: \(tapDistanceFromWormhole)")
                    if tapDistanceFromWormhole < distance {
                        //print("TOUCH IS CLOSER TO WORMHOLE")
                        // set target system to wormhole planet, draw crosshairs on wormhole, redraw
                        galaxy.targetSystem = mapPlanet.system.wormholeDestination
                        wormholeAsOpposedToPlanet = true
                        delegate?.targetSystemDidChange()
                        
                        
                    } else {
                        //print("TOUCH IS CLOSER TO PLANET")
                        // do usual thing
                        galaxy.targetSystem = mapPlanet.system
                        wormholeAsOpposedToPlanet = false
                        delegate?.targetSystemDidChange()
                        
                        // must fix whether drawPlanetWithCrosshairs is called. Not called here, even though planet has one
                    }
                    
                }
                //print("setting target system")
                galaxy.targetSystem = mapPlanet.system
                delegate?.targetSystemDidChange()

                self.setNeedsDisplay()
            }
        }
        
        
    }
    
    // make function to draw planet, given StarSystem. Draws from planet info to determine if visited or has wormhole. Early version could take coordinates, specs from arguments.
    // locations are relative to current planet
    func drawPlanetCircle(location: CGPoint, visited: Bool, wormhole: Bool) {
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
        
        // draw wormhole, if necessary
        if wormhole {
            let wormholeDrawLocationX = location.x + 10
            let wormholeDrawLocationY = location.y
            let wormholeDrawLocation = CGPoint(x: wormholeDrawLocationX, y: wormholeDrawLocationY)
            let wormholeCircle = UIBezierPath(arcCenter: wormholeDrawLocation, radius: planetRadius, startAngle: 0, endAngle: CGFloat(2*M_PI), clockwise: true)
            UIColor.redColor().setStroke()
            UIColor.whiteColor().setFill()
            wormholeCircle.stroke()
            
            // maybe make this a smaller circle with a thicker stroke?
        }
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
    
    func distanceFromTouchToPoint(touchLocation: CGPoint, point: CGPoint) -> CGFloat {
        let xDistance = abs(touchLocation.x - point.x)
        let yDistance = abs(touchLocation.y - point.y)
        let distance = sqrt((xDistance * xDistance) + (yDistance * yDistance))
        return distance
    }
    
    // THIS IS CURRENTLY UNUSED
//    func redrawTarget() {
//        // remove old target indicator
//        
//        for system in planetsOnMap {
//            drawTargetCrosshairs(system, wormhole: false)
//        }
//    }
    
    func drawTargetCrosshairs(planetOnMap: mapPlanet, wormhole: Bool) {
        var planetZeroX = planetOnMap.mapLocation.x
        let planetZeroY = planetOnMap.mapLocation.y
        
        if wormhole {
            planetZeroX += 10
        }
        
        
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
    
    func redrawSelf() {
        self.setNeedsDisplay()
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
