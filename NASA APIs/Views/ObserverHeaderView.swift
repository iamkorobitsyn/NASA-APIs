//
//  ObserverHeaderView.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 25.10.2022.
//

import Foundation
import UIKit

class ObserverHeaderView: UIView {
    
    private let image = UIImageView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 170)
        self.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        image.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        image.image = UIImage(named: "headerObservatory")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
