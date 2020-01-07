//
//  WeatherModel.swift
//  Packing List
//
//  Created by Will Hustle on 1/7/20.
//  Copyright © 2020 Will Hustle. All rights reserved.
//

import Foundation


//dark sky api key: 0e513c802c34563b76f996b9404ae593

//open weather api key: 5e18c62f8861600901ac81a5958be988

struct WeatherResponse: Decodable{
    var main: Weather //map to main key
}

struct Weather: Decodable{
    var temp: Double?
    var humidity: Double?
}
