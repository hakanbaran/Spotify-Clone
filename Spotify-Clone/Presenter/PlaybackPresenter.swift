//
//  PlaybackPresenter.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 23.05.2023.
//

import Foundation
import UIKit
import AVFoundation

protocol PlayerDataSource: AnyObject {
    var songName: String? { get }
    var subtitle: String? { get }
    var imageURL: URL? { get }
}

final class PlaybackPresenter {
    static let shared = PlaybackPresenter()
    
    private var track: AudioTrack?
    private var tracks = [AudioTrack]()
    
    var currentTrack: AudioTrack? {
        if let track = track, tracks.isEmpty {
            return track
        } else if !tracks.isEmpty {
            return tracks.first
        }
        return nil
    }
    
    var player: AVPlayer?
    
     func startPlayback (from viewController: UIViewController, track: AudioTrack) {
         
         guard let url = URL(string: track.preview_url ?? "") else {
             return
         }
         player = AVPlayer(url: url)
         player?.volume = 0.5
         self.track = track
         self.tracks = []
        let vc = PlayerVC()
        vc.title = track.name
         vc.dataSource = self
         vc.delegate = self
         viewController.present(UINavigationController(rootViewController: vc), animated: true) { [weak self] in
             self?.player?.play()
             
         }
        
    }
    
     func startPlayback (from viewController: UIViewController, tracks: [AudioTrack]) {
         self.tracks = tracks
         self.track = nil
        let vc = PlayerVC()
        viewController.present(UINavigationController(rootViewController: vc), animated: true)
    }
}

extension PlaybackPresenter: PlayerVCDelegate {
    func didTapPlayPause() {
        if let player = player {
            if player.timeControlStatus == .playing {
                player.pause()
            } else if player.timeControlStatus == .paused {
                player.play()
            }
        }
    }
    
    func didTapForward() {
        if tracks.isEmpty {
            // Not playlist or album
            player?.pause()
        } else {
            
        }
    }
    
    func didTapBackward() {
        if tracks.isEmpty {
            // Not playlist or album
            player?.pause()
            player?.play()
        } else {
            
        }
    }
    
    func didSlideSlider(_ value: Float) {
        player?.volume = value
    }
    
    
}


extension PlaybackPresenter: PlayerDataSource {
    var songName: String? {
        return currentTrack?.name
    }
    
    var subtitle: String? {
        return currentTrack?.artists?.first?.name
    }
    
    var imageURL: URL? {
        return URL(string: currentTrack?.album?.images.first?.url ?? "")
    }
    
    
}
