//
//  ObserverNewController.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 27.10.2022.
//

import UIKit

class ObserverNewController: UIViewController {
    
    
    let gradient = Gradient()
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var surenameTextField: UITextField!
    var delegate: ObserverNewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextfield.delegate = self
        surenameTextField.delegate = self
        
        createFrontView()
        createTextFields()
        createaddView()
        createGesture()
        
        addView.alpha = 0
    }
    
    @objc func addContact() {
        let observer = Observer(name: nameTextfield.text ?? "",
                                surename: surenameTextField.text ?? "")
        delegate?.updateArrayOfObservers(text: observer.fullName)
        dismiss(animated: true)
    }
    
    @objc private func closeWindow() {
        dismiss(animated: true)
    }
    
    private func createGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeWindow))
        tapView.addGestureRecognizer(tap)
        let add = UITapGestureRecognizer(target: self, action: #selector(addContact))
        addView.addGestureRecognizer(add)
    }
    
    private func createaddView() {
        addView.layer.cornerRadius = addView.bounds.width / 2
        addView.layer.borderWidth = 0.5
        addView.layer.borderColor = UIColor.label.withAlphaComponent(0.5).cgColor
    }
    
    private func createFrontView() {
        frontView.clipsToBounds = true
        frontView.layer.cornerRadius = 20
        frontView.layer.insertSublayer(gradient.returnGradient(view: frontView, endY: 7), at: 0)
    }
    
    private func createTextFields() {
        nameTextfield.layer.borderColor = UIColor.label.withAlphaComponent(0.5).cgColor
        nameTextfield.layer.borderWidth = 0.5
        nameTextfield.layer.cornerRadius = 10
        nameTextfield.returnKeyType = .done
        nameTextfield.clearButtonMode = .always
        nameTextfield.enablesReturnKeyAutomatically = true
        
        surenameTextField.layer.borderColor = UIColor.label.withAlphaComponent(0.5).cgColor
        surenameTextField.layer.borderWidth = 0.5
        surenameTextField.layer.cornerRadius = 10
        surenameTextField.returnKeyType = .done
        surenameTextField.clearButtonMode = .always
        surenameTextField.enablesReturnKeyAutomatically = true
    }
}

extension ObserverNewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextfield, surenameTextField.text == "" {
            surenameTextField.becomeFirstResponder()
        } else if textField == surenameTextField, nameTextfield.text == ""{
            nameTextfield.becomeFirstResponder()
        } else {
            let observer = Observer(name: nameTextfield.text ?? "",
                                    surename: surenameTextField.text ?? "")
            delegate?.updateArrayOfObservers(text: observer.fullName)
            dismiss(animated: true)
            
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if nameTextfield.text != "", surenameTextField.text != "" {
            addView.alpha = 1
        } else {
            addView.alpha = 0
        }
    }
}
