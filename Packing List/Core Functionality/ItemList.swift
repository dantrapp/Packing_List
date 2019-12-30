//
//  ItemList.swift
//  Packing List
//
//  Created by Will Hustle on 12/25/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct ItemList: View {
    
    var body: some View {
        NavigationView {
            
            /*
             I want to use this default list with Core Data (preload?) and sort items by categoryType (List.identifier?) - this issue is that I don't have this data preloaded into Core Data and at minimum I need this small set of maybe 100 items in an array to be loaded into Core Data onLoad.
             
             In addition, I can use an array for the categories and then use a ForEach to loop through the categories, and for each category, loop through the item list to find the corresponding items by categoryType.
             */
            
            Section{
                List(items) {
                currentItem in
                NavigationLink(destination: ItemDetail(itemData: currentItem)){ ItemRow(item: currentItem)
                    }
                }
            }
                Spacer()
            }
            
        }
    }
    
    
    
    struct CategoryItems_Previews: PreviewProvider {
        static var previews: some View {
            ItemList()
        }
}
