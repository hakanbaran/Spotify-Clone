//
//  LibraryPlaylistsResponse.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 30.05.2023.
//

import Foundation

struct LibraryPlaylistsResponse: Codable {
    let items: [Playlist]
}
