//
//  CategoryView.swift
//  0706012110006-TegarMarino-AFL3
//
//  Created by Tegar Marino on 20/04/23.
//

import SwiftUI

struct CategoryView: View {
//    Membuat environment object untuk model data, agar bisa mengakses kunci Category dari model data
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView{
            List {
//                Memanggil kuncit category yang ada di dalam model data dengan menggunakan ForEach yang di embed dengan list agar tampilannya bisa menjadi list
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    Text(key)
                }
            }
//            Set title untuk navigation bar
            .navigationTitle("Featured")
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
            .environmentObject(ModelData())
    }
}
