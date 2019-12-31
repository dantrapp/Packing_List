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
    

//     @Environment(\.presentationMode) var presentationMode
     
    
    @FetchRequest(entity: PackingList.entity(), sortDescriptors: []
        
    ) var addItem: FetchedResults<PackingList>
    
    
    
    //bring in the struct
    var itemData : Item
    
    @State var newItem = ""
    
    

    //capture for Core Data
    @State var itemName: String = ""
    @State var itemCategory: String = ""
    @State var itemPriority : String = ""
    
    //priority array for Picker values
    @State var priorityArray = ["Undecided 😐", "Probably  👍", "Definitely! 🥰"]
    
    var body: some View {
        NavigationView {
            
            //Add Item
            Form {
                Section(header: Text("Add The \(itemData.name) You Want To Pack")){
                    
                    TextField("Add \(itemData.name)", text: $itemName)
                    
                }
                //Select Priority
                Section(header: Text("Select The Priority Of This Item")){
                    
                    Picker("Priority", selection: $itemPriority){
                        ForEach(priorityArray, id: \.self) {
                            Text($0)
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
                Section{
                    HStack{
                        Spacer()
                        Button(("save")) {
                            let addItem = PackingList(context: self.moc)
                            addItem.itemName = self.itemName
                            addItem.itemCategory = self.itemData.categoryName
                            addItem.itemPriority = self.itemPriority
                            
                            //save the data
                            try? self.moc.save()
                            
                            
                        }//error checking form values for empty. If not empty, show save button.
                            .disabled(itemName.isEmpty ||  itemPriority.isEmpty)
                        Spacer()
                    }
                }
                
                
                //LIST
                
                      List{
                         Section{
                             ForEach(addItem, id: \.self) { currentItem in
                                Text("\(currentItem.itemName ?? "Empty!!")")
                             }//.onDelete(perform: removePeople)
                            
                         }
                         
                     }
                .listStyle(GroupedListStyle())
                
                
            }
            .navigationBarTitle(Text(itemData.name), displayMode: .large)
        }
        
        
    }
}



//struct ItemDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetail(itemData: items[2])
//    }
//}

#if DEBUG
struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ItemDetail(itemData: items[2]).environment(\.managedObjectContext, context)
    }
}
#endif
