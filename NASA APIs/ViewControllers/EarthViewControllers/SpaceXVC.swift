//
//  EarthTwoVC.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 25.05.2022.
//

import UIKit

class SpaceXVC: UIViewController {
    
    let backgroundImage = UIImageView()
    let backgroundLogo = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImage)

        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
      
        
        backgroundImage.image = UIImage(named: "TabBarNavigationBar")
     
        backgroundImage.contentMode = .scaleAspectFit
       
    }
}
