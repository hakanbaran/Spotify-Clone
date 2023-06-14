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
    
    var index = 0
    
    var currentTrack: AudioTrack? {
        if let track = track, tracks.isEmpty {
            return track
        } else if let player = playerQueue, !tracks.isEmpty {
//            let item = player.currentItem
//            let items = player.items()
//            guard let index = items.firstIndex(where: {$0 == item}) else {
//                return nil
//            }
            return tracks[index]
            
        }
        return nil
    }
    
    var playerVC : PlayerVC?
    
    var player: AVPlayer?
    var playerQueue: AVQueuePlayer?
    
    
     func startPlayback (from viewController: UIViewController, track: AudioTrack) {
         
         guard let url = URL(string: track.preview_url ?? "") else {
             return
         }
         player = AVPlayer(url: url)
         player?.volume = 0.3
         self.track = track
         self.tracks = []
         let vc = PlayerVC()
         
         vc.title = track.name
         vc.dataSource = self
         vc.delegate = self
         vc.modalPresentationStyle = .fullScreen
         viewController.present(UINavigationController(rootViewController: vc), animated: true) { [weak self] in
             self?.player?.play()
             print("Hakan")
             
         }
         self.playerVC = vc
        
    }
    
     func startPlayback (from viewController: UIViewController, tracks: [AudioTrack]) {
         self.tracks = tracks
         self.track = nil
         
         self.playerQueue = AVQueuePlayer(items: tracks.compactMap({
             guard let url = URL(string: $0.preview_url ?? "") else {
                 return nil
             }
             return AVPlayerItem(url: url)
         }))
         self.playerQueue?.volume = 0
         self.playerQueue?.play()
         
        let vc = PlayerVC()
         
         vc.delegate = self
         vc.dataSource = self
        viewController.present(UINavigationController(rootViewController: vc), animated: true)
         print("Hakan2")
         self.playerVC = vc
         
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
        else if let player = playerQueue {
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
        } else if let player = playerQueue
         {
            player.advanceToNextItem()
            index += 1
            print(index)
            playerVC?.refreshUI()
        }
    }
    
    func didTapBackward() {
        if tracks.isEmpty {
            // Not playlist or album
            player?.pause()
            player?.play()
        }
        else if let firstItem = playerQueue?.items().first   {
            playerQueue?.pause()
            playerQueue?.removeAllItems()
            playerQueue = AVQueuePlayer(items: [firstItem])
            playerQueue?.play()
            playerQueue?.volume = 0
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
