//
//  TripTesting.swift
//  Packing List
//
//  Created by Will Hustle on 1/3/20.
//  Copyright © 2020 Will Hustle. All rights reserved.
//

import SwiftUI

struct TripTesting: View {
    
    @Environment(\.managedObjectContext) var moc

    
    //fetch and order by itemName ascending
    @FetchRequest(entity: PackingList.entity(), sortDescriptors: [NSSortDescriptor(key: "departureDate", ascending: true)])
    
    var fetchTrip: FetchedResults<PackingList>
    
      //TRAVEL DATES
      @State var departureDate = Date()
      @State var returnDate = Date()
      
      //DESTINATION
      @State var destination = ""
      
      
      //PEOPLE GOING
      @State var numberOfPeople = 0

    var body: some View {
        NavigationView {
            List {
                ForEach(fetchTrip, id: \.self) { currentTrip in
                    TripRow(destination: currentTrip.destination ?? "Empty!", departing: currentTrip.departureDate ?? Date(), returning: currentTrip.returnDate ?? Date())
                 
                }.onDelete(perform: removeTrips)
            } 
        .navigationBarTitle("Current Trips")
        }
    }
    
    //remove trips from core data
        func removeTrips(at offsets: IndexSet) {
            for index in offsets {
                let trips = fetchTrip[index]
                self.moc.delete(trips)
            }
            do {
                try self.moc.save()
            } catch {
    //            print(error.localizedDescription)
            }
        }
    
}



#if DEBUG
struct TripTesting_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return TripTesting().environment(\.managedObjectContext, context)
    }
}
#endif