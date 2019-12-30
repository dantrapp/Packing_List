//
//  DefaultItems.swift
//  Packing List
//
//  Created by Will Hustle on 12/24/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import Foundation


//Item Structure
struct Item: Identifiable {
    var id = UUID()
    var name: String
    var categoryName: String
    //var person: String
    //var child: false
}

//Category structure
struct Category: Identifiable {
    var id = UUID()
    var name: String
    var categoryId: Int
    var categoryName: String
    //var imageName: String //sf icon
}

//CATEGORY OBJECTS (remember to order by categoryId)

//DEFAULT ITEMS CATEGORIES
let defaultCategories = [
    Category(name: "Clothing", categoryId: 0, categoryName: "Default"),
    Category( name: "Important Documents", categoryId: 1, categoryName: "Default"),
    Category( name: "Toiletries", categoryId: 2, categoryName: "Default"),
    Category( name: "Health", categoryId: 3, categoryName: "Default"),
    Category( name: "Essentials", categoryId: 4, categoryName: "Default"),
    Category( name: "Electronics", categoryId: 5, categoryName: "Default"),
    Category( name: "Accessories", categoryId: 6, categoryName: "Default"),


//TRANSPORTATION CATEGORIES

    Category( name: "Airplane", categoryId: 0, categoryName: "Transportation"),
    Category( name: "Car", categoryId: 1, categoryName: "Transportation"),
    Category( name: "Train", categoryId: 2, categoryName: "Transportation"),
    Category( name: "Bus", categoryId: 3, categoryName: "Transportation"),
    Category( name: "Boat", categoryId: 4, categoryName: "Transportation"),


//CHILD CATEGORIES

    Category(name: "Baby", categoryId: 0, categoryName: "Child"),
    Category(name: "Infant", categoryId: 1, categoryName: "Child"),
    Category(name: "Toddler", categoryId: 2, categoryName: "Child"),
    Category(name: "School-Aged", categoryId: 3, categoryName: "Child"),
]
//CATEGORYNAME ARRAY

let categories = ["Clothing", "Important Documents", "Toiletries", "Health", "Essentials", "Electronics", "Accessories"]

//DEFAULT ITEMS OBJECT
var items : [Item] = [
    
    //CLOTHING
    Item(name: "Hats", categoryName: "Clothing"),
    Item(name: "Shirts", categoryName: "Clothing"),
    Item(name: "Pants", categoryName: "Clothing"),
    Item(name: "Swimsuits", categoryName: "Clothing"),
    Item(name: "Shorts", categoryName: "Clothing"),
    Item(name: "Hoodies", categoryName: "Clothing"),
    Item(name: "Sweaters", categoryName: "Clothing"),
    Item(name: "Jackets", categoryName: "Clothing"),
    Item(name: "Socks", categoryName: "Clothing"),
    Item(name: "Underwear", categoryName: "Clothing"),
    Item(name: "Tank Tops", categoryName: "Clothing"),
    //Electronics
    Item(name: "Macbook", categoryName: "Electronics"),
    Item(name: "Macbook Adapter", categoryName: "Electronics"),
    Item(name: "iPad", categoryName: "Electronics"),
    Item(name: "iPhone", categoryName: "Electronics"),
    
]
