//
//  RecommendationsResponse.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 28.03.2023.
//

import Foundation

struct RecommendationsResponse: Codable {
    let tracks: [AudioTrack]
}
