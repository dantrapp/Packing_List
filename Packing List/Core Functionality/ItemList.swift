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
                List {
                    ForEach(Array(Set(items.compactMap{ $0[keyPath: \.categoryName] })), id: \.self) { category in
                        Section(header: Text(category)) {
                            
                            //filter all categories
                            ForEach(items.filter {
                                $0.categoryName == category }) { currentItem in
                                NavigationLink(destination: ItemDetail(itemData: currentItem)){
                                  
                            //add item names to rows
                                    Text("\(currentItem.name)") }
                                
                                
                             //I need to load these default items into Core Data
                                
                                
                            }
                        }
                    }
                    .onMove {
                        (indexSet, index) in
                        items.move(fromOffsets: indexSet, toOffset: index)
                    }
                    
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Items")
                .navigationBarItems(trailing: EditButton())
                
            }
        }

        }
    
    
    
    struct CategoryItems_Previews: PreviewProvider {
        static var previews: some View {
            ItemList()
        }
}
