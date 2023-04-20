//
//  PageView.swift
//  0706012110006-TegarMarino-AFL3
//
//  Created by Tegar Marino on 20/04/23.
//

import SwiftUI

// Buat file tampilan SwiftUI baru, beri nama PageView.swift, dan perbarui tipe PageView untuk mendeklarasikan PageViewController sebagai child dari PageView.
struct PageView<Page: View>: View {
    var pages: [Page]
    
//    Mendeklarasikan variabel @State di PageView, dan meneruskan Binding ke properti saat membuat child class PageViewController.
    @State private var currentPage = 1
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)

        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
