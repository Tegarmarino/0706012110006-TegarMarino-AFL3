//
//  CategoryView.swift
//  0706012110006-TegarMarino-AFL3
//
//  Created by Tegar Marino on 20/04/23.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        NavigationView{
            Text("Hello world")
//            Set title untuk navigation bar
                .navigationTitle("Feautured")
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
