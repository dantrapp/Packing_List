//
//  AddPeople.swift
//
//  Created by Will Hustle on 12/24/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct AddPeople: View {
    
    /*
     Add People Going On This Trip: London
     peopleID: UUID
     firstName: String
     gender: String
     adultOrChild: String
     peopleRelationship : String [mother, father, son, daughter, friend, colleagues.etc]
     
     
     + Add Another Person
     
     Each person (object) has their own peopleID and properties and they are grouped into 3 categories.
     
     - Family
     - Friends
     - Colleagues (Work)
     
     This way for future trips each person can be selected quickly to add to a trip.
     
     */
    
    //establish connection to moc for core data use and presentation mode for sheet
    @Environment(\.managedObjectContext) var moc
    
    @Environment(\.presentationMode) var presentationMode
    
    //GET PEOPLE
    @FetchRequest(entity: People.entity(), sortDescriptors: [])
    
    var fetchPeople : FetchedResults<People>
    
    @State var firstName : String = ""
    @State var adultOrChild : String = ""
    @State var chooseGender : String = ""
    @State var peopleRelationship : String = ""
    
    
    //SAVE BUTTON PRESSED
    @State var saveButtonPressed = false
    
    //GET TRIP NAME FROM TRIPPLANNER
    var getTripID : String
    var getTripName : String
    
   /*
     I need to figure out how to pull the corresponding trip ID. Passing it through the modal just prints a random ID
     */
 
    
    
    //Add People Arrays
    
    var genderArray = ["Male", "Female", "Other"]
    var adultChildArray = ["Adult", "Child"]
    var relationshipArray = [ "Family", "Friend"]
    
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                    Text("Trip Name: \(getTripName)")
                    Text("Trip ID: \(getTripID)")
                }
                
                Section(header: Text("First Name")){
                    TextField("Enter First Name", text: $firstName)
                    
                }
                
                //Select Gender: Segmented Picker
                Section(header: Text("Choose Gender: \(chooseGender)")){
                    Picker("Gender", selection: $chooseGender){
                        ForEach(genderArray, id: \.self) {
                            Text($0)
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
                
                //Select Adult Or Child: Segmented Picker
                Section(header: Text("Adult Or Child?: \(adultOrChild)")){
                    
                    Picker("Gender", selection: $adultOrChild){
                        ForEach(adultChildArray, id: \.self) {
                            Text($0)
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
                
                //Select Family or Friend?
                Section(header: Text("Family Or Friend?: \(peopleRelationship)")){
                    Picker("Gender", selection: $peopleRelationship){
                        ForEach(relationshipArray, id: \.self) {
                            Text($0)
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
                
                
                HStack{
                    Spacer()
                    Button("SAVE / Add Another Person") {
                        //check for tripID
                        let addPeople = People(context: self.moc)
                        addPeople.firstName = self.firstName
                        addPeople.gender = self.chooseGender
                        addPeople.adultOrChild = self.adultOrChild
                        addPeople.peopleRelationship = self.peopleRelationship
                        addPeople.tripIDString = self.getTripID
                        
                        //save button has been pressed
                        self.saveButtonPressed = true
                        
                        //save the data
                        try? self.moc.save()
                        
                        
                    }
                    .disabled(firstName.isEmpty || chooseGender.isEmpty || adultOrChild.isEmpty)
                    
                    Spacer()
                    
                    
                }
                
                //ifSaved button pressed show Done Button
                
                if saveButtonPressed{
                        HStack{
                            
                            Spacer()
                            Button("I'm Done, Thanks!"){
                                //reset the form fields
                                self.firstName = ""
                                self.adultOrChild = ""
                                self.chooseGender = ""
                                self.peopleRelationship = ""
                                
                        self.presentationMode.wrappedValue.dismiss()
                                
                            }
                            Spacer()
                            
                            
                        
                    }
                    
                }
                
            }
            .navigationBarTitle("Add People")
            
            
        }
        
    }
}
//}
struct AddPeople_Previews: PreviewProvider {
    static var previews: some View {
        AddPeople(getTripID: "Number", getTripName: "London")
    }
}

