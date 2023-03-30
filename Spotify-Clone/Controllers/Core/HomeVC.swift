//
//  ViewController.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 10.03.2023.
//

import UIKit

class HomeVC: UIViewController {
    
    private var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection in
        return Self.createSectionLayout(section: sectionIndex)
    })

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTabSettings))
        
        configureCollectionView()
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.frame = view.bounds
        
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    private static func createSectionLayout(section: Int) -> NSCollectionLayoutSection {
        
        // Item
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth((1.0)), heightDimension: .fractionalHeight(1.0)))
        
        // Group
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120)), repeatingSubitem: item, count: 1)
        
        // Section
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
        
    }
    
    
    
    
    
    
    func fetchData() {
        // Featured Playlists, Recommended Tracks, New Releases...
        APICaller.shared.getRecommendedGenres { result in
            switch result {
            case .success(let model):
                let genres = model.genres
                var seeds = Set<String>()
                
                while seeds.count < 5 {
                    
                    if let random = genres.randomElement() {
                        seeds.insert(random)
                    }
                }
                APICaller.shared.getRecommendations(genres: seeds) { _ in
                }
            case .failure(let error): break
            }
        }
    }
    
    
    
    
    
    
    @objc func didTabSettings() {
        
        let vc = SettingsVC()
        vc.title = "Settings"
        vc.navigationItem.largeTitleDisplayMode = .never
        
        navigationController?.pushViewController(vc, animated: true)
        
        
        
    }


}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemGreen
        return cell
    }
    
    
    
    
    
    
}

