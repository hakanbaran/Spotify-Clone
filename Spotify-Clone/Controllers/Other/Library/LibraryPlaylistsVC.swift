//
//  LibraryPlaylistsVC.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 28.05.2023.
//

import UIKit

class LibraryPlaylistsVC: UIViewController {
    
    var playlists = [Playlist]()
    
    private let noPlaylistsView = ActionLabelView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        setUpNoPlaylistsView()
        
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        noPlaylistsView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        noPlaylistsView.center = view.center
    }
    
    private func setUpNoPlaylistsView() {
        view.addSubview(noPlaylistsView)
        noPlaylistsView.delegate = self
        noPlaylistsView.configure(with: ActionLabelViewViewModel(text: "You don't have any playlists yet...", actionTitle: "Create Playlist..."))
    }
    
    private func updateUI() {
        if playlists.isEmpty {
            // Show Label
            noPlaylistsView.isHidden = false
            
        } else {
            // Show Table
        }
    }
    
    private func fetchData() {
        APICaller.shared.gerCurrentUserPlaylists { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let playlists):
                    self?.playlists = playlists
                    self?.updateUI()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

extension LibraryPlaylistsVC: ActionLabelViewDelegate {
    func actionLabelViewDidTapButton(_ actionView: ActionLabelView) {
        // Show Creation UI
    }
    
    
}
