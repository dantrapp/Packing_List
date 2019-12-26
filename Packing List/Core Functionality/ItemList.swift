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
            Section{
            List(items) {
                currentItem in
                NavigationLink(destination: ItemDetail(itemData: currentItem)){ ListRow(item: currentItem)
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
