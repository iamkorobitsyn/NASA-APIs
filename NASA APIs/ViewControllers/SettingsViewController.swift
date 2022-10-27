//
//  SettingsViewController.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 17.10.2022.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
    
    private  var pickerMenuArray = ["English", "Русский", "Turkey",]
    
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var visualView: UIVisualEffectView!
    
    private lazy var aboutView: AboutView = {
        let aboutView: AboutView = AboutView.loadFromNib()
        aboutView.delegate = self
        return aboutView
    }()
    
    private let visualEffectView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .dark)
        let visualEffect = UIVisualEffectView(effect: effect)
        return visualEffect
    }()

    @IBOutlet weak var segmentViewOutlet: UISegmentedControl!
    @IBOutlet weak var pickerViewOutlet: UIPickerView!
    
    @IBOutlet weak var aboutButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        tapView.addGestureRecognizer(gesture)

        visualView.layer.cornerRadius = 15
        
        setupPickewView()
        setupSegmentView()
        setupAboutButton()
    }

    @objc func didTapView() {
        self.dismiss(animated: true)
    }
    
    @IBAction func aboutButtonAction(_ sender: UIButton) {
        setupAboutView()
    }
    
    private func setupAboutView() {
        tapView.gestureRecognizers = .none
        aboutView.layer.cornerRadius = 15
        aboutView.skipActionOutlet.backgroundColor = .none
        aboutView.backgroundColor = UIColor.upGradient.withAlphaComponent(0.4)
        aboutView.set(NameSurename: "Alex Korobitsyn",
                      CountryCity: "Russia/Moscow",
                      mail: "iamkorobitsyn@icloud.com",
                      description: "All resources are sourced from Nasa public api")
        self.view.addSubview(aboutView)
        aboutView.center = self.view.center
        
        tapView.addSubview(visualEffectView)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        visualEffectView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    private func setupAboutButton() {
        aboutButtonOutlet.layer.cornerRadius = 10
        aboutButtonOutlet.backgroundColor = UIColor.darkGray.withAlphaComponent(0.4)
        aboutButtonOutlet.tintColor = UIColor.lightGray
        aboutButtonOutlet.layer.borderWidth = 0.2
        aboutButtonOutlet.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setupSegmentView() {
        segmentViewOutlet.addTarget(self, action: #selector(segmentedControlTap), for: .valueChanged )
        segmentViewOutlet.selectedSegmentIndex = MTUserDevaults.shared.theme.rawValue
        segmentViewOutlet.setTitleTextAttributes([.foregroundColor :
                                                   UIColor.white.withAlphaComponent(0.5)],
                                                 for: .normal)
        segmentViewOutlet.selectedSegmentTintColor = UIColor.darkGray.withAlphaComponent(0.5)
        segmentViewOutlet.layer.borderWidth = 0.2
        segmentViewOutlet.layer.borderColor = UIColor.black.cgColor
    }
    
    @objc func segmentedControlTap() {
        MTUserDevaults.shared.theme = Theme(rawValue: segmentViewOutlet.selectedSegmentIndex) ?? .device
        view.window?.overrideUserInterfaceStyle = MTUserDevaults.shared.theme.getUserInterfaceStyle()
    }
    
    private func setupPickewView() {
        pickerViewOutlet.dataSource = self
        pickerViewOutlet.delegate = self
        pickerViewOutlet.layer.cornerRadius = 8
        pickerViewOutlet.backgroundColor = UIColor.gray.withAlphaComponent(0)
        
    }
    
    
    //MARK: - UIPickerView Delegate & DataSourse

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerMenuArray.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerMenuArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    
        let label = (view as? UILabel) ?? UILabel()
      

        label.text = pickerMenuArray[row]
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor.white.withAlphaComponent(1)
        
        pickerView.subviews[1].layer.borderWidth = 0.5
        pickerView.subviews[1].layer.borderColor = UIColor.label.withAlphaComponent(0.4).cgColor
        pickerView.subviews[1].backgroundColor = .none
        return label
    }
}

extension SettingsViewController: AboutDelegate {
    func skipAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        tapView.addGestureRecognizer(gesture)
        aboutView.removeFromSuperview()
        visualEffectView.removeFromSuperview()
    }
}
