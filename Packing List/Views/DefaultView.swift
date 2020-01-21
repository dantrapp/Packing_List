//
//  DefaultView.swift
//  Packing List
//
//  Created by Will Hustle on 1/8/20.
//  Copyright © 2020 Will Hustle. All rights reserved.
//

import SwiftUI

struct DefaultView: View {
    
    @State var selected = 0
    
    var body: some View {
        TabView{
            TripPlanner()
                .tabItem {
                    Image(systemName:(selected == 1 ? "briefcase.fill" : "briefcase"))
                    Text("Trip Planner")
            }
            TripList()
                .tabItem {
                    Image(systemName:(selected == 2 ? "calendar.circle.fill" : "calendar.circle"))
                    Text("Upcoming Trips")
            }
            AddPeopleDisplay()
                .tabItem {
                    Image(systemName:(selected == 3 ? "person.badge.plus.fill" : "person.badge.plus"))
                    Text("Display People")
            }
            PeopleGoing(tripID: "811EDA3A-F4B5-4C8B-A30D-0E41385D9E98", destination: "London")
                          .tabItem {
                              Image(systemName:(selected == 4 ? "person.badge.plus.fill" : "person.badge.plus"))
                              Text("People Going")
                      }
                      
            
        }
    }
}

struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultView()
    }
}
