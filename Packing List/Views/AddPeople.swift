//
//  AddPeople.swift
//  Packing List
//
//  Created by Will Hustle on 12/24/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct AddPeople: View {
    
    
    @State var firstName = ""
    @State var age = 0
    @State var adultOrChild = 0
    @State var chooseGender = 0
    

    
    //Add People Variables
    
    var gender = ["Male", "Female", "Other"]
    var adultChild = ["Adult", "Child"]
    
    var body: some View {
        
        //use a form
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
                    Section(header: Text("Choose Gender: \(gender[chooseGender])")){
                        
                        Picker("Gender", selection: $chooseGender){
                            ForEach(0 ..< gender.count) {
                                Text(self.gender[$0])
                            }

                        }.pickerStyle(SegmentedPickerStyle())
                        
                    }
            
            //Select Adult Or Child: Segmented Picker
                             Section(header: Text("Adult Or Child?: \(adultChild[adultOrChild])")){
                                 
                                 Picker("Gender", selection: $adultOrChild){
                                     ForEach(0 ..< adultChild.count) {
                                         Text(self.adultChild[$0])
                                     }

                                 }.pickerStyle(SegmentedPickerStyle())
                                 
                             }
            
            /*
             Now that we have the info firstName, Gender and adultOrChild, we have all of the basic details to build a person.
             
             All that's left to do is submit this information to Core Data, assign an ID to this person and transition to either the next person that needs details added or send the user directly to Trip Detail to see the output.
             */
            
           
                
            }
            
        }
    }
struct AddPeople_Previews: PreviewProvider {
    static var previews: some View {
        AddPeople()
    }
}

