//
//  AllCategoriesResponse.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 13.05.2023.
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}


struct Categories: Codable {
    let items: [Category]
}


struct Category: Codable {
    let icons: [APIImage]
    let id: String
    let name: String
}


