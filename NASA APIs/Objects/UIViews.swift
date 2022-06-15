//
//  UIView.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 28.05.2022.
//

import Foundation
import UIKit

class CustomNavigationViewWithTheEarth: UIView {
    
    let earthEllypseTwo = UIImageView()
    let earthEllypseOne = UIImageView()
    let earthShape = UIImageView()
    
    override init (frame:CGRect) {
        super.init(frame: frame)
        
        addSubview(earthEllypseTwo)
        addSubview(earthEllypseOne)
        addSubview(earthShape)
        
        earthEllypseTwo.translatesAutoresizingMaskIntoConstraints = false
        earthEllypseOne.translatesAutoresizingMaskIntoConstraints = false
        earthShape.translatesAutoresizingMaskIntoConstraints = false

        earthEllypseTwo.widthAnchor.constraint(equalToConstant: 60).isActive = true
        earthEllypseOne.heightAnchor.constraint(equalToConstant: 60).isActive = true
        earthEllypseTwo.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        earthEllypseTwo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        earthEllypseOne.widthAnchor.constraint(equalToConstant: 50).isActive = true
        earthEllypseOne.heightAnchor.constraint(equalToConstant: 50).isActive = true
        earthEllypseOne.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        earthEllypseOne.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        earthShape.widthAnchor.constraint(equalToConstant: 45).isActive = true
        earthShape.heightAnchor.constraint(equalToConstant: 45).isActive = true
        earthShape.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 3).isActive = true
        earthShape.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
        
        earthEllypseTwo.image = UIImage(named: "earthEllypseTwo")?.withTintColor(.upGradient)
        earthEllypseTwo.contentMode = .scaleAspectFit
        
        earthEllypseOne.image = UIImage(named: "earthEllypseOne")?.withTintColor(.upGradient)
        earthEllypseOne.contentMode = .scaleAspectFit
        
        earthShape.image = UIImage(named: "earthShape")?.withTintColor(.upGradient)
        earthShape.contentMode = .scaleAspectFit
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
