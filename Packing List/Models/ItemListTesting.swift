//
//  ItemListTesting.swift
//  Packing List
//
//  Created by Will Hustle on 12/30/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct ItemListTesting: View {
    
    let sections = Dictionary(grouping: sortedNames) { $0.categoryName }
    
    var keys: [String] { sections.map {$0.key} }
        var body: some View {
            List {
                ForEach(keys, id: \.self) { section in
                    Section(header: Text(section)){
                        ForEach(self.sections[section] ?? []) { currentItem in
                            Text(currentItem.name)
                        }
                    }
                    
                }
            }
        .listStyle(GroupedListStyle())
        }
    }


struct ItemListTesting_Previews: PreviewProvider {
    static var previews: some View {
        ItemListTesting()
    }
}
