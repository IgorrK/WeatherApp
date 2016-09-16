//
//  Constants.swift
//  WeatherApp
//
//  Created by igor on 6/22/16.
//  Copyright © 2016 igor. All rights reserved.
//

import Foundation

struct Constants {
    
    struct DictionaryKeys {
        struct Coordinates {
            static let rawValue = "coord"
            static let Latitude = "lat"
            static let Longitude = "lon"
        }
        static let Identifier = "_id"
        static let Country = "country"
        static let Name = "name"
    }
    
    struct AutoCompleteAPIResponseKeys {
        static let results = "RESULTS"
        static let l = "l"
        static let ll = "LL"
        static let zmw = "zmw"
        static let latitude = "lat"
        static let longitude = "lon"
        static let country = "c"
        static let name = "name"
        static let type = "type"
        static let timeZone = "tz"
        static let timeZoneShort = "tzs"
    }
}

