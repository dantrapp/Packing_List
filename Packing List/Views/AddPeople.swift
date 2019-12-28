//
//  AddPeople.swift
//  Packing List
//
//  Created by Will Hustle on 12/24/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct AddPeople: View {
    
    //establish connection to moc for core data use and presentation mode for sheet
    @Environment(\.managedObjectContext) var moc
    
    @Environment(\.presentationMode) var presentationMode
    
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
    
    
    
    //Add People Arrays
    
    var genderArray = ["Male", "Female", "Other"]
    var adultChildArray = ["Adult", "Child"]
    
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
                
                Button("save") {
                    let addPeople = PackingList(context: self.moc)
                    addPeople.firstName = self.firstName
                    addPeople.gender = self.chooseGender
                    addPeople.adultOrChild = self.adultOrChild
                    
                    //save the data
                    try? self.moc.save()
                    
                    //dismiss sheet
                                       self.presentationMode.wrappedValue.dismiss()   
                }
                
                
                
                
                
            }
            
        }
    }
}
struct AddPeople_Previews: PreviewProvider {
    static var previews: some View {
        AddPeople()
    }
}

