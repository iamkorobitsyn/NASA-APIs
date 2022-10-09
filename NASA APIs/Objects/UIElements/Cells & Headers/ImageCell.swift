//
//  ImageCell.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 07.10.2022.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var pictureDescription: UILabel!
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var viewContains: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewContains?.backgroundColor = UIColor.systemGray4.withAlphaComponent(0.5)
        viewContains?.layer.cornerRadius = 7
//        picture?.layer.cornerRadius = 7
//        picture?.layer.borderWidth = 0.2
//        picture?.layer.borderColor = UIColor.label.cgColor
        
//        viewContains?.alpha = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
