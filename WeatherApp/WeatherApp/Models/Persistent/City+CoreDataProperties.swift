//
//  City+CoreDataProperties.swift
//  WeatherApp
//
//  Created by igor on 6/22/16.
//  Copyright © 2016 igor. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension City {

    @NSManaged var coordinates: Coordinates?
    @NSManaged var country: String?
    @NSManaged var identifier: NSNumber?
    @NSManaged var name: String?

}
