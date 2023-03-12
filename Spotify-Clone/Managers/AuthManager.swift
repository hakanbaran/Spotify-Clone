//
//  AuthManager.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 10.03.2023.
//

import Foundation

final class AuthManager {
    
    class Constants {
        static let ClientID = "PASTE YOUR CLIENT ID"
        static let clientSecret = "PASTE YOUR SECRET ID"
    }
    
    static let shared = AuthManager()
    
    private init(){}
    
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
