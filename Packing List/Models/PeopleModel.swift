//
//  PeopleModel.swift
//  Packing List
//
//  Created by Will Hustle on 1/18/20.
//  Copyright © 2020 Will Hustle. All rights reserved.
//

import Foundation

//Item Structure
struct Person: Identifiable {
    var id = UUID()
    var firstName : String
    var gender : String
    var adultOrChild: String
    var peopleRelationship : String
}
