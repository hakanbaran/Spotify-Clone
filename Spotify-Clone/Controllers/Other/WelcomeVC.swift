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
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    private let overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.7
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        label.text = "Listen to Millions\nof Songs on\nthe go..."
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Spotify"
        view.backgroundColor = .black
        view.addSubview(imageView)
        view.addSubview(overlayView)
        view.addSubview(signInButton)
        view.addSubview(label)
        view.addSubview(logoImageView)
        signInButton.addTarget(self, action: #selector(didTabSignIn), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds
        overlayView.frame = view.bounds
        signInButton.frame = CGRect(
            x: 20,
            y: view.height-50-view.safeAreaInsets.bottom,
            width: view.width-40,
            height: 50
        )
        
        logoImageView.frame = CGRect(x: (view.width-120)/2, y: (view.height-350)/2, width: 120, height: 120)
        label.frame = CGRect(x: 30, y: logoImageView.bottom+30, width: view.width-60, height: 150)
        
        
        
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
