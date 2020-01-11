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
    var peopleRelationship = ""
    
    var body: some View {
        VStack {
            HStack{
                Text("😀")
                    .foregroundColor(Color.blue)
                
                Text(firstName)
                    .font(.custom("Arial", size: 25))
                    .lineLimit(1)
                .frame(width: 220, alignment: .leading)
            }
            HStack{
            Text("\(adultOrChild)")
                .font(.custom("Arial", size: 15))
                .lineLimit(1)
            
            Text(gender)
                .font(.custom("Arial", size: 15))
                .lineLimit(1)
            Text(peopleRelationship)
                .font(.custom("Arial", size: 15))
                .lineLimit(1)
            }
            .frame(width: 250, alignment: .leading)
            
        }
        .frame(width: 250, alignment: .leading)
    }
}



struct AddPeopleRow_Previews: PreviewProvider {
    static var previews: some View {
        AddPeopleRow(firstName: "Dan", gender: "Male", adultOrChild: "Adult")
    }
}
