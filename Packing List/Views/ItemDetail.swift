//
//  ItemDetail.swift
//  Packing List
//
//  Created by Will Hustle on 12/25/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct ItemDetail : View {
    
    //establish connection to moc for core data use and presentation mode for sheet
    @Environment(\.managedObjectContext) var moc
    
    
//   @Environment(\.presentationMode) var presentationMode

    //fetch and order by itemName ascending
    @FetchRequest(entity: PackingList.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \PackingList.itemPriority, ascending: false)])
        
     var addItem: FetchedResults<PackingList>
    
    //Modal Var
    @State private var showingAddItemScreen = false
    
    
    //bring in the struct
    var itemData : Item
    
    //capture for Core Data
    @State var itemName: String = ""
    @State var itemCategory: String = ""
    @State var itemPriority : String = ""

    
    var body: some View {
        NavigationView {
            List{
                Section{
                    ForEach(addItem, id: \.self) { currentItem in
                        ItemRow(name: currentItem.itemName ?? "Empty!", priority: currentItem.itemPriority ?? "Empty!")
                        
//                        \\(currentItem.itemType ?? "Empty!!")
                                       
                        
                    }.onDelete(perform: removeItem)
                    
                }
                
            }
            .listStyle(GroupedListStyle())
            
            
        
        .navigationBarTitle(Text(itemData.name), displayMode: .large)
        .navigationBarItems(trailing:
            Button(action: {
                self.showingAddItemScreen.toggle()
            }) {
                Text("Add Item")
                Image(systemName: "plus")
            }
        )
            .sheet(isPresented: $showingAddItemScreen) {
                AddNewItem(itemData: items[2]).environment(\.managedObjectContext, self.moc)
        }
        
    }
    }
    
    //remove people from core data
              func removeItem(at offsets: IndexSet) {
                  for index in offsets {
                      let item = addItem[index]
                      self.moc.delete(item)
                  }
                  do {
                      try self.moc.save()
                  } catch {
          //            print(error.localizedDescription)
                  }
              }
    
}

#if DEBUG
struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ItemDetail(itemData: items[2]).environment(\.managedObjectContext, context)
    }
}
#endif
