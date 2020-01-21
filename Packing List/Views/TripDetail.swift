//
//  ContentView.swift
//  Packing List
//
//  Created by Will Hustle on 12/24/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct TripDetail: View {
    //
    //    //Trip ID Fetch Request
    //    //sample tripID: 811EDA3A-F4B5-4C8B-A30D-0E41385D9E98
    //
    var tripID : String
    var destination : String
    //
    //    var tripRequest : FetchRequest<Trips>
    //    var trip : FetchedResults<Trips>{tripRequest.wrappedValue}
    //
    //    init(tripID: String){
    //        self.tripID = tripID
    //        self.tripRequest = FetchRequest(entity: Trips.entity(), sortDescriptors: [], predicate:
    //            NSPredicate(format: "%K == %@", #keyPath(Trips.tripID),tripID))
    //
    //}
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                ZStack {
                    //add text overlay for Destination + Travel Dates
                    
                    //Text(city, departureDate)
                    
                    //grab image based on tripID
                    Image( "fijiHut").resizable().aspectRatio(contentMode: .fill).blur(radius: 0.4).opacity(0.7).frame(height: 200)
                    
                    
                    
                    
                    
                }.edgesIgnoringSafeArea(.all)
                
                VStack{
                    Text("\(tripID)")
                    
                }
                VStack{
                    PeopleGoing(tripID: "\(tripID)", destination: "\(destination)")
                    
                }
                
                
//                List {
//
//                    VStack {
//
//                        //             Text("TripID: \(tripID)")
//                        //pull destination from Core Data
//
//                        //                        ForEach(tripRequest, id: \.self) { data in
//                        //                            Text("\(data.destination ?? "Empty!")")
//                        //                        }
//
//
//                        //THIS SHOULD WORK!
////                        PeopleGoing(tripID: "\(tripID)")
//
//                    }
//
//                }
                
                
                Spacer()
                
                
            }
            
            
            
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
