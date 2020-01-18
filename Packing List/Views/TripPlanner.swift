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
    
    //TRIP ID
    @State var tripID = UUID()
    
    
    
    //PEOPLE GOING
    @State var numberOfPeople = 1
    
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
    
    //Save button info
    @State var isPressed = false

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
                        ForEach(0..<20){
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
                
                
                //ADD BUTTON LOGIC HERE
                
                Button(action:
                    {
                        self.isPressed.toggle()
                        let addTrip = Trips(context: self.moc)
                        
                        addTrip.tripID = UUID()
                        
                        addTrip.destination = self.destination
                        
                        addTrip.departureDate = self.departureDate
                        
                        addTrip.returnDate = self.returnDate
                        addTrip.transportationType = self.transportation
                        
                        addTrip.travelType = self.typeOfTravel
                        
                        addTrip.numberOfPeople = Int32(self.numberOfPeople)
                        
                        addTrip.tripID = self.tripID
                        
                        //save the data
                        try? self.moc.save()
                        
                        //reset the form fields
                        //self.destination = ""
                        self.departureDate = Date()
                        self.returnDate = Date()
                        self.transportation = ""
                        self.typeOfTravel = ""
                        //self.tripID = UUID()
                        //                        self.numberOfPeople = Int(Int32(1))

                        
                        
                        
                }) {
                    
                    HStack{
                        Spacer()
                        Text("Save Trip")
                        Spacer()
                    }
                    
                    
                    
                    
                    
                }
                    
                .disabled(destination.isEmpty)
                
                
                //SAVE BUTTON PRESSED?
                if isPressed{
                    if numberOfPeople > 1{
                           VStack{
                                 HStack{
                                     Spacer()
                                     NavigationLink(destination: AddPeople(getTripID: "\(tripID)", getTripName: "\(destination)")){
                                         
                                         Text("Add People")
                                         Image(systemName: "arrowshape.turn.up.right.circle.fill")
                                         Spacer()
                                     }
                                     .frame(width: 250,height:50).background(Color.blue) .foregroundColor(Color.white)
                                     
                                 }
                             }
                             .background(Color.blue).frame(height: 50)
                        Text("People Going: \(numberOfPeople)")
                                   
                        
                    } else {
                        ContinueButton()
                        Text("People Going: \(numberOfPeople)")
  
                    }
                    
                    
                } // end save button pressed
                
                
            }
            .navigationBarTitle("Trip Planner")
            
            
        }
        
        
    }
  
}





struct TripPlanner_Previews: PreviewProvider {
    static var previews: some View {
        TripPlanner()
    }
}


struct ContinueButton: View {
    var body: some View {
        VStack{
            HStack{
                Spacer()
                NavigationLink(destination: TripList()){
                    
                    Text("Continue")
                    Image(systemName: "arrowshape.turn.up.right.circle.fill")
                    Spacer()
                }
                .frame(width: 250,height:50).background(Color.blue) .foregroundColor(Color.white)
                
            }
            .background(Color.blue).frame(height: 50)
        }
    }
    
}

