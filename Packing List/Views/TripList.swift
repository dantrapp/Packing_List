//
//  TripList.swift
//  Packing List
//
//  Created by Will Hustle on 12/25/19.
//  Copyright © 2019 Will Hustle. All rights reserved.
//

import SwiftUI

struct TripList: View {
    var body: some View {
        Text("""

*** This is the main view for all users that have added a trip ***

List all upcoming trips in clickable image List format. 1 Image = Fullscreen. 2 Images = 50% each, 3 images = 33.3% - this way.

Split into List Sections so there's a tiny break between images.

""")
    }
}

struct TripList_Previews: PreviewProvider {
    static var previews: some View {
        TripList()
    }
}
