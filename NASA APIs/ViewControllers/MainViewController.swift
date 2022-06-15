//
//  HomeViewController.swift
//  TwoSuns
//
//  Created by Александр Коробицын on 23.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var timer = Timer()

    @IBOutlet weak var ISSViewOutlet: UIView!
    @IBOutlet weak var moonViewOutlet: UIView!
    @IBOutlet weak var marsViewOutlet: UIView!
    @IBOutlet weak var spaceProbesViewOutlet: UIView!
    
    private var gradient = CAGradientLayer()
    
    private let earthButton = EarthButton()
    private let earthLabel = EarthLabel()
    @IBOutlet weak var ISSLabel: UILabel!
    @IBOutlet weak var moonLabel: UILabel!
    @IBOutlet weak var marsLabel: UILabel!
    @IBOutlet weak var probesLabel: UILabel!
    
    @IBOutlet weak var moonEllypse: UIImageView!
    @IBOutlet weak var marsEllypse: UIImageView!
    
    
    private let animator = Animator()
    
    private let firstLineShape = ThinLineShape()
    private let secondLineShape = ThinLineShape()
    private let thirdlineShape = ThinLineShape()
    
    private let ISSpilling = ThinLineShape()
    private let probesPilling = ThinLineShape()
    private let shapeBezier = ShapeBezier()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem =
        UIBarButtonItem(title: "To orbit", style: .plain, target: nil, action: nil)
        
        createLines()
        gradient = addGradient()
        makeStartingSetting()
        
        
        ISSViewOutlet.backgroundColor = .none
        moonViewOutlet.backgroundColor = .none
        marsViewOutlet.backgroundColor = .none
        spaceProbesViewOutlet.backgroundColor = .none
        
        pillingProbes()
        
        let tapEarth = UITapGestureRecognizer(target: self, action: #selector(didTapEarth))
        let tapISS = UITapGestureRecognizer(target: self, action: #selector(didTapISS))
        let tapMoon = UITapGestureRecognizer(target: self, action: #selector(didTapMoon))
        let tapMars = UITapGestureRecognizer(target: self, action: #selector(didTapMars))
        let tapProbes = UITapGestureRecognizer(target: self, action: #selector(didTapProbes))
                                             
        earthButton.addGestureRecognizer(tapEarth)
        ISSViewOutlet.addGestureRecognizer(tapISS)
        moonViewOutlet.addGestureRecognizer(tapMoon)
        marsViewOutlet.addGestureRecognizer(tapMars)
        spaceProbesViewOutlet.addGestureRecognizer(tapProbes)
    }
    
    @objc func didTapEarth() {
        print("earth")
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "tabBar") as? tabBar
//        self.present(vc ?? self, animated: true)
        
        performSegue(withIdentifier: "toEarth", sender: nil)
 
    }
    
    @objc func didTapISS() {
        print("ISS")
//        let vc = TestViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapMoon() {
        print("Moon")
    }
    
    @objc func didTapMars() {
        print("mars")
    }
    
    @objc func didTapProbes() {
        print("probes")
    }
    
    
    func addGradient() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        view.layer.insertSublayer(gradient, at: 0)
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.frame = CGRect(x: 0, y: 0, width: view.frame.width,
                                height: view.frame.height)
        gradient.colors = [UIColor.upGradient.cgColor,
                           UIColor.downGradient.cgColor]
        return gradient
    }
    
    private func createLines() {
        view.layer.insertSublayer(firstLineShape, at: 0)
        ISSViewOutlet.layer.insertSublayer(secondLineShape, at: 0)
        spaceProbesViewOutlet.layer.insertSublayer(thirdlineShape, at: 0)
        ISSViewOutlet.layer.insertSublayer(ISSpilling, at: 0)
        spaceProbesViewOutlet.layer.insertSublayer(probesPilling, at: 0)
        firstLineShape.lineWidth = 0.4
        firstLineShape.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
        secondLineShape.lineWidth = 0.4
        secondLineShape.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
        thirdlineShape.lineWidth = 0.4
        thirdlineShape.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
        ISSpilling.lineWidth = 3
        ISSpilling.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
        probesPilling.lineWidth = 3
        probesPilling.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
        
    }
    
    override func viewDidLayoutSubviews() {
        shapeBezier.firstLineFrame(shapeLayer: firstLineShape, view: self.view)
        shapeBezier.secondLineFrame(shapeLayer: secondLineShape, view: ISSViewOutlet)
        shapeBezier.thirdlineFrame(shapeLayer: thirdlineShape, view: spaceProbesViewOutlet)
        shapeBezier.ISSPilling(shapeLayer: ISSpilling, view: ISSViewOutlet)
        shapeBezier.probesPilling(shapeLayer: probesPilling, view: spaceProbesViewOutlet)
        gradient.frame = CGRect(x: 0, y: 0, width: view.frame.width,
                                   height: view.frame.height)
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        animateOrbit(image: earthButton.earthEllypseOne)
        earthButton.earthEllypseOne.layer.speed = 0.3
        animateOrbit(image: moonEllypse)
        moonEllypse.layer.speed = 0.3
        animateOrbit(image: marsEllypse)
        marsEllypse.layer.speed = 0.3
        
        animateSatellites(image: earthButton.earthEllypseTwo)
        earthButton.earthEllypseTwo.layer.speed = 0.2
        
        animateLabelOpacity()
        
        animateLine(shape: firstLineShape,
                    shapeTwo: secondLineShape,
                    shapeThree: thirdlineShape)
        
        pillingISS(shape: ISSpilling)
        
    }

    
    func pillingProbes() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.probesPilling.strokeColor == UIColor.whiteColor.withAlphaComponent(0.5).cgColor {
                self.probesPilling.strokeColor = UIColor.red.cgColor
            } else if self.probesPilling.strokeColor == UIColor.red.cgColor {
                self.probesPilling.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
            }
        })
    }
    
    private func animateLabelOpacity() {
        UILabel.animate(withDuration: 1.5) {
            self.earthLabel.alpha = 1
            self.ISSLabel.alpha = 1
            self.moonLabel.alpha = 1
            self.marsLabel.alpha = 1
            self.probesLabel.alpha = 1
        }
    }
    
    private func pillingISS(shape: CAShapeLayer) {
        let animate = animator.pillingAnimate()
        shape.add(animate, forKey: nil)
    }
    
    private func animateLine(shape: CAShapeLayer,
                             shapeTwo: CAShapeLayer,
                             shapeThree: CAShapeLayer) {
        let animate = animator.animateLine()
        shape.add(animate, forKey: nil)
        shapeTwo.add(animate, forKey: nil)
        shapeThree.add(animate, forKey: nil)
    }
    
    private func animateOrbit(image: UIImageView) {
        let CAGroup = animator.animateCircleStartVC(to: .pi * 2.0)
        image.layer.add(CAGroup, forKey: nil)
    }
    
    private func animateSatellites(image: UIImageView) {
        let CAGroup = animator.animateCircleStartVC(to: -.pi * 2.0)
        image.layer.add(CAGroup, forKey: nil)
    }
    
    
    private func makeStartingSetting() {
        view.addSubview(earthButton)
        view.addSubview(earthLabel)
        
        earthButton.translatesAutoresizingMaskIntoConstraints = false
        earthLabel.translatesAutoresizingMaskIntoConstraints = false
        
        earthLabel.text = "Welcome to Earth"
        earthLabel.alpha = 0
        ISSLabel.alpha = 0
        moonLabel.alpha = 0
        marsLabel.alpha = 0
        probesLabel.alpha = 0
        
        earthButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        earthButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        earthButton.widthAnchor.constraint(equalToConstant: 340).isActive = true
        earthButton.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        earthLabel.bottomAnchor.constraint(equalTo: earthButton.topAnchor, constant: -20).isActive = true
        earthLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 170).isActive = true
    }
    
}
