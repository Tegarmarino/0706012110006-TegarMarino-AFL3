//
//  PageViewController.swift
//  0706012110006-TegarMarino-AFL3
//
//  Created by Tegar Marino on 20/04/23.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
//    Menambahkan metode makeUIViewController(context:) yang membuat UIPageViewController dengan konfigurasi yang diinginkan.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)

        return pageViewController
    }
    
//    Menambahkan metode updateUIViewController(_:context:) yang memanggil setViewControllers(_:direction:animated:) untuk menyediakan pengontrol tampilan untuk ditampilkan.
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }
}
