//
//  AddNewItem.swift
//  Packing List
//
//  Created by Will Hustle on 12/31/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct AddNewItem: View {
    
    //establish connection to moc for core data use and presentation mode for sheet
    @Environment(\.managedObjectContext) var moc
    
    
    @Environment(\.presentationMode) var presentationMode
    
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
        NavigationView{
            //Add Item
            Form {
                 Text("Add \(itemData.name)").font(.largeTitle)
                Section(){
                    
                    TextField("Enter The Name Of The Item Here", text: $itemName)
                    
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
                        //dismiss sheet
                                                           self.presentationMode.wrappedValue.dismiss()
                            
                        }//error checking form values for empty. If not empty, show save button.
                            .disabled(itemName.isEmpty ||  itemPriority.isEmpty)
                        Spacer()
                    }
                }
            }
        }
    }
}
    struct AddNewItem_Previews: PreviewProvider {
        static var previews: some View {
            AddNewItem(itemData: items[2])
        }
}
