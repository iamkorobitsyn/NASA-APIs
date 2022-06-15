//
//  EarthTwoVC.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 25.05.2022.
//

import UIKit

class SpaceXVC: UIViewController {
    
    let testBar = UIView()
    
    let backgroundImage = UIImageView()
    let backgroundLogo = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImage)
        
        view.addSubview(testBar)
        
        testBar.translatesAutoresizingMaskIntoConstraints = false
        testBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        testBar.heightAnchor.constraint(equalToConstant: 107).isActive = true
        testBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        testBar.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
      
        
        backgroundImage.image = UIImage(named: "TabBarNavigationBar")
     
        backgroundImage.contentMode = .scaleAspectFit
       
    }
}
