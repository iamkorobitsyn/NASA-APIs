//
//  headerView.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 05.10.2022.
//

import Foundation
import UIKit

class HeaderView: UIView {
    let headerFrame = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 170))
    let headerImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        headerFrame.insertSubview(headerImage, at: 1)
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        headerImage.widthAnchor.constraint(equalTo: headerFrame.widthAnchor).isActive = true
        headerImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        headerImage.clipsToBounds = true
        headerImage.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
