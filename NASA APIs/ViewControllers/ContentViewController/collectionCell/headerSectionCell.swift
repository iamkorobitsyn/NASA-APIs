//
//  headerSectionCell.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 20.11.2022.
//

import UIKit

class headerSectionCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        label.textColor = UIColor.label.withAlphaComponent(0.8)
        label.font = UIFont.systemFont(ofSize: 18, weight: .thin)
    }
    
}
