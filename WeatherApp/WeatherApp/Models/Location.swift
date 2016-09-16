//
//  Location.swift
//  WeatherApp
//
//  Created by igor on 6/22/16.
//  Copyright © 2016 igor. All rights reserved.
//

import Foundation

typealias responseKeys = Constants.AutoCompleteAPIResponseKeys

struct Location {
    var l: String?
    var ll: String?
    var zmw: String?
    var latitude: Double?
    var longitude: Double?
    var country: String?
    var name: String?
    var type: String?
    var timeZone: String?
    var timeZoneShort: String?
    init(apiResponse: Dictionary<String, AnyObject>) {
        self.l = apiResponse[responseKeys.l] as? String
        self.ll = apiResponse[responseKeys.ll] as? String
        self.zmw = apiResponse[responseKeys.zmw] as? String
        self.latitude = apiResponse[responseKeys.latitude] as? Double
        self.longitude = apiResponse[responseKeys.longitude] as? Double
        self.country = apiResponse[responseKeys.country] as? String
        self.name = apiResponse[responseKeys.name] as? String
        self.type = apiResponse[responseKeys.type] as? String
        self.timeZone = apiResponse[responseKeys.timeZone] as? String
        self.timeZoneShort = apiResponse[responseKeys.timeZoneShort] as? String
    }
    
    func readableName()->(String) {
        do {
        let regex = try NSRegularExpression(pattern: "([A-z]+)", options: .CaseInsensitive)
        let result = regex.firstMatchInString(self.name!, options: .WithoutAnchoringBounds, range: NSRange(location: 0, length: self.name!.characters.count))
            return self.name!.substringFromIndex(self.name!.startIndex.advancedBy((result?.range.location)!))
        } catch let error as NSError {
            print("regex error: \(error)")
            return ""
        }
    }
}