//
//  ModelData.swift
//  0706012110006-TegarMarino-AFL3
//
//  Created by Tegar Marino on 14/04/23.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
//    mengupdate modelData untuk menamhkan instance profil pengguna yang tetap ada bahkan setelah pengguna menutup tampilan profil.
    @Published var profile = Profile.default
    
//    Mensetting agar isFeatured true
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
//    Menambahkan kunci untuk Category
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

var landmarks: [Landmark] = load("landmarkData.json")


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
