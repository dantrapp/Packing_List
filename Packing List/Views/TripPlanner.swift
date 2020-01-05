//
//  TripPlanner.swift
//  Packing List
//
//  Created by Will Hustle on 12/24/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct TripPlanner: View {
    
    //OPEN CORE DATA
    @Environment(\.managedObjectContext) var moc
    
    
    //CAPTURE FOR CORE DATA
    
    
    //TRAVEL DATES
    @State var departureDate = Date()
    @State var returnDate = Date()
    
    //DESTINATION
    @State var destination = ""
    
    
    //PEOPLE GOING
    @State var numberOfPeople = 0
    
    //TRAVEL DURATION
    @State var currentDate = Date()
    @State var untilTrip = 0
    
    //TRANSPORTATION TYPE
    @State var transportation : String = ""
    let transportationType = ["Airplane ✈️", "Car 🚗", "Train 🚆", "Bus 🚌", "Cruise 🛳"]
    
    //TRAVEL TYPE
    @State var typeOfTravel : String = ""
    let travelType = ["Business 📊", "Personal 🏝"]
    
    //date formatter i.e. December 21, 2019
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    
    
    var body: some View {
        
        
        //select number of people
        NavigationView {
            Form {
                //destination
                Section(header: Text("Where Do You Want To Go?")){
                    TextField("Enter Your Destination", text: $destination)
                }
                
                //travel dates
                Section(header: Text("Select Travel Dates")){
                    DatePicker("Please Select Your Travel Dates", selection: $departureDate,in: Date()...,  displayedComponents: .date)
                        .labelsHidden()
                    
                }
                
                Section(header: Text("Choose Your Return Date")) {
                    DatePicker("Please Select Your Travel Dates", selection: $returnDate,in: Date()...,  displayedComponents: .date)
                        .labelsHidden()
                    
                }
                
                Section{
                    Picker("Select The Number Of People Going", selection: $numberOfPeople){
                        ForEach(1..<20){
                            Text("\($0) People")
                        }
                        
                    }
                    
                }
                Section(header: Text("Select Type Of Transportation")){
                    Picker("Select Type Of Transportation", selection: $transportation){
                        ForEach(transportationType, id: \.self) {
                            Text($0)
                        }
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                Section(header: Text("Select Reason For Travel")){
                    Picker("Select Reason For Travel", selection: $typeOfTravel){
                        ForEach(travelType, id: \.self) {
                            Text($0)
                        }
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section {
                    VStack{
                        HStack{
                            Spacer() //center button
                            //                            NavigationLink(destination: TripTesting()){
                            Button(("Save Trip ✅")) {
                                let addTrip = PackingList(context: self.moc)
                                
                                addTrip.tripID = UUID()
                                
                                addTrip.destination = self.destination
                                
                                addTrip.departureDate = self.departureDate
                                
                                addTrip.returnDate = self.returnDate
                                addTrip.transportationType = self.transportation
                                
                                addTrip.travelType = self.typeOfTravel
                                
                                addTrip.numberOfPeople = Int32(self.numberOfPeople)
                                
                                //save the data
                                try? self.moc.save()
                            }
                            .disabled(destination.isEmpty)
                            .frame(width: 250,height:50).background(Color.blue) .foregroundColor(Color.white)
                            
                            Spacer() //center button
                            
                            
                            
                            //                            }
                            
                        }
                        //Set Stack Color
                    }.background(Color.blue).frame(height: 50)
                    
                    Section{
                        VStack{
                            //if button pressed; continue
                            
                            HStack{
                                Spacer()
                                NavigationLink(destination: TripList()){
                                    
                                    Text("Continue")
                                    Image(systemName: "arrowshape.turn.up.right.circle.fill")
                                    Spacer()
                                }
                                .frame(width: 250,height:50).background(Color.blue) .foregroundColor(Color.white)
                                
                            }
                            
                            
                        }//Set Stack Color
                            .background(Color.blue).frame(height: 50)
                    }
                }
                .navigationBarTitle("Trip Planner")
            }
        }
    }
}
//TESTING DEVELOP MERGE




struct TripPlanner_Previews: PreviewProvider {
    static var previews: some View {
        TripPlanner()
    }
}



