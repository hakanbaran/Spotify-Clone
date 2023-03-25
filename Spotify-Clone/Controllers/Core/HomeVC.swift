//
//  ViewController.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 10.03.2023.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTabSettings))
        
        fetchData()
        
    }
    
    func fetchData() {
        APICaller.shared.getNewReleases { result in
            switch result {
            case .success(let model): break
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

