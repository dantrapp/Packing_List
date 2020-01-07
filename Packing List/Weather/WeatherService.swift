//
//  WeatherService.swift
//  Packing List
//
//  Created by Will Hustle on 1/7/20.
//  Copyright © 2020 Will Hustle. All rights reserved.
//

import Foundation

//create weather service class

class WeatherService{
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=5e18c62f8861600901ac81a5958be988&units=imperial") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else{
                completion(nil)
                return
            }
            
            //decode the response (with optional try)
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            //unwrap optional response
            
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
            
        }.resume() //make the request!
    }
}
