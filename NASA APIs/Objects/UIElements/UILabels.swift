//
//  UILabel.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 16.05.2022.
//

import UIKit

class EarthLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont.systemFont(ofSize: 20, weight: .thin)
        textColor = .systemGray4
        textAlignment = .right
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
