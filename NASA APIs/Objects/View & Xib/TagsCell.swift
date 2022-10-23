//
//  TagsCell.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 07.10.2022.
//

import UIKit

class TagsCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        label.textColor = UIColor.label.withAlphaComponent(0.8)
        label.font = UIFont.systemFont(ofSize: 18, weight: .thin)
    }

    
}
