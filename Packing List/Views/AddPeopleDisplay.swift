//
//  AddPeopleDisplayTest.swift
//  Packing List
//
//  Created by Will Hustle on 12/28/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct AddPeopleDisplay: View {
    //create Environment for moc,  fetchrequest and private var boolean for sheet
    @Environment(\.managedObjectContext) var moc
    
    
    @FetchRequest(entity: People.entity(), sortDescriptors: []

    )var addPeople: FetchedResults<People>
    
    @State private var showingAddPeopleScreen = false
    
    
    @State private var firstName = ""
    @State private var gender = ""
    @State private var adultOrChild = ""
    @State private var peopleRelationship = ""
    @State private var tripID = ""
    
    
    var body: some View {
        NavigationView{

            List{
                Section{
                    ForEach(addPeople, id: \.self) { people in
                        AddPeopleRow(
                            firstName: people.firstName ?? "Empty!",
                            
                            gender: people.gender ?? "Empty!",
                            
                            adultOrChild: people.adultOrChild ?? "Empty!",
                            
                            peopleRelationship: people.peopleRelationship ?? "Empty!",
                            
                            tripID: people.tripIDString ?? "Empty")
                            
                    }.onDelete(perform: removePeople)
                    
                }
                
            }
                
                
            .navigationBarTitle("People Added")
            .navigationBarItems(trailing:
                
            
                Button(action: {
                    self.showingAddPeopleScreen.toggle()
                }) {
                    Image(systemName: "plus")
                }
            )
                .sheet(isPresented: $showingAddPeopleScreen) {
                    AddPeople(getTripID: "Number", getTripName: "London").environment(\.managedObjectContext, self.moc)
            }
            
 
        }
        
    }
    //remove people from core data
              func removePeople(at offsets: IndexSet) {
                  for index in offsets {
                      let people = addPeople[index]
                      self.moc.delete(people)
                  }
                  do {
                      try self.moc.save()
                  } catch {
          //            print(error.localizedDescription)
                  }
              }
    
}





#if DEBUG
struct AddPeopleDisplayTest_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return AddPeopleDisplay().environment(\.managedObjectContext, context)
    }
}
#endif
