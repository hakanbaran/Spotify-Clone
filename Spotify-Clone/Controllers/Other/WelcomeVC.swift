//
//  WelcomeVC.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 10.03.2023.
//

import UIKit

class WelcomeVC: UIViewController {
    
    private let signInButton: UIButton = {
        
        let button = UIButton()
        
        button.backgroundColor = .white
        button.setTitle("Sign In with Spotify", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Spotify"
        view.backgroundColor = .systemGreen
        
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTabSignIn), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(
            x: 20,
            y: view.height-50-view.safeAreaInsets.bottom,
            width: view.width-40,
            height: 50
        )
    }
    
    
    
    @objc func didTabSignIn() {
        let vc = AuthVC()
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
        vc.completionHandler = { [weak self]success in
            
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
            
        }
        
        
    }
    
    private func handleSignIn(success: Bool) {
        
        //Log User in or yell at them for error
        
        guard success else {
            
            let alert = UIAlertController(title: "Oops", message: "Something went wrong when signin in...", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Dismiss...", style: .default)
            
            alert.addAction(alertAction)
            present(alert, animated: true)
            return
        }
        
        let mainAppTabBarVC = TabBarVC()
        mainAppTabBarVC.modalPresentationStyle = .fullScreen
        present(mainAppTabBarVC, animated: true)
    }
    
    
}
