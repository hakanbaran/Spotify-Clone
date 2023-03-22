//
//  SettingsModels.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 21.03.2023.
//

import Foundation

struct Section {
    
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
