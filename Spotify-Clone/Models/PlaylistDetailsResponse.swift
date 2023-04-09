//
//  PlaylistDetailsResponse.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 9.04.2023.
//

import Foundation

struct PlaylistDetailsResponse: Codable {
    
    let description: String
    let external_urls: [String: String]
    let followers: FollowersResponse
    let id: String
    let images: [APIImage]
    let name: String
    let snapshot_id: String
    let tracks: PlaylistTracksResponse
}

struct FollowersResponse: Codable {
    let total: Int
}

struct PlaylistTracksResponse: Codable {
    let items: [PlaylistItem]
    
}

struct PlaylistItem: Codable {
    let track: AudioTrack
    
}
