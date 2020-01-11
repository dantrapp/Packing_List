//
//  AddPeople.swift
//  Packing List
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
    @FetchRequest(entity: PackingList.entity(), sortDescriptors: [])
    
    var fetchPeople: FetchedResults<PackingList>
    
    /*
     'Add People' Core Data Attributes
     peopleID: UUID
     firstName: String
     gender: String
     adultOrChild: String
     
     */
    
    @State var firstName : String = ""
    @State var adultOrChild : String = ""
    @State var chooseGender : String = ""
    @State var peopleRelationship : String = ""
    
    //fetch from core data to see how many people are going on this trip
    @State var numberOfPeople = 0
    
    
    //Add People Arrays
    
    var genderArray = ["Male", "Female", "Other"]
    var adultChildArray = ["Adult", "Child"]
    var relationshipArray = [ "Family", "Friend"]
    
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                    HStack{
                        Spacer()
                        Image(systemName: "person").resizable().frame(width: 25, height: 25)
                        Text("Add A Person").font(.largeTitle)
                        Spacer()
                    }
                }
                Section{
                    
                    Text("Basic Details")
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
                
                
//                NavigationLink(destination: AddPeopleDisplay()){
//
                
                HStack{
                    Spacer()
                Button(("save")) {
                    let addPeople = PackingList(context: self.moc)
                    addPeople.firstName = self.firstName
                    addPeople.gender = self.chooseGender
                    addPeople.adultOrChild = self.adultOrChild
                        addPeople.peopleRelationship = self.peopleRelationship
                    
                    //save the data
                    try? self.moc.save()
                    
                    //dismiss sheet
                                       self.presentationMode.wrappedValue.dismiss()
                    
                }//error checking form values for empty. If not empty, show save button.
                .disabled(firstName.isEmpty || chooseGender.isEmpty || adultOrChild.isEmpty)
                
                    Spacer()
                
                }
            }
                
                
            }
            
        }
    }
//}
struct AddPeople_Previews: PreviewProvider {
    static var previews: some View {
        AddPeople()
    }
}

