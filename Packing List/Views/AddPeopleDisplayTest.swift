//
//  AddPeopleDisplayTest.swift
//  Packing List
//
//  Created by Will Hustle on 12/28/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct AddPeopleDisplayTest: View {
    //create Environment for moc,  fetchrequest and private var boolean for sheet
    @Environment(\.managedObjectContext) var moc
    
    
    @FetchRequest(entity: PackingList.entity(), sortDescriptors: []) var addPeople: FetchedResults<PackingList>
    
    @State private var showingAddPeopleScreen = false
    
    
    @State private var firstName = ""
    @State private var gender = ""
    @State private var adultOrChild = ""
    
    
    var body: some View {
        NavigationView{
            //Text("Total People: \(addPeople.count)")
            
            List{
                Section{
                    ForEach(addPeople, id: \.self) { people in
                        AddPeopleRow(firstName: people.firstName ?? "Empty!", gender: people.gender ?? "Empty!", adultOrChild: people.adultOrChild ?? "Empty!")
                    }
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
                    
                    AddPeople().environment(\.managedObjectContext, self.moc)
                    
                    
                    
            }
        }
    }
}




#if DEBUG
struct AddPeopleDisplayTest_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return AddPeopleDisplayTest().environment(\.managedObjectContext, context)
    }
}
#endif
