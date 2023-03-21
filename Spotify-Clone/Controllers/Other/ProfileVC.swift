//
//  ProfileVC.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 10.03.2023.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        APICaller.shared.getCurrentUserProfile { result in
            switch result {
                
            case .success(let model):
                break
                
            case .failure(let error):
                
                print(error.localizedDescription)
                
                
            }
        }
    }
    

    

}
