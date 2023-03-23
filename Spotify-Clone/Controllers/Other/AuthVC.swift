//
//  AuthVC.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 10.03.2023.
//

import UIKit
import WebKit

class AuthVC: UIViewController, WKNavigationDelegate {
    
    
    private let webView: WKWebView = {
       
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero,
                                configuration: config)
        return webView
    }()
    
    public var completionHandler: ((Bool) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sign In"
        view.backgroundColor = .systemBackground

        webView.navigationDelegate = self
        view.addSubview(webView)

        guard let url = AuthManager.shared.signInURL else {return}

        webView.load(URLRequest(url: url))
        
//        print(url)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        webView.frame = view.bounds
        
        
        
    }
    
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        
        guard let url = webView.url else {return}
        
        // Exchange the code for access token
        
        
        guard let code = URLComponents(string: url.absoluteString)?.queryItems?.first(where: {$0.name == "code" })?.value else {return}
        
        print("Hakan Baran")

        print("Code: \(code)")
        
        AuthManager.shared.exchengeCodeForToken(code: code) { [weak self] success in
            DispatchQueue.main.async {
                self?.navigationController?.popToRootViewController(animated: true)
                self?.completionHandler!(success)
            }
        }
        
        
    }
    


}
