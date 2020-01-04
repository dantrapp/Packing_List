//
//  TripRow.swift
//  Packing List
//
//  Created by Will Hustle on 1/3/20.
//  Copyright © 2020 Will Hustle. All rights reserved.
//

import SwiftUI

struct TripRow: View {
    
    var destination: String = ""
    var departing: Date = Date()
    var returning: Date = Date()
    //    var peopleGoing : Int32
    
    //date formatter i.e. December 31, 2019
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        //command -> embed in hstack
        VStack(alignment: .leading){
            HStack {
                Spacer()
                //destination
                Text("Destination: \(destination)").font(.system(. caption)).minimumScaleFactor(0.8).lineLimit(1)
                
                //departure date
                Text("Departing: \(departing, formatter: self.dateFormatter)").font(.system(. caption)).minimumScaleFactor(0.8).lineLimit(1)
                
                //return date
                Text("Returning: \(returning, formatter: self.dateFormatter)").font(.system(. caption)).minimumScaleFactor(0.8).lineLimit(1)
                
                //                //number of people going
                //                Text("(\(Int32(peopleGoing)))").font(.system(size: 20)).minimumScaleFactor(0.8).lineLimit(1)
                Spacer()
            }

            
            
        }
    }
}



struct TripRow_Previews: PreviewProvider {
    static var previews: some View {
        TripRow(destination: "Fiji")
    }
}
