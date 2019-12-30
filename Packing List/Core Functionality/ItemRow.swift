//
//  ItemRow.swift
//  Packing List
//
//  Created by Will Hustle on 12/24/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
     //pass in item object to pull data
        var item: Item
    
        
        var body: some View {

            //command -> embed in hstack
            HStack {

                //Player Name
                Text(item.name).font(.system(size: 18)).minimumScaleFactor(0.8).lineLimit(1)
                
                
//                Text("> \(item.categoryName)").font(.system(size: 18)).minimumScaleFactor(0.8).lineLimit(1)
                
                //add Spacer
                Spacer()
            }
            
        }
    }

struct ListRow_Previews: PreviewProvider {
      static var previews: some View {
        ItemRow(item: items[0]).previewLayout(.fixed(width: 500, height: 50))
    }
}

