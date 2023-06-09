//
//  Landmark.swift
//  0706012110006-TegarMarino-AFL3
//
//  Created by Tegar Marino on 14/04/23.
//

import Foundation
import SwiftUI
import CoreLocation

// Identifiable digunakan agar saat panggil Landmark di file lanmark view tidak perlu menggunakan parameter ID
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
//    Menambahkan Enum category untuk CategoryView
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
//    Menambahkan properti yang dihitung ke struktur Landmark yang mengembalikan featured image, jika ada.
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
