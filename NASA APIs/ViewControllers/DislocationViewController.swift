//
//  HomeViewController.swift
//  TwoSuns
//
//  Created by Александр Коробицын on 23.04.2022.
//

import UIKit

class DislocationViewController: UIViewController {
    
    private var objectName: ObjectName?
    private var timer = Timer()
    private let object = ObjectData()
    
    private var gradient = CAGradientLayer()
    private let animator = Animator()
    private let shapeBezier = ShapeBezier()

    @IBOutlet weak var EarthViewOutlet: UIView!
    @IBOutlet weak var ISSViewOutlet: UIView!
    @IBOutlet weak var moonViewOutlet: UIView!
    @IBOutlet weak var marsViewOutlet: UIView!
    @IBOutlet weak var spaceProbesViewOutlet: UIView!
    @IBOutlet weak var myObservatoryViewOutlet: UIView!
    @IBOutlet weak var sunViewOutlet: UIView!
    
    
    @IBOutlet weak var EarthLabel: UILabel!
    @IBOutlet weak var ISSLabel: UILabel!
    @IBOutlet weak var moonLabel: UILabel!
    @IBOutlet weak var marsLabel: UILabel!
    @IBOutlet weak var probesLabel: UILabel!
    @IBOutlet weak var myObservatoryLabel: UILabel!
    @IBOutlet weak var sunLabel: UILabel!
    
    @IBOutlet weak var earthCircleOne: UIImageView!
    @IBOutlet weak var earthCircleTwo: UIImageView!
    @IBOutlet weak var moonCircle: UIImageView!
    @IBOutlet weak var marsCircle: UIImageView!
    @IBOutlet weak var observatoryTelescope: UIImageView!
    @IBOutlet weak var sun: UIImageView!
    
    private let firstLineShape = ThinLineShape()
    private let secondLineShape = ThinLineShape()
    private let thirdlineShape = ThinLineShape()
    private let fourthLineShape = ThinLineShape()
    private let fiveLineShape = ThinLineShape()
    
    private let ISSpilling = ThinLineShape()
    private let probesPilling = ThinLineShape()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem =
        UIBarButtonItem(title: "To orbit", style: .plain, target: nil, action: nil)
        
        makeStartingSetting()
        createSettingsOfGesture()
        createLines()
        pillingProbes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        animateOrbit(image: earthCircleOne)
        earthCircleOne.layer.speed = 0.3
        animateSatellites(image: earthCircleTwo)
        earthCircleTwo.layer.speed = 0.2
        animateOrbit(image: moonCircle)
        moonCircle.layer.speed = 0.3
        animateOrbit(image: marsCircle)
        marsCircle.layer.speed = 0.3
        animateTelescope(image: observatoryTelescope)
        animateSun(image: sun)
        
        animateLabelOpacity()
        
        animateLine(shape: firstLineShape,
                    shapeTwo: secondLineShape,
                    shapeThree: thirdlineShape,
                    shapeFour: fourthLineShape,
                    shapeFive: fiveLineShape)
        
        pillingISS(shape: ISSpilling)
    }
    
    override func viewDidLayoutSubviews() {
        shapeBezier.firstLineFrame(shapeLayer: firstLineShape, view: EarthViewOutlet)
        shapeBezier.secondLineFrame(shapeLayer: secondLineShape, view: ISSViewOutlet)
        shapeBezier.thirdlineFrame(shapeLayer: thirdlineShape, view: spaceProbesViewOutlet)
        shapeBezier.fourthLineFrame(shapeLayer: fourthLineShape, view: myObservatoryViewOutlet)
        shapeBezier.fiveLineFrame(shapeLayer: fiveLineShape, view: sunViewOutlet)
        shapeBezier.ISSPilling(shapeLayer: ISSpilling, view: ISSViewOutlet)
        shapeBezier.probesPilling(shapeLayer: probesPilling, view: spaceProbesViewOutlet)
        
        gradient = addGradient()
        gradient.frame = CGRect(x: 0, y: 0, width: view.frame.width,
                                   height: view.frame.height)
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moonVC = segue.destination as? ContentViewController else {return}
        guard let objectName = objectName else {return}
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        moonVC.title = objectName.rawValue
        moonVC.spaceObject = object.get(objectName: objectName)
    }
    
    @objc func didTapSun() {
        print("sun")
        objectName = .sun
        performSegue(withIdentifier: "id", sender: nil)
    }
    
    @objc func didTapEarth() {
        print("earth")
        objectName = .earth
        performSegue(withIdentifier: "id", sender: nil)
        
    }
    
    @objc func didTapISS() {
        print("ISS")
        objectName = .ISS
        performSegue(withIdentifier: "id", sender: nil)
    }
    
    @objc func didTapMoon() {
        print("Moon")
        objectName = .moon
        performSegue(withIdentifier: "id", sender: nil)
    }
    
    @objc func didTapMars() {
        print("mars")
        objectName = .mars
        performSegue(withIdentifier: "id", sender: nil)
    }
    
    @objc func didTapProbes() {
        print("probes")
        objectName = .spaceProbes
        performSegue(withIdentifier: "id", sender: nil)
    }
    
    @objc func tapObservatory() {
        print("myObservatory")
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ObservatoryViewController") as? ObservatoryViewController else {return}
        
        navigationController?.pushViewController(vc, animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        vc.title = "My observatory"
    }
    
    private func createSettingsOfGesture() {
        let tapEarth = UITapGestureRecognizer(target: self, action: #selector(didTapEarth))
        let tapISS = UITapGestureRecognizer(target: self, action: #selector(didTapISS))
        let tapMoon = UITapGestureRecognizer(target: self, action: #selector(didTapMoon))
        let tapMars = UITapGestureRecognizer(target: self, action: #selector(didTapMars))
        let tapProbes = UITapGestureRecognizer(target: self, action: #selector(didTapProbes))
        let tapObservatory = UITapGestureRecognizer(target: self, action: #selector(tapObservatory))
        let tapSun = UITapGestureRecognizer(target: self, action: #selector(didTapSun))
                     
        
        EarthViewOutlet.addGestureRecognizer(tapEarth)
        ISSViewOutlet.addGestureRecognizer(tapISS)
        moonViewOutlet.addGestureRecognizer(tapMoon)
        marsViewOutlet.addGestureRecognizer(tapMars)
        spaceProbesViewOutlet.addGestureRecognizer(tapProbes)
        myObservatoryViewOutlet.addGestureRecognizer(tapObservatory)
        sunViewOutlet.addGestureRecognizer(tapSun)
    }
    
   
    
    private func createLines() {
        EarthViewOutlet.layer.insertSublayer(firstLineShape, at: 0)
        ISSViewOutlet.layer.insertSublayer(secondLineShape, at: 0)
        spaceProbesViewOutlet.layer.insertSublayer(thirdlineShape, at: 0)
        myObservatoryViewOutlet.layer.insertSublayer(fourthLineShape, at: 0)
        sunViewOutlet.layer.insertSublayer(fiveLineShape, at: 2)
        
        ISSViewOutlet.layer.insertSublayer(ISSpilling, at: 0)
        spaceProbesViewOutlet.layer.insertSublayer(probesPilling, at: 0)
        firstLineShape.lineWidth = 0.4
        firstLineShape.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
        secondLineShape.lineWidth = 0.4
        secondLineShape.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
        thirdlineShape.lineWidth = 0.4
        thirdlineShape.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
        fourthLineShape.lineWidth = 0.4
        fourthLineShape.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
        fiveLineShape.lineWidth = 0.4
        fiveLineShape.strokeColor = UIColor.black.withAlphaComponent(0.8).cgColor
        ISSpilling.lineWidth = 3
        ISSpilling.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
        probesPilling.lineWidth = 3
        probesPilling.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
        
    }
    
    private func pillingProbes() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.probesPilling.strokeColor == UIColor.whiteColor.withAlphaComponent(0.5).cgColor {
                self.probesPilling.strokeColor = UIColor.red.cgColor
            } else if self.probesPilling.strokeColor == UIColor.red.cgColor {
                self.probesPilling.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
            }
        })
    }
    
    private func pillingISS(shape: CAShapeLayer) {
        let animate = animator.pillingAnimate()
        shape.add(animate, forKey: nil)
    }
    
    private func animateLabelOpacity() {
        UILabel.animate(withDuration: 1.5) {
            self.EarthLabel.alpha = 1
            self.ISSLabel.alpha = 1
            self.moonLabel.alpha = 1
            self.marsLabel.alpha = 1
            self.probesLabel.alpha = 1
            self.myObservatoryLabel.alpha = 1
            self.sunLabel.alpha = 0.8
        }
    }

    private func animateLine(shape: CAShapeLayer,
                             shapeTwo: CAShapeLayer,
                             shapeThree: CAShapeLayer,
                             shapeFour: CAShapeLayer,
                             shapeFive: CAShapeLayer) {
        let animate = animator.animateLine()
        shape.add(animate, forKey: nil)
        shapeTwo.add(animate, forKey: nil)
        shapeThree.add(animate, forKey: nil)
        shapeFour.add(animate, forKey: nil)
        shapeFive.add(animate, forKey: nil)
    }
    
    private func animateOrbit(image: UIImageView) {
        let CAGroup = animator.animateCircleStartVC(to: .pi * 2.0)
        image.layer.add(CAGroup, forKey: nil)
    }
    
    private func animateSatellites(image: UIImageView) {
        let CAGroup = animator.animateCircleStartVC(to: -.pi * 2.0)
        image.layer.add(CAGroup, forKey: nil)
    }
    
    private func animateTelescope(image: UIImageView) {
        let animate = animator.moveAnimate()
        image.layer.add(animate, forKey: nil)
    }
    
    private func animateSun(image: UIImageView) {
        let animate = animator.animateColor()
        image.layer.add(animate, forKey: nil)
    }
    
    private func makeStartingSetting() {
        EarthLabel.alpha = 0
        ISSLabel.alpha = 0
        moonLabel.alpha = 0
        marsLabel.alpha = 0
        probesLabel.alpha = 0
        myObservatoryLabel.alpha = 0
        sunLabel.alpha = 0
        sunLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
    }
}
