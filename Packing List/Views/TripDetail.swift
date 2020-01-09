//
//  ContentView.swift
//  Packing List
//
//  Created by Will Hustle on 12/24/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

//use TripID to identify trip by number


struct TripDetail: View {
    
    
    
    @State var categories = ["Clothing", "Important Documents", "Toiletries", "Health", "Essentials", "Electronics", "Accessories"]
    
    var body: some View {
        

        VStack {
            
            ZStack {
                //add text overlay for Destination + Travel Dates
                
                //Text(city, departureDate)
                
                //grab image based on tripID
                Image( "fijiHut").resizable().aspectRatio(contentMode: .fill).blur(radius: 0.4).opacity(0.7).frame(height: 200)
                
                
            }.edgesIgnoringSafeArea(.all)
            
            
            
            //If people going..
            VStack {
                Text("People Going")
                
                HStack {
                    Spacer()
                    Image(systemName: "person")
                    Text("Jessica | Edit")
                    Spacer()
                }
                
             
                
     
            }
            
            
            Spacer()
            
            
        }
        
        
        
    }
    
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TripDetail()
    }
}
