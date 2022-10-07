//
//  TagsCell.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 07.10.2022.
//

import UIKit

class TagsCell: UICollectionViewCell {

    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor.tertiarySystemGroupedBackground
        button.alpha = 0.8
        button.titleLabel?.tintColor = UIColor.label
        
    }
    @IBAction func touch(_ sender: UIButton) {
    }
    
}
