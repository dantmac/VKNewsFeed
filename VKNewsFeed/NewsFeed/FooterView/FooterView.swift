//
//  FooterView.swift
//  VKNewsFeed
//
//  Created by admin on 01.06.2021.
//

import Foundation
import UIKit

class FooterView: UIView {
    
    private var postCountLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.631372549, green: 0.6470588235, blue: 0.662745098, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.hidesWhenStopped = true
        return loader
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(postCountLabel)
        addSubview(loader)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        
        postCountLabel.anchor(top: topAnchor,
                              leading: leadingAnchor,
                              bottom: nil,
                              trailing: trailingAnchor,
                              padding: UIEdgeInsets(top: 8, left: 20, bottom: 777, right: 20))
        
        loader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loader.topAnchor.constraint(equalTo: postCountLabel.bottomAnchor, constant: 8).isActive = true
    }
    
    func showLoader() {
        loader.startAnimating()
    }
    
    func setTitle(_ title: String?) {
        loader.stopAnimating()
        postCountLabel.text = title
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
