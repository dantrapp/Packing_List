//
//  ItemListTest.swift
//  Packing List
//
//  Created by Will Hustle on 12/28/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI



struct ItemListTest: View {

    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { currentItem in
                    Section(header: Text(currentItem.categoryName)){
                        ForEach(items) { currentItem in
                             NavigationLink(destination: ItemDetail(itemData: currentItem)){ ItemRow(item: currentItem)

                            }
                        }
                        //add onMove to rearrange items
                        .onMove {
                            (indexSet, index) in
                            items.move(fromOffsets: indexSet, toOffset: index)
                        }
                    }
                    
                }
                
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Items")
        .navigationBarItems(trailing: EditButton())
        }
        
        
    }
}

struct ItemListTest_Previews: PreviewProvider {
    static var previews: some View {
        ItemListTest()
    }
}
