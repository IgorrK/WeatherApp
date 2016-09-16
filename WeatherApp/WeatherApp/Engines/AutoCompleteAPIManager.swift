//
//  AutoCompleteAPIManager.swift
//  WeatherApp
//
//  Created by igor on 6/22/16.
//  Copyright © 2016 igor. All rights reserved.
//

import UIKit
import Alamofire

class AutoCompleteAPIManager: NSObject {
    typealias Success = (AnyObject?) -> Void
    typealias Failure = (NSError?) -> Void
    
    private static let baseUrl = "http://autocomplete.wunderground.com/aq?query="
    static let sharedInstance = AutoCompleteAPIManager()
    
    func autocompleteQuery(query: String, success: Success, failure: Failure) -> Void {
        let query = AutoCompleteAPIManager.baseUrl + query.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!
        Alamofire.request(.GET, query).responseJSON(completionHandler: {responseData in
            guard let error = responseData.result.error else {
                success(responseData.result.value)
                return
            }
            failure(error)
        })
    }
}
