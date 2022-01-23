//
//  ImageVIew.swift
//  news
//
//  Created by yulin on 2022/1/24.
//

import Foundation
import UIKit
extension UIImageView {

    func loadImage(_ urlString: String?, placeHolder: UIImage? = nil) {

        guard urlString != nil else { return }

        let url = URL(string: urlString!)

        self.kf.indicatorType = .activity
        self.kf.setImage(with: url, placeholder: placeHolder)

    }
}
