//
//  APICaller.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 10.03.2023.
//

import Foundation

final class APICaller {
    
    static let shared = APICaller()
    
    private init() {}
    
    public func getCurrentUserProfile(completion: @escaping(Result <UserProfile, Error>) -> Void) {
        
        
//        createRequest(with: <#T##URL?#>, type: <#T##HTTPMethod#>, completion: <#T##(URLRequest) -> Void#>)
        
    }
    
    // MARK: - Private
    
    enum HTTPMethod: String {
        case GET
        case POST
    }
    
    private func createRequest( with url: URL?, type: HTTPMethod, completion: @escaping (URLRequest) -> Void) {
        
        AuthManager.shared.withValidToken { token in
            
            guard let apiURL = url else {
                return
                
            }
            
            var request = URLRequest(url: apiURL)
            
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            request.httpMethod = type.rawValue
            
            request.timeoutInterval = 30
            completion(request)
            
        }
        
    }
        
        
    
    
    
    
    
}
