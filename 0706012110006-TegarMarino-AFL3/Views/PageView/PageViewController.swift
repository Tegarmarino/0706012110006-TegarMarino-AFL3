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
    @Binding var currentPage: Int
    
//    Menambahkan func ke PageViewController untuk membuat koordinator.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
//    Menambahkan metode makeUIViewController(context:) yang membuat UIPageViewController dengan konfigurasi yang diinginkan.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator

        return pageViewController
    }
    
//    Menambahkan metode updateUIViewController(_:context:) yang memanggil setViewControllers(_:direction:animated:) untuk menyediakan pengontrol tampilan untuk ditampilkan.
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
//    Membuat nested class Coordinator di dalam PageViewController.
//    Menambahkan kesesuaian UIPageViewControllerDataSource ke tipe Coordinator, dan implementasikan dua func pageViewController.
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
//        Inisialisasi array controller di koordinator menggunakan array page of view.
        var parent: PageViewController
        var controllers = [UIViewController]()

        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
            if completed,
                let visibleViewController = pageViewController.viewControllers?.first,
                let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
