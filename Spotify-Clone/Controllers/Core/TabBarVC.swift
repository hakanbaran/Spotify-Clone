//
//  TabBarVC.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 10.03.2023.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let homeVC = UINavigationController(rootViewController: HomeVC())
//        let searchVC = UINavigationController(rootViewController: SearchVC())
//        let libraryVC = UINavigationController(rootViewController: LibraryVC())
//
//        homeVC.title = "Home"
//        searchVC.title = "Search"
//        libraryVC.title = "Library"
//
//        homeVC.navigationBar.tintColor = .label
//        searchVC.navigationBar.tintColor = .label
//        libraryVC.navigationBar.tintColor = .label
//
//        homeVC.tabBarItem.image = UIImage(systemName: "house")
//        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
//        libraryVC.tabBarItem.image = UIImage(systemName: "music.note.list")
//
//
//
//        homeVC.navigationItem.largeTitleDisplayMode = .always
//
//        setViewControllers([homeVC, searchVC, libraryVC], animated: true)
        
        let homeVC = HomeVC()
        let searchVC = SearchVC()
        let libraryVC = LibraryVC()
        
        
        homeVC.title = "Browse"
        searchVC.title = "Search"
        libraryVC.title = "Library"
        
        homeVC.navigationItem.largeTitleDisplayMode = .always
        searchVC.navigationItem.largeTitleDisplayMode = .always
        libraryVC.navigationItem.largeTitleDisplayMode = .always
        
        let navHome = UINavigationController(rootViewController: homeVC)
        let navSearch = UINavigationController(rootViewController: searchVC)
        let navLibrary = UINavigationController(rootViewController: libraryVC)
        
        navHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        navSearch.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        navLibrary.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 3)
        
        navHome.navigationBar.prefersLargeTitles = true
        navSearch.navigationBar.prefersLargeTitles = true
        navLibrary.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navHome, navSearch, navLibrary], animated: true)
        
        
    }
}


