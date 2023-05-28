//
//  LibraryVC.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 10.03.2023.
//

import UIKit

class LibraryVC: UIViewController {
    
    private let playlistsVC = LibraryPlaylistsVC()
    private let albumsVC = LibraryAlbumsVC()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private let toggleView = LibraryToggleView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.backgroundColor = .yellow
        scrollView.contentSize = CGSize(width: view.width*2, height: scrollView.height)
        addChildren()
        
        view.addSubview(toggleView)
        toggleView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = CGRect(x: 0, y: view.safeAreaInsets.top+55, width: view.width, height: view.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom-55)
        toggleView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: 200, height: 55)
    }
    
    private func addChildren() {
        addChild(playlistsVC)
        scrollView.addSubview(playlistsVC.view)
        playlistsVC.view.frame = CGRect(x: 0, y: 0, width: scrollView.width, height: scrollView.height)
        playlistsVC.didMove(toParent: self)
    }
}

extension LibraryVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x >= (view.width-100) {
            toggleView.update(for: .album)
        } else {
            toggleView.update(for: .playlist)
        }
        
    }
}

extension LibraryVC: LibraryToggleViewDelegate {
    func libraryToggleViewDidTapPlaylists(_ toggleView: LibraryToggleView) {
        scrollView.setContentOffset(.zero, animated: true)
    }
    
    func libraryToggleViewDidTapAlbums(_ toggleView: LibraryToggleView) {
        scrollView.setContentOffset(CGPoint(x: view.width, y: 0), animated: true)
        
    }
    
    
}
