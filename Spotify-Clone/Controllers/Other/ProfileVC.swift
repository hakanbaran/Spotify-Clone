//
//  ProfileVC.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 10.03.2023.
//

import UIKit

class ProfileVC: UIViewController {
    
    private let tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        
        return tableView
        
        
        
    }()
    
    
    private var models = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchProfile()
        
        view.backgroundColor = .systemBackground
        
        

        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        
    }
    
    
    
    private func fetchProfile() {
        APICaller.shared.getCurrentUserProfile { [weak self] result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let model):
                    self?.updateUI(with: model)
                    
                case .failure(let error):
                    self?.failedToGetProfile()
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func updateUI(with model: UserProfile) {
        
        tableView.isHidden = false
        
        // CONFIGURE TABLE MODELS
        
        models.append("Full Name: \(model.display_name)")
        models.append("Email Address: \(model.email)")
        models.append("User ID: \(model.id)")
        models.append("Plan: \(model.product)")
        
        
        
        
        
        
        tableView.reloadData()
        
        
    }
    
    private func failedToGetProfile() {
        
        let label = UILabel(frame: .zero)
        label.text = "Failed to load Profile..."
        label.sizeToFit()
        label.textColor = .secondaryLabel
        view.addSubview(label)
        label.center = view.center
        
    }
    
}

// MARK: - TABLEVİEW

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
}
