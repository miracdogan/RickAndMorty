//
//  UIImageView+Extension.swift
//  RickAndMorty
//
//  Created by Miraç Doğan on 24.01.2023.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(with url: URL) {
        self.kf.setImage(with: url)
    }
}
