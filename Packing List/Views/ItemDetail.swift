//
//  ItemDetail.swift
//  Packing List
//
//  Created by Will Hustle on 12/31/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    //establish connection to moc for core data use and presentation mode for sheet
    @Environment(\.managedObjectContext) var moc
    
    //fetch and order by itemName ascending
    @FetchRequest(entity: PackingList.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \PackingList.itemPriority, ascending: false)])
    
    var addItem: FetchedResults<PackingList>
    
    //bring in the struct
    var itemData : Item
    
    //capture for Core Data
    @State var itemName  = ""
    @State var itemType = ""
    @State var itemPriority = ""
    
    
    var body: some View {
        NavigationView {
            //Add Item
            Form {
              
                    TextField("Add \(itemData.name)", text: $itemName)
                        .padding(.all, 5)
                        .font(Font.system(size: 25, design: .default)).multilineTextAlignment(.center).textFieldStyle(RoundedBorderTextFieldStyle())
                    
                
                
                //Select Priority
               
//                    Text("Select The Priority Of This Item")
                    Picker(selection: $itemPriority, label:Text("")){
                        Text("Undecided 😐").tag("😐")
                        Text("Probably 👍").tag("👍")
                        Text("Definitely! 🥰").tag("🥰")
                        
                    }.pickerStyle(SegmentedPickerStyle())
                    
                
                
             
                    HStack{
                        Spacer()
                        Button(("SAVE ITEM ✅")) {
                            let addItem = PackingList(context: self.moc)
                            addItem.itemName = self.itemName
                            addItem.itemType = self.itemType
                            addItem.itemPriority = self.itemPriority
                            addItem.itemDate = Date()
                            
                            //set to empty string to clear textfield for another item
                            self.itemName = ""
                            
                            //save the data
                            try? self.moc.save()
                            //dismiss sheet
                            
                        }//error checking form values for empty. If not empty, show save button.
                            .disabled(itemName.isEmpty ||  itemPriority.isEmpty)
                        Spacer()
                    }
                    
                    
                
                
                //Text("Print List")
                             ForEach(addItem, id: \.self) { currentItem in
                                 ItemRow(name: currentItem.itemName ?? "Empty!", priority: currentItem.itemPriority ?? "Empty!")
                
                
            }
                .onDelete(perform: removeItem)
            

            }
            .navigationBarTitle(Text(itemData.name), displayMode: .large)
            
        }
        
      
    
    }
    
    //remove item from core data
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
        return ItemDetail(itemData: items[3]).environment(\.managedObjectContext, context)
    }
}
#endif
