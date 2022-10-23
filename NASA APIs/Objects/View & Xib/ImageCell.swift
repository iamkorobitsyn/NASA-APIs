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
        addButtonOutlet?.layer.cornerRadius = 10
        addButtonOutlet?.backgroundColor = .none
        glassSeeButtonOutlet.layer.cornerRadius = 10
        glassSeeButtonOutlet.backgroundColor = .none
        pictureDescription?.numberOfLines = 2
        
        
        if pictureDescription.text?.count ?? 0 < 100{
            deployButtonOutlet.isHidden = true
        } else if pictureDescription.text?.count ?? 0 > 100 {
            deployButtonOutlet.isHidden = false
        }
    }
}

