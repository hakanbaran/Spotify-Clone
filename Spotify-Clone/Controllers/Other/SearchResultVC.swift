//
//  SearchResultVC.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 10.03.2023.
//

import UIKit

class SearchResultVC: UIViewController {
    private var results: [SearchResult] = []
    
    
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.isHidden = true
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    public func update(with results: [SearchResult]) {
        self.results = results
        tableView.reloadData()
        tableView.isHidden = results.isEmpty
    }
    

}

extension SearchResultVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hakan"
        return cell
    }
    
    
}
