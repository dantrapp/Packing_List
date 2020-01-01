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
    
        
        var body: some View {

            //command -> embed in hstack
            HStack {

                //item name
                Text(name).font(.system(size: 16)).minimumScaleFactor(0.8).lineLimit(1)
                
                
//                Text("> \(item.categoryName)").font(.system(size: 18)).minimumScaleFactor(0.8).lineLimit(1)
                
                //add Spacer
                Spacer()
            }
            
        }
    }

struct ListRow_Previews: PreviewProvider {
      static var previews: some View {
        ItemRow(name: "String").previewLayout(.fixed(width: 500, height: 50))
    }
}

