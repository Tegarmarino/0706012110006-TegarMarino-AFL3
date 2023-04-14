//
//  CircleImage.swift
//  0706012110006-TegarMarino-AFL3
//
//  Created by Tegar Marino on 11/04/23.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtleRock")
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
