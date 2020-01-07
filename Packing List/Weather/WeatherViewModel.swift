//
//  WeatherViewModel.swift
//  Packing List
//
//  Created by Will Hustle on 1/7/20.
//  Copyright © 2020 Will Hustle. All rights reserved.
//

import Foundation
import Combine

//create view model class with observable object

class WeatherViewModel: ObservableObject{
    
    private var weatherService: WeatherService!
    
    //publish weather event to all subscribers
    @Published var weather = Weather()
    
    //initialize weatherService
    init() {
        self.weatherService = WeatherService()
    }
    
    var temperature : String {
        if let temp = self.weather.temp {
            return String(format: "%.0f", temp)
        }else{
            return ""
        }
    }
    
    var humidity : String {
          if let humidity = self.weather.humidity {
              return String(format: "%.0f", humidity)
          }else{
              return ""
          }
      }
    
    //create search function
    
    var cityName : String = ""
    
    func search(){
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            fetchWeather(by: city)
        }
    }
    
    //fetch weather
    private func fetchWeather(by city: String){
        
        self.weatherService.getWeather(city: city) { weather in
            if let weather = weather {
                
                //publish on main thread
                DispatchQueue.main.async {
                     self.weather = weather
                }
               
                
            }
        }
    }
    
}
