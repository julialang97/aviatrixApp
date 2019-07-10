//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    
    var running = false
    var author = ""
    var location = ""
    var distanceTraveled = 0
    
    var maxFuel = 10000.0
    var fuelLevel = 10000.0
    var milesPerGallon = 0.4
    var fuelCost = 0.00
    
    init(authorName : String, planeLocation : String) {
        author = authorName
        location = planeLocation
        
    }
    
    func start() -> Bool {
        running = true
        return running
    }
    
    func refuel() -> Double {
        var filled = maxFuel - fuelLevel
        fuelLevel = maxFuel
        fuelCost = filled*(AviatrixData().fuelPrices[plane.location]!)
        return filled
    }
    
    func flyTo(destination : String) {
        distanceTraveled = distanceTraveled + distanceTo(target: destination, currentLocation: location)
        fuelLevel = (fuelLevel) - Double(distanceTo(target: destination, currentLocation: location)) / milesPerGallon
        location = destination
        
    }
    
    func distanceTo(target : String, currentLocation : String) -> Int {
        return AviatrixData().knownDistances[currentLocation]![target]!
    
    }
    
    func knownDestinations() -> [String] {
        return ["St. Louis", "Phoenix", "Denver", "SLC", "SF"]
        
    }
}
