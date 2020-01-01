//
//  ItemRow.swift
//  Packing List
//
//  Created by Will Hustle on 12/24/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    
    var name: String
    var priority: String = ""
    var date : Date = Date()
    
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
            //item priority
            Text(priority).font(.system(size: 30)).minimumScaleFactor(0.8).lineLimit(1)
            //item name
            Text(name).font(.system(size: 30)).minimumScaleFactor(0.8).lineLimit(1)
            Spacer()
           }
            //item date
            Text("Added: \(date, formatter: self.dateFormatter)").font(.system(. caption)).minimumScaleFactor(0.8).lineLimit(1)
            Spacer()
     
            
        }
        
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(name: "String").previewLayout(.fixed(width: 500, height: 50))
    }
}

