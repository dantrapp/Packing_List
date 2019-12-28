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
                    Text(firstName)
                        .font(.headline)
                    
                    VStack(alignment: .leading){
                        Text(gender)
                            .font(.headline)
                        
                        Text("\(adultOrChild)")
                            .font(.custom("Arial", size: 10))
                        .lineLimit(3)
                        
                    }
                }
            }
        }
    


struct AddPeopleRow_Previews: PreviewProvider {
    static var previews: some View {
        AddPeopleRow(firstName: "Dan", gender: "Male", adultOrChild: "Adult")
    }
}
