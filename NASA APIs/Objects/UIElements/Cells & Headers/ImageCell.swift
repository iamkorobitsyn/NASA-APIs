//
//  TableViewCell.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 14.10.2022.
//
import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var pictureOutlet: UIImageView!
    @IBOutlet weak var pictureDescription: UILabel!
    @IBOutlet weak var deployButtonOutlet: UIButton!
    @IBOutlet weak var addButtonOutlet: UIButton!
    @IBOutlet weak var glassSeeButtonOutlet: UIButton!
    @IBOutlet weak var buttonsViewOutlet: UIView!
    @IBOutlet weak var activityIndicatorOutlet: UIActivityIndicatorView!
    
    var completion: (() -> Void)?
    
    private var symbols: Int = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pictureOutlet?.layer.cornerRadius = 10
        pictureOutlet?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        buttonsViewOutlet?.layer.cornerRadius = 10
        buttonsViewOutlet?.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        addButtonOutlet?.layer.cornerRadius = 10
        glassSeeButtonOutlet.layer.cornerRadius = 10
        pictureDescription?.numberOfLines = 2
        activityIndicatorOutlet.startAnimating()

    }

    
    @IBAction func testAction(_ sender: UIButton) {
        
        guard let symbols = pictureDescription.text?.count else {return}
        print(symbols)
        
        if pictureDescription?.numberOfLines == 2 {
            pictureDescription?.numberOfLines = 0

        } else {
                pictureDescription?.numberOfLines = 2
            }
        completion?()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

