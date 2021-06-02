//
//  GradientView.swift
//  VKNewsFeed
//
//  Created by admin on 02.06.2021.
//

import Foundation
import UIKit

class GradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
//    private var startColor: UIColor = #colorLiteral(red: 1, green: 0.5529411765, blue: 0.5450980392, alpha: 1)
//    private var endColor: UIColor = #colorLiteral(red: 1, green: 0.8745098039, blue: 0.5529411765, alpha: 1)
    
    private var startColor: UIColor = #colorLiteral(red: 0.1426828048, green: 0.5321028915, blue: 0.9647058824, alpha: 1)
       private var endColor: UIColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        setupGradientColors()
    }
    
    private func setupGradientColors() {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
}
