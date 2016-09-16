//
//  LocationSearchViewModel.swift
//  WeatherApp
//
//  Created by igor on 7/29/16.
//  Copyright © 2016 igor. All rights reserved.
//

import UIKit

class LocationSearchViewModel: NSObject {
    let disposeBag = DisposeBag()

    var searchText = PublishSubject<String?>()

}
