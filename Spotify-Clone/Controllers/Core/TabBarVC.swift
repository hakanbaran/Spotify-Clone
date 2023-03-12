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


        let homeVC = UINavigationController(rootViewController: HomeVC())
        let searchVC = UINavigationController(rootViewController: SearchVC())
        let libraryVC = UINavigationController(rootViewController: LibraryVC())
        
        
        
        
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        libraryVC.tabBarItem.image = UIImage(systemName: "music.note.list")
        
        homeVC.title = "Home"
        searchVC.title = "Search"
        libraryVC.title = "Library"
       
        
        setViewControllers([homeVC, searchVC, libraryVC], animated: true)
        
        
    }
    

    

}
