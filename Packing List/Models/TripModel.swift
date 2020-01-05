//
//  TripModel.swift
//  Packing List
//
//  Created by Will Hustle on 1/4/20.
//  Copyright © 2020 Will Hustle. All rights reserved.
//

import Foundation

//Item Structure
struct Trip: Identifiable {
    var id = UUID()
    var returns = Date()
    var departs = Date()
    var destination : String
    var people: Int32
}
