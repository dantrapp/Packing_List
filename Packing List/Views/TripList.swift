//
//  TripList.swift
//  Packing List
//
//  Created by Will Hustle on 12/25/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct TripList: View {
    
    @Environment(\.managedObjectContext) var moc
    
    
    //fetch and order by itemName ascending
    @FetchRequest(entity: Trips.entity(), sortDescriptors: [NSSortDescriptor(key: "departureDate", ascending: true)])
    
    var fetchTrip: FetchedResults<Trips>
    
    //TRAVEL DATES
    @State var departureDate = Date()
    @State var returnDate = Date()
    
    //DESTINATION
    @State var destination = ""
    
//    //TRIPID
//    @State var tripID = UUID()
    
    
    //PEOPLE GOING
    @State var numberOfPeople = 0
    
    //TRANSPORTATION TYPE
    @State var transportationType = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fetchTrip, id: \.self) { currentTrip in
                    TripRow(
                        
                        destination: currentTrip.destination ?? "Empty!",
                        
                        transportation: currentTrip.transportationType ?? "Empty!",
                        
                        typeOfTravel: currentTrip.travelType ?? "Empty!",
                        
                        departing: currentTrip.departureDate ?? Date(),
                        
                        returning: currentTrip.returnDate ?? Date(),
                        
                        tripID:
                                            currentTrip.tripID ?? UUID()
                                             
                        
                    )
                    
                }.onDelete(perform: removeTrips)
                
            }
            .navigationBarTitle("Upcoming Trips")
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
struct TripList_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return TripList().environment(\.managedObjectContext, context)
    }
}
#endif
