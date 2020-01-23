//
//  ContentView.swift
//  Packing List
//
//  Created by Will Hustle on 12/24/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct TripDetail: View {
    //    //sample tripID: 811EDA3A-F4B5-4C8B-A30D-0E41385D9E98
    //
    var tripID : String
    var destination : String
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                ZStack {
                    //add text overlay for Destination + Travel Dates
                    
                    //Text(city, departureDate)
                    
                    //grab image based on tripID
                    Image( "fijiHut").resizable().aspectRatio(contentMode: .fill).blur(radius: 0.4).opacity(0.7).frame(height: 100)
                    
                    
                    TripInfo(tripID: "\(tripID)")
                    
                    
                }.edgesIgnoringSafeArea(.all)
            
            //insert numberOfPeople going for total count
              Text("People Going To \(destination)")
                    PeopleGoing(tripID: "\(tripID)", destination: "\(destination)")
               
                Text("Packing List")
                ItemList()
                    
                }
                
                
                
                Spacer()
                
                
            }
            
            
            
        }
        
    }

struct TripInfo: View {
    
    var tripID: String
    
    var tripRequest : FetchRequest<Trips>
    var trip : FetchedResults<Trips>{tripRequest.wrappedValue}
    
    init(tripID: String) {
        self.tripID = tripID
        self.tripRequest = FetchRequest(entity: Trips.entity(), sortDescriptors: [], predicate:
            NSPredicate(format: "%K == %@", #keyPath(Trips.tripID),tripID))
    }
    
    //DATE FORMATTER
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    
    var body: some View {
        
        ForEach(trip, id: \.self) {
            currentTrip in
            //note: can use string literals """ but it breaks canvas in XCode.
            Text(
                
                "Destination: \(currentTrip.destination ?? "Empty") \n Departing: \(currentTrip.departureDate ?? Date(), formatter: self.dateFormatter)\n Returning: \(currentTrip.returnDate ?? Date(), formatter: self.dateFormatter)"
                
                
            ).font(.system(. caption)).minimumScaleFactor(0.8).lineLimit(10).padding(5)
            
        }
    }
    
}



#if DEBUG
struct TripDetail_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return TripDetail(tripID: "811EDA3A-F4B5-4C8B-A30D-0E41385D9E98", destination: "London").environment(\.managedObjectContext, context)
    }
}
#endif
