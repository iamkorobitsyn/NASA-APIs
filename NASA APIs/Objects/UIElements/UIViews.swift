//
//  UIView.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 28.05.2022.
//

import Foundation
import UIKit

class CustomNavigationViewWithTheEarth: UIView {
    
    let backgroundNavigation = UIView()
    
    let firstNavigationRing = UIImageView()
    let secondNavigationRing = UIImageView()
    
    override init (frame:CGRect) {
        super.init(frame: frame)

        addSubview(firstNavigationRing)
        addSubview(secondNavigationRing)
        
        firstNavigationRing.translatesAutoresizingMaskIntoConstraints = false
        secondNavigationRing.translatesAutoresizingMaskIntoConstraints = false

        firstNavigationRing.widthAnchor.constraint(equalToConstant: 50).isActive = true
        firstNavigationRing.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstNavigationRing.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -14).isActive = true
        firstNavigationRing.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        secondNavigationRing.widthAnchor.constraint(equalToConstant: 50).isActive = true
        secondNavigationRing.heightAnchor.constraint(equalToConstant: 50).isActive = true
        secondNavigationRing.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 14).isActive = true
        secondNavigationRing.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        firstNavigationRing.image = UIImage(named: "secondRing")?.withTintColor(.whiteColor)
        firstNavigationRing.contentMode = .scaleAspectFit
        
        secondNavigationRing.image = UIImage(named: "firstRing")?.withTintColor(.whiteColor)
        secondNavigationRing.contentMode = .scaleAspectFit
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
