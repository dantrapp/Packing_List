//
//  WeatherView.swift
//  Packing List
//
//  Created by Will Hustle on 1/7/20.
//  Copyright © 2020 Will Hustle. All rights reserved.
//

import SwiftUI

struct WeatherView: View {
    
    //bring in the weather view model w/ObservedObject
    @ObservedObject var weatherVM: WeatherViewModel
    
    //initialize the view model
    init(){
        self.weatherVM = WeatherViewModel()
    }
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 5){
          
            TextField("Enter City Name", text: self.$weatherVM.cityName){
                self.weatherVM.search()
            }.font(.custom("Arial", size: 50))
                .padding()
                .fixedSize()
                
           
            //display the weather
            Text(self.weatherVM.temperature)
            .font(.custom("Arial", size: 200))
            .foregroundColor(Color.white)
            .padding()
            .fixedSize()
            .offset(y: 100) //position the temp output
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }

}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
