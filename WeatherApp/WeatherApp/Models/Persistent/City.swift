//
//  City.swift
//  WeatherApp
//
//  Created by igor on 6/22/16.
//  Copyright © 2016 igor. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Coordinates : NSObject, NSCoding {
    let latitude : Double
    let longitude : Double
    init(lat: Double, long : Double) {
        self.latitude = lat
        self.longitude = long
    }
    required init?(coder aDecoder: NSCoder) {
        self.latitude = aDecoder.decodeDoubleForKey(Constants.DictionaryKeys.Coordinates.Latitude)
        self.longitude = aDecoder.decodeDoubleForKey(Constants.DictionaryKeys.Coordinates.Longitude)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeDouble(self.latitude, forKey: Constants.DictionaryKeys.Coordinates.Latitude)
        aCoder.encodeDouble(self.longitude, forKey: Constants.DictionaryKeys.Coordinates.Longitude)
    }
    
    
    
}

class City: NSManagedObject {
    static private let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    static func entityName() -> String {
        return "City"
    }
    
    static func storeCityWithParameters(parameters: Dictionary<String, AnyObject>) -> City {
        
        let newCity = NSEntityDescription.insertNewObjectForEntityForName(City.entityName(), inManagedObjectContext: City.managedObjectContext) as! City
        let coordinatesDict = parameters[Constants.DictionaryKeys.Coordinates.rawValue] as? [String : AnyObject]
        
        let coordinates = Coordinates(lat: coordinatesDict![Constants.DictionaryKeys.Coordinates.Latitude]!.doubleValue,
                                      long: coordinatesDict![Constants.DictionaryKeys.Coordinates.Longitude]!.doubleValue)
        newCity.coordinates = coordinates
        newCity.identifier = parameters[Constants.DictionaryKeys.Identifier] as? NSNumber
        newCity.country = parameters[Constants.DictionaryKeys.Country] as? String
        newCity.name = parameters[Constants.DictionaryKeys.Name] as? String
//        print(newCity.description)
        do {
            try City.managedObjectContext.save()
//            print(newCity.description)
        } catch let error as NSError {
            print("error saving city: \(error)")
        }
        return newCity
    }
}
