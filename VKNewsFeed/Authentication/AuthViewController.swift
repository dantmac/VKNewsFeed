//
//  ViewController.swift
//  VKNewsFeed
//
//  Created by admin on 25.05.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
        view.backgroundColor = #colorLiteral(red: 0.3529411765, green: 0.7921568627, blue: 0.9647058824, alpha: 1)
        signInButton.layer.cornerRadius = 10
    }
    
    @IBAction func singInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
}
