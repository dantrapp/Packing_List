//
//  TripRow.swift
//  Packing List
//
//  Created by Will Hustle on 1/3/20.
//  Copyright © 2020 Will Hustle. All rights reserved.
//

import SwiftUI

struct TripRow: View {
    
    var destination : String = ""
    var transportation : String = ""
    var typeOfTravel : String = ""
    var departing : Date = Date()
    var returning : Date = Date()
    //    var peopleGoing : Int32
    
    //date formatter i.e. December 31, 2019
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        //command -> embed in hstack
        HStack{
        VStack(alignment: .leading){
            Spacer()
            //destination
            Text("\(destination)").font(.system(. largeTitle)).minimumScaleFactor(0.8).lineLimit(1).padding(5)
            
            //departure date
            Text("Departing: \(departing, formatter: self.dateFormatter)").font(.system(. caption)).minimumScaleFactor(0.8).lineLimit(1).padding(5)
            
            //return date
            Text("Returning: \(returning, formatter: self.dateFormatter)").font(.system(. caption)).minimumScaleFactor(0.8).lineLimit(1).padding(5)
            //transportation type
            Text("Transportation: \(transportation)").font(.system(. caption)).minimumScaleFactor(0.8).lineLimit(1).padding(5)
            //travel type
            Text("Travel Type: \(typeOfTravel)").font(.system(. caption)).minimumScaleFactor(0.8).lineLimit(1).padding(5)
            
            //                //number of people going
            //                Text("(\(Int32(peopleGoing)))").font(.system(size: 20)).minimumScaleFactor(0.8).lineLimit(1)
            Spacer()
        }.padding()
            
            //ADD IMAGE TO ROW
            Image("goldenGate").resizable().aspectRatio(contentMode: .fill).blur(radius: 0.4).opacity(0.7).frame(width: 150, height: 60)
        }
        
    }
}



struct TripRow_Previews: PreviewProvider {
    static var previews: some View {
        TripRow(destination: "San Francisco")
    }
}
