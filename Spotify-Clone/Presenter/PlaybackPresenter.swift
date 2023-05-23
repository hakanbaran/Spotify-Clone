//
//  PlaybackPresenter.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 23.05.2023.
//

import Foundation
import UIKit


final class PlaybackPresenter {
    static func startPlayback (from viewController: UIViewController, track: AudioTrack) {
        let vc = PlayerVC()
        viewController.present(vc, animated: true)
        
    }
    
    static func startPlayback (from viewController: UIViewController, tracks: [AudioTrack]) {
        let vc = PlayerVC()
        viewController.present(vc, animated: true)
        
    }
    
    
}
