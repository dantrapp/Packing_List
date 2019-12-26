//
//  TripPlanner.swift
//  Packing List
//
//  Created by Will Hustle on 12/24/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct TripPlanner: View {
    
    @State var numberOfPeople = 0
    
    //departure and return dates
    @State var departureDate = Date()
    @State var returnDate = Date()
    
    //travel date vars
    @State var currentDate = Date()
    @State var untilTrip = 0
    
    
    //destination textfield
    @State var destination = ""
    
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
                    DepartureDate()
                    
                }
                
                Section(header: Text("Choose Your Return Date")) {
                    ReturnDate()
                    
                }
                
                Section{
                    Picker("Number of people going", selection: $numberOfPeople){
                        ForEach(0..<20){
                            Text("\($0) People")
                        }
                        
                    }
                    
                }
                
                //check that all section fields/picker have values and use conditional to determine next view.
                
                Section {
                    VStack{
                        //2 button options, add people & skip
                        if numberOfPeople > 1 {
                            HStack{
                                NavigationLink(destination: AddPeople()) {
                                    Spacer()
                                    Text("Add Details For \(numberOfPeople) People").frame(width: 250, height:50).background(Color.blue).foregroundColor(Color.white)
                                    Spacer()
                                }
                            }
                            HStack{
                                //Continue Button
                                NavigationLink(destination: TripDetail()) {
                                    Spacer()
                                    Text("Skip & Continue").background(Color.blue).foregroundColor(Color.white).frame(width: 250, height: 50)
                                    
                                    Spacer()
                                }
                            }
                            
                        } else {
                            NavigationLink(destination: TripDetail()) {
                                Spacer()
                                Text("Continue").background(Color.blue).foregroundColor(Color.white).frame(height: 50)
                                Spacer()
                                
                            }
                        }
                        
                    }.background(Color.blue).frame(height: 50)
                    
                }
                
                
                
                /*
                 *** LAST QUESTION! ***
                 Now that we have the number of people going selected, and the value added to the numberOfPeople variable, we can now give the option of sending people into the AddPeople flow.
                 
                 This should technically be the last question in the trip planner because if 1 person is going, it moves into TripDetail view where the 1 person going can add/modify the items needed.
                 
                 If 2 or more people are going then those people need to be configured (or Skip and do later)
                 
                 
                 */
                
                
                
                /* if numberOfPeople > 1{
                 person1: adultOrChild...etc
                 Use a Picker to select Adult or Child
                 Store value as 0 or 1
                 */
                
                
            }
                .navigationBarTitle("Trip Planner") //attach the title to the Form, not the nav view!
        }
    }
}

//error checking

//private func isUserInformationValid() -> Bool {
//    if destination.isEmpty {
//        return false
//    }
//
//    if departureDate.isEmpty {
//        return false
//    }
//
//    if returnDate.isEmpty {
//        return false
//    }
//
//    if numberOfPeople.isEmpty {
//        return false
//    }
//
//    return true
//}



struct TripPlanner_Previews: PreviewProvider {
    static var previews: some View {
        TripPlanner()
    }
}

//        struct goButton: View {
//            var body: some View {
//                Button(action: {
//                    print("Delete tapped!")
//                }) {
//                    HStack {
//                        Image(systemName: "person")
//                            .font(.title)
//                        Text("Next")
//                            .fontWeight(.semibold)
//                            .font(.title)
//                    }
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(Color.green)
//                    .cornerRadius(40)
//                }
//            }


//}

struct DepartureDate: View {
    @State var departureDate = Date()
    var body: some View {
        DatePicker("Please Select Your Travel Dates", selection: $departureDate,in: Date()...,  displayedComponents: .date)
            .labelsHidden()
    }
}



struct ReturnDate: View {
    @State var returnDate = Date()
    var body: some View {
        DatePicker("Please Select Your Travel Dates", selection: $returnDate,in: Date()...,  displayedComponents: .date)
            .labelsHidden()
    }
}

