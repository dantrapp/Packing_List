//
//  ItemDetail.swift
//  Packing List
//
//  Created by Will Hustle on 12/25/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct ItemDetail : View {
    
    //bring in the struct
    var itemData : Item
    
    @State var newItem = ""
    
    var body: some View {
        NavigationView {
            
            //list the items here
            Form {
                Section(header: Text("Add The \(itemData.name) You Want To Pack")){
                    
                    TextField("Add \(itemData.name)", text: $newItem)
                }
                    
                    Section(header: Text("Current \(itemData.name) You're Packing")){
                        Text("Pull items from Core Data and display as current packing inventory in List format. Would be great to add an image as well so people can view the items. This will also need a way to edit/delete (Swipe?) items from the list, and Core Data.").frame(height: 400)
                    }
                    
                }
             .navigationBarTitle(Text(itemData.name), displayMode: .large)
        }
        
        
    }
}



struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(itemData: items[2])
    }
}
