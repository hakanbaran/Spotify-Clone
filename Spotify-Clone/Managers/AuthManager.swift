//
//  AuthManager.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 10.03.2023.
//

import Foundation

final class AuthManager {
    
    class Constants {
        
        
        static let clientID = "Enter ClientID"
        static let clientSecret = "Enter ClientSecret"
        static let scopes = "user-read-private"
        static let redirectURI = "https://github.com/hakanbaran"
    }
    
    static let shared = AuthManager()
    
    private init(){}
    
    public var signInURL: URL? {
        
        
        
        
        let baseURL = "https://accounts.spotify.com/authorize"
        

        
        let urlString = "\(baseURL)?response_type=code&client_id=\(Constants.clientID)&scope=\(Constants.scopes)&redirect_uri=\(Constants.redirectURI)&show_dialog=TRUE"

        
          
        
        return URL(string: urlString)
        
        
    }
    
    var isSignedIn: Bool {
        return false
    }
     
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
    
    
    
}
