//
//  ViewController.swift
//  VKNewsFeed
//
//  Created by admin on 25.05.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
        view.backgroundColor = .red
    }

    @IBAction func singInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }

}

