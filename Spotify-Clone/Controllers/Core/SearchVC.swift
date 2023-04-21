//
//  SearchVC.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 10.03.2023.
//

import UIKit

class SearchVC: UIViewController {
    
    let searchController: UISearchController = {
        let results = UIViewController()
        results.view.backgroundColor = .red
        let vc = UISearchController(searchResultsController: results)
        vc.searchBar.placeholder = "Songs, Artists, Albums"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        
        
    }
}

extension SearchVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let query = searchController.searchBar.text, !query.trimmingCharacters(in: .whitespaces).isEmpty else {return}
        
        print(query)
        
        
        // Perform Search
//        APICaller.shared.search
        
    }
    
    
}
