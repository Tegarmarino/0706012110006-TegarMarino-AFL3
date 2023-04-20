//
//  CategoryView.swift
//  0706012110006-TegarMarino-AFL3
//
//  Created by Tegar Marino on 20/04/23.
//

import SwiftUI

struct CategoryHome: View {
//    Membuat environment object untuk model data, agar bisa mengakses kunci Category dari model data
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView{
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())

//                Memanggil kuncit category yang ada di dalam model data dengan menggunakan ForEach yang di embed dengan list agar tampilannya bisa menjadi list
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
//                    Memanggil category row untuk ditambahkan kedalam category home
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
//            Set title untuk navigation bar
            .listStyle(.inset)
            .navigationTitle("Featured")
            
//            menambahkan tombol profil pengguna ke bilah navigasi menggunakan pengubah bilah alat, dan tampilkan tampilan ProfileHost saat pengguna mengetuknya.
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
