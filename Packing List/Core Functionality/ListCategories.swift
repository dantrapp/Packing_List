//
//  ListCategory.swift
//  Packing List
//
//  Created by Will Hustle on 12/24/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct ListCategories: View {
    
        //pass in category Struct to pull objects and properties
        var category: Category
        
        
        var body: some View {
            

            
            //command -> embed in hstack
            HStack {
                
                //Category Name
                Text(category.name).font(.system(size: 20)).minimumScaleFactor(0.8).lineLimit(1)
                
                //add Spacer
                Spacer()
            }
            
        }
    }

    struct ListCategories_Previews: PreviewProvider {
        static var previews: some View {
            ListCategories(category: defaultCategories[0]).previewLayout(.fixed(width: 500, height: 50))
        }
    }
