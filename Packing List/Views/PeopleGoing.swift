//
//  PeopleGoing.swift
//  Packing List
//
//  Created by Will Hustle on 1/19/20.
//  Copyright © 2020 Will Hustle. All rights reserved.
//


import SwiftUI

struct PeopleGoing: View {

    @Environment(\.managedObjectContext) var moc
    
    //live tripID
    //811EDA3A-F4B5-4C8B-A30D-0E41385D9E98
    
    //Get Trip ID & Destination
    var tripID : String
    var destination : String
        
    //Setup the Fetch request by tripID (UUID)
    var peopleRequest : FetchRequest<People>
    var person : FetchedResults<People>{peopleRequest.wrappedValue}

    init(tripID: String, destination: String) {
        self.destination = destination
        self.tripID = tripID
        self.peopleRequest = FetchRequest(entity: People.entity(), sortDescriptors: [], predicate:
            NSPredicate(format: "%K == %@", #keyPath(People.tripIDString),tripID))    
    }
    
    @State private var firstName = ""
    @State private var gender = ""
    @State private var adultOrChild = ""
    @State private var peopleRelationship = ""
    
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(person, id: \.self) {
                        people in
                        Text("\(people.firstName ?? "Empty")")
                
//                         AddPeopleRow(tripID: person.tripIDString ?? "Empty")"

                    }
                    
                    
                    //TEST 2
//                        AddPeopleRow(
//                            firstName: people.firstName ?? "Empty!",
//
//                            gender: people.gender ?? "Empty!",
//
//                            adultOrChild: people.adultOrChild ?? "Empty!",
//
//                            peopleRelationship: people.peopleRelationship ?? "Empty!",
//
//                            tripID: people.tripIDString ?? "Empty")
//
//
//                    }
                    
                    
                }
                .navigationBarTitle("\(destination)")
            }
        }
    }
}

#if DEBUG
struct PeopleGoing_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return PeopleGoing(tripID: "number", destination: "London").environment(\.managedObjectContext, context)
    }
}
#endif
