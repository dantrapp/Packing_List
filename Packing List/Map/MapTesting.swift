//
//  MapTesting.swift
//  Packing List
//
//  Created by Will Hustle on 1/6/20.
//  Copyright © 2020 Will Hustle. All rights reserved.
//

import SwiftUI

struct MapTesting: View {
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct MapTesting_Previews: PreviewProvider {
    static var previews: some View {
        MapTesting()
    }
}
