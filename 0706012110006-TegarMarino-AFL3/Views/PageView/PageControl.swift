//
//  PageControl.swift
//  0706012110006-TegarMarino-AFL3
//
//  Created by Tegar Marino on 20/04/23.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
//        Menambahkan Coordinator sebagai target untuk event valueChanged, tentukan metode updateCurrentPage(sender:) sebagai tindakan yang harus dilakukan.
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
//    Memuat tipe nested Coordinator di PageControl, dan tambahkan metode makeCoordinator() untuk membuat dan mengembalikan koordinator baru.
    class Coordinator: NSObject {
        var control: PageControl

        init(_ control: PageControl) {
                self.control = control
        }

        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
