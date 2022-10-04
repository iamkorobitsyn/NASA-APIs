//
//  UIButton.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 15.05.2022.
//

import UIKit

class EarthButton: UIButton {
    
    let earthImage = UIImageView()
    let earthEllypseOne = UIImageView()
    let earthEllypseTwo = UIImageView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(earthImage)
        addSubview(earthEllypseOne)
        addSubview(earthEllypseTwo)
        
        earthImage.translatesAutoresizingMaskIntoConstraints = false
        earthEllypseOne.translatesAutoresizingMaskIntoConstraints = false
        earthEllypseTwo.translatesAutoresizingMaskIntoConstraints = false
        
        earthImage.widthAnchor.constraint(
            equalToConstant: 90).isActive = true
        earthImage.heightAnchor.constraint(
            equalToConstant: 90).isActive = true
        earthImage.centerXAnchor.constraint(
            equalTo: self.centerXAnchor, constant: 7).isActive = true
        earthImage.centerYAnchor.constraint(
            equalTo: self.centerYAnchor, constant: 0).isActive = true

        earthEllypseOne.centerXAnchor.constraint(
            equalTo: self.centerXAnchor, constant: 0).isActive = true
        earthEllypseOne.centerYAnchor.constraint(
            equalTo: self.centerYAnchor, constant: 0).isActive = true
        earthEllypseOne.widthAnchor.constraint(
            equalToConstant: 110).isActive = true
        earthEllypseOne.heightAnchor.constraint(
            equalToConstant: 110).isActive = true
        
        earthEllypseTwo.centerXAnchor.constraint(
            equalTo: self.centerXAnchor, constant: 0).isActive = true
        earthEllypseTwo.centerYAnchor.constraint(
            equalTo: self.centerYAnchor, constant: 0).isActive = true
        earthEllypseTwo.widthAnchor.constraint(
            equalToConstant: 140).isActive = true
        earthEllypseTwo.heightAnchor.constraint(
            equalToConstant: 140).isActive = true

        
        earthImage.image = UIImage(named: "earthShape")
        earthImage.contentMode = .scaleAspectFit

        earthEllypseOne.image = UIImage(named: "earthEllypseOne")
        earthEllypseOne.contentMode = .scaleAspectFill
        
        earthEllypseTwo.image = UIImage(named: "earthEllypseTwo")
        earthEllypseTwo.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


