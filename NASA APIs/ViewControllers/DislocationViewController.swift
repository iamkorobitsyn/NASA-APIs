//
//  ViewController.swift
//  TwoSuns
//
//  Created by Александр Коробицын on 22.04.2022.
//

import UIKit

class DislocationViewController: UIViewController, UITextFieldDelegate, CAAnimationDelegate {
    
    //MARK: - Properties
    
    private let firstStarShape = ThinLineShape()
    private let secondStarShape = ThinLineShape()
    private let shapeBezier = ShapeBezier()
    private let animator = Animator()
    private var gradient: CAGradientLayer!

    @IBOutlet weak var ellypsContains: UIView!
    @IBOutlet weak var ellypsOne: UIImageView!
    @IBOutlet weak var ellypsTwo: UIImageView!
    @IBOutlet weak var textContains: UIView!
    @IBOutlet weak var dislocationOutlet: UIButton!
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.insertSublayer(firstStarShape, at: 0)
        view.layer.insertSublayer(secondStarShape, at: 0)
        
        makeStartingSettings()
        gradient = addGradient()
        
        animateEllypse(image: ellypsOne)
        animateEllypse(image: ellypsTwo)
        
        textOpacity(view: textContains)
        buttonOpacity(button: dislocationOutlet)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
//MARK: - viewDidLayoutSubviews
    
    override func viewDidLayoutSubviews() {
        gradient.frame = CGRect(x: 0, y: 0, width: view.frame.width,
                                   height: view.frame.height)
        
        shapeBezier.firstStarFrame(shapeLayer: firstStarShape, view: self.view)
        shapeBezier.secondStarFrame(shapeLayer: secondStarShape, view: self.view)
    }
    
//MARK: - Animating

    @IBAction func dislocationButton(_ sender: UIButton) {
    
        viewOpacity(UIView: self.view)
        ellypsOne.layer.speed = 7
        ellypsTwo.layer.speed = 7
        
        starOpasity(shape: firstStarShape)
        starOpasity(shape: secondStarShape)
        
        firstStarAnimating(shape: firstStarShape)
        secondStarAnimating(shape: secondStarShape)
        
    }
    
    private func starOpasity(shape: CAShapeLayer) {
        shape.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
    }
    
    private func firstStarAnimating(shape: CAShapeLayer) {
        let CAGroup = animator.firstStarAnimating()
        firstStarShape.add(CAGroup, forKey: nil)
    }
    
    private func secondStarAnimating(shape: CAShapeLayer) {
        let CAGroup = animator.secondStarAnimating()
        secondStarShape.add(CAGroup, forKey: nil)
    }
    
    private func animateEllypse(image: UIImageView) {
        let CAGroup = animator.animateCircleStartVC(to: .pi * 2.0)
        image.layer.add(CAGroup, forKey: nil)
    }
    
    private func textOpacity(view: UIView) {
        let opasity = animator.textOpacityStartVC()
        view.layer.add(opasity, forKey: nil)
    }

    private func buttonOpacity(button: UIButton) {
        let CAGroup = animator.buttonOpacityStartVC()
        button.layer.add(CAGroup, forKey: nil)
    }
    
    private func viewOpacity(UIView: UIView) {
        let CAGroup = animator.viewOpacityStartVC()
        CAGroup.delegate = self
        UIView.layer.add(CAGroup, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.view.alpha = 0
        performSegue(withIdentifier: "earthID", sender: nil)
    }
   
//MARK: - Starting Settings
    
    private func makeStartingSettings() {
        textContains.backgroundColor = .none
        ellypsContains.backgroundColor = .none
        
        dislocationOutlet.backgroundColor = .none
        dislocationOutlet.layer.cornerRadius = 15
        dislocationOutlet.layer.borderWidth = 1
        
        dislocationOutlet.layer.borderColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
        dislocationOutlet.titleLabel?.textColor = .white
        dislocationOutlet.titleLabel?.alpha = 0.7
        dislocationOutlet.titleLabel?.font = .systemFont(ofSize: 25, weight: .thin)
        
    }
    
    func addGradient() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        view.layer.insertSublayer(gradient, at: 0)
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.frame = CGRect(x: 0, y: 0, width: view.frame.width,
                                height: view.frame.height)
        gradient.colors = [UIColor.downGradient.cgColor,
                           UIColor.upGradient.cgColor]
        return gradient
    }
}

