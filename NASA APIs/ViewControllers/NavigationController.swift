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
        navigationBar.prefersLargeTitles = true
        navigationBar.tintColor = UIColor.label
    }
}
