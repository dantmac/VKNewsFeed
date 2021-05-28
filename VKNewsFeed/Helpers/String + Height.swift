//
//  String + Height.swift
//  VKNewsFeed
//
//  Created by admin on 28.05.2021.
//

import Foundation
import  UIKit

extension String {
    
    func heigth(width: CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        
        let size = self.boundingRect(with: textSize,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font: font],
                                     context: nil)
        return ceil(size.height)
    }
}
