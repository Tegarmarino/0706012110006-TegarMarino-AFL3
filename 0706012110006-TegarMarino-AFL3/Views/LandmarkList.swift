//
//  LandmarkList.swift
//  0706012110006-TegarMarino-AFL3
//
//  Created by Tegar Marino on 14/04/23.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView{
//        Memanggil  landmarkRow
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail()
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
