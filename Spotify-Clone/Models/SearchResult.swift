//
//  SearchResult.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 16.05.2023.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
