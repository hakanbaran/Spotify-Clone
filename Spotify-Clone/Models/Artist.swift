//
//  Artist.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 10.03.2023.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let external_urls: [String: String]
    
}
