//
//  NewReleasesResponse.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 25.03.2023.
//

import Foundation

struct NewReleasesResponse: Codable {
    let albums: AlbumsResponse
}

struct AlbumsResponse: Codable {
    
    let items: [Album]
    
}

struct Album: Codable {
    let album_type: String
    let available_markets: [String]
    let id: String
    let name: String
    let release_date: String
    let images: [APIImage]
    let total_tracks: Int
    let artists: [Artist]
}

