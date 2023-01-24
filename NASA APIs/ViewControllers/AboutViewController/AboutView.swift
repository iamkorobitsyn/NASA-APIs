//
//  AboutView.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 20.10.2022.
//
import Foundation
import UIKit

protocol AboutDelegate {
    func skipAction()
}

class AboutView: UIView {
    
    @IBOutlet weak var nameSurenameOutlet: UILabel!
    @IBOutlet weak var countryCityOutlet: UILabel!
    @IBOutlet weak var mailOutlet: UILabel!
    @IBOutlet weak var descriptionOutlet: UILabel!
    @IBOutlet weak var skipActionOutlet: UIButton!
    
    var delegate: AboutDelegate?

    
    func set(NameSurename: String, CountryCity: String, mail: String, description: String) {
        nameSurenameOutlet.text = NameSurename
        countryCityOutlet.text = CountryCity
        mailOutlet.text = mail
        descriptionOutlet.text = description
        
        nameSurenameOutlet.textColor = UIColor.white
        countryCityOutlet.textColor = UIColor.white
        mailOutlet.textColor = UIColor.white
        descriptionOutlet.textColor = UIColor.white
    }
    @IBAction func skipAction(_ sender: UIButton) {
        delegate?.skipAction()
    }
}
