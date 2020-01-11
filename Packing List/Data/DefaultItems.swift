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
    var date = Date()
    var categoryName: String
    var gender: String //Male, Female or Unisex
    var adultChild: String //Adult, Child or Both
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
    Item(name: "Hats", categoryName: "Clothing", gender: "Unisex", adultChild: "Both"),
    Item(name: "Dresses", categoryName: "Clothing", gender: "Female", adultChild: "Both"),
    Item(name: "Casual Shirts", categoryName: "Clothing", gender: "Unisex", adultChild: "Both"),
    Item(name: "Dress Shirts", categoryName: "Clothing", gender: "Unisex", adultChild: "Both"),
    Item(name: "Casual Pants", categoryName: "Clothing", gender: "Unisex", adultChild: "Both"),
    Item(name: "Dress Pants", categoryName: "Clothing", gender: "Unisex", adultChild: "Both"),
    Item(name: "Casual Shoes", categoryName: "Clothing", gender: "Unisex", adultChild: "Both"),
    Item(name: "Dress Shoes", categoryName: "Clothing", gender: "Unisex", adultChild: "Both"),
    Item(name: "Swimsuits", categoryName: "Clothing", gender: "Female", adultChild: "Both"),
    Item(name: "Shorts", categoryName: "Clothing", gender: "Unisex", adultChild: "Both"),
    Item(name: "Hoodies", categoryName: "Clothing", gender: "Unisex", adultChild: "Both"),
    Item(name: "Sweaters", categoryName: "Clothing", gender: "Unisex", adultChild: "Both"),
    Item(name: "Jackets", categoryName: "Clothing", gender: "Unisex", adultChild: "Both"),
    Item(name: "Socks", categoryName: "Clothing", gender: "Unisex", adultChild: "Both"),
    Item(name: "Underwear", categoryName: "Clothing", gender: "Unisex", adultChild: "Both"),
    Item(name: "Tank Tops", categoryName: "Clothing", gender: "Unisex", adultChild: "Adult"),
    Item(name: "Pajamas", categoryName: "Clothing", gender: "Unisex", adultChild: "Both"),
    Item(name: "Belts", categoryName: "Clothing", gender: "Unisex", adultChild: "Adult"),
    //Electronics
    Item(name: "Laptop", categoryName: "Electronics", gender: "Unisex", adultChild: "Both"),
    Item(name: "Cellphone", categoryName: "Electronics", gender: "Unisex", adultChild: "Both"),
    Item(name: "Laptop Charger", categoryName: "Electronics", gender: "Unisex", adultChild: "Both"),
    Item(name: "Tablets", categoryName: "Electronics", gender: "Unisex", adultChild: "Both"),
    Item(name: "Cellphone Charger", categoryName: "Electronics", gender: "Unisex", adultChild: "Both"),
    Item(name: "Powerbank", categoryName: "Electronics", gender: "Unisex", adultChild: "Both"),
    Item(name: "USB Travel Adapter", categoryName: "Electronics", gender: "Unisex", adultChild: "Both"),
    //Important Documents
    Item(name: "Passports", categoryName: "Important Documents", gender: "Unisex", adultChild: "Both"),
    Item(name: "Birth Certificates", categoryName: "Important Documents", gender: "Unisex", adultChild: "Both"),
    Item(name: "Visas", categoryName: "Important Documents", gender: "Unisex", adultChild: "Both"),
    Item(name: "Drivers Licenses/ID Cards", categoryName: "Important Documents", gender: "Unisex", adultChild: "Both"),
    //Airplane
    Item(name: "Boarding Passes/Tickets", categoryName: "Airplane", gender: "Unisex", adultChild: "Both"),
    Item(name: "Travel/Neck Pillow", categoryName: "Airplane", gender: "Unisex", adultChild: "Both"),
    Item(name: "Headphones", categoryName: "Airplane", gender: "Unisex", adultChild: "Both"),
    Item(name: "Headphone Jack Splitter", categoryName: "Airplane", gender: "Unisex", adultChild: "Both"),
    Item(name: "Earplugs", categoryName: "Airplane", gender: "Unisex", adultChild: "Both"),
    Item(name: "Empty Water Bottle", categoryName: "Airplane", gender: "Unisex", adultChild: "Both"),
    //Baby
    Item(name: "Baby Bottles", categoryName: "Baby", gender: "Unisex", adultChild: "Child"),
    Item(name: "Infant Formula", categoryName: "Baby", gender: "Unisex", adultChild: "Child"),
    Item(name: "Diaper Bag", categoryName: "Baby", gender: "Unisex", adultChild: "Child"),
    Item(name: "Wipes", categoryName: "Baby", gender: "Unisex", adultChild: "Child"),
    Item(name: "Baby Food", categoryName: "Baby", gender: "Unisex", adultChild: "Child"),
    Item(name: "Baby Carrier", categoryName: "Baby", gender: "Unisex", adultChild: "Child"),
    Item(name: "Baby Clothing", categoryName: "Baby", gender: "Unisex", adultChild: "Child"),
    Item(name: "Diapers", categoryName: "Baby", gender: "Unisex", adultChild: "Child"),
    Item(name: "Breast Pump", categoryName: "Baby", gender: "Unisex", adultChild: "Child"),
    Item(name: "Baby Toys", categoryName: "Baby", gender: "Unisex", adultChild: "Child"),
    Item(name: "Baby's Favorite Thing(s)", categoryName: "Baby", gender: "Unisex", adultChild: "Child"),
    Item(name: "Blanket", categoryName: "Baby", gender: "Unisex", adultChild: "Child"),
    Item(name: "Pacifier", categoryName: "Baby", gender: "Unisex", adultChild: "Child"),
    Item(name: "Baby Medication", categoryName: "Baby", gender: "Unisex", adultChild: "Child"),
    //ESSENTIALS
    Item(name: "Cameras", categoryName: "Essentials", gender: "Unisex", adultChild: "Both"),
    Item(name: "Keys", categoryName: "Essentials", gender: "Unisex", adultChild: "Both"),
    Item(name: "Wallet", categoryName: "Electronics", gender: "Unisex", adultChild: "Adult"),
    //Health & Medical
    Item(name: "Prescription Medication", categoryName: "Health", gender: "Unisex", adultChild: "Both"),
    Item(name: "Contact Lenses", categoryName: "Health", gender: "Unisex", adultChild: "Both"),
    Item(name: "Contact Lens Solution", categoryName: "Health", gender: "Unisex", adultChild: "Both"),
    Item(name: "Glasses", categoryName: "Health", gender: "Unisex", adultChild: "Both"),
    Item(name: "Vitamins", categoryName: "Health", gender: "Unisex", adultChild: "Both"),
    Item(name: "Contraceptives", categoryName: "Health", gender: "Unisex", adultChild: "Adult"),
    Item(name: "Pill Case", categoryName: "Health", gender: "Unisex", adultChild: "Both"),
    Item(name: "Bug Repellent", categoryName: "Health", gender: "Unisex", adultChild: "Both"),
    Item(name: "Vaccinations", categoryName: "Health", gender: "Unisex", adultChild: "Both"),
    Item(name: "Feminine Products", categoryName: "Health", gender: "Female", adultChild: "Adult"),
    //Toiletries
    Item(name: "Shampoo", categoryName: "Toiletries", gender: "Unisex", adultChild: "Both"),
    Item(name: "Deodorant", categoryName: "Toiletries", gender: "Unisex", adultChild: "Adult"),
        Item(name: "Conditioner", categoryName: "Toiletries", gender: "Unisex", adultChild: "Both"),
        Item(name: "Soap", categoryName: "Toiletries", gender: "Unisex", adultChild: "Both"),
        Item(name: "Toothbrushes", categoryName: "Toiletries", gender: "Unisex", adultChild: "Both"),
        Item(name: "Toothpaste", categoryName: "Toiletries", gender: "Unisex", adultChild: "Both"),
        Item(name: "Dental Floss", categoryName: "Toiletries", gender: "Unisex", adultChild: "Both"),
        Item(name: "Hand Sanitizer", categoryName: "Toiletries", gender: "Unisex", adultChild: "Both"),
        Item(name: "Razor", categoryName: "Toiletries", gender: "Unisex", adultChild: "Adult"),
        Item(name: "Shaving Cream", categoryName: "Toiletries", gender: "Unisex", adultChild: "Adult"),
        Item(name: "Bikini Wax", categoryName: "Toiletries", gender: "Female", adultChild: "Adult"),
        Item(name: "Nail Clippers", categoryName: "Toiletries", gender: "Unisex", adultChild: "Both"),
        Item(name: "Makeup", categoryName: "Toiletries", gender: "Female", adultChild: "Adult"),
        Item(name: "Lotions & Moisturizers", categoryName: "Toiletries", gender: "Unisex", adultChild: "Both"),
        Item(name: "Hair Styling Products", categoryName: "Toiletries", gender: "Unisex", adultChild: "Both"),
        Item(name: "Hairbrushes/Combs", categoryName: "Toiletries", gender: "Unisex", adultChild: "Both"),
        Item(name: "Curling/Flat Irons", categoryName: "Toiletries", gender: "Female", adultChild: "Adult"),
        Item(name: "Hair Dryer", categoryName: "Toiletries", gender: "Unisex", adultChild: "Adult"),
        Item(name: "Towels", categoryName: "Toiletries", gender: "Unisex", adultChild: "Both"),
    
    
]

let sortedNames = items.sorted {
    $0.name < $1.name
}
let sortedCategories = items.sorted {
    $0.categoryName < $1.categoryName
}


