//
//  AddPeopleRow.swift
//  Packing List
//
//  Created by Will Hustle on 12/28/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct AddPeopleRow: View {
    
    var firstName = ""
    var gender = ""
    var adultOrChild = ""
    
    var body: some View {
        HStack {
            Text("😀")
                .foregroundColor(Color.blue)
            
            Text(firstName)
                .font(.custom("Arial", size: 25))
                .lineLimit(1)
            VStack{
            Text("\(adultOrChild)")
                .font(.custom("Arial", size: 15))
                .lineLimit(1)
            
            Text(gender)
                .font(.custom("Arial", size: 15))
                .lineLimit(1)
            }
            
            
        }
    }
}



struct AddPeopleRow_Previews: PreviewProvider {
    static var previews: some View {
        AddPeopleRow(firstName: "Dan", gender: "Male", adultOrChild: "Adult")
    }
}
