//
//  EarthNavigationController.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 26.05.2022.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.tintColor = UIColor.whiteColor.withAlphaComponent(0.7)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
