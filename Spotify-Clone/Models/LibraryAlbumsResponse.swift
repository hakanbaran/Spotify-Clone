//
//  LibraryAlbumsResponse.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 2.06.2023.
//

import Foundation

//struct LibraryAlbumsResponse: Codable {
//    let items: [Album]
//}

struct LibraryAlbumResponse: Codable {
    let items: [UserAlbumResponse]
}

struct UserAlbumResponse: Codable {
    let album: Album
    let added_at: String
}
