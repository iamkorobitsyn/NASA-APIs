//
//  HomeViewController.swift
//  TwoSuns
//
//  Created by Александр Коробицын on 23.04.2022.
//

import UIKit

class DislocationViewController: UIViewController {
    
    private var objectName: ObjectName?
    private let object = ObjectData()
    private var timer = Timer()

    @IBOutlet weak var EarthViewOutlet: UIView!
    @IBOutlet weak var ISSViewOutlet: UIView!
    @IBOutlet weak var moonViewOutlet: UIView!
    @IBOutlet weak var marsViewOutlet: UIView!
    @IBOutlet weak var spaceProbesViewOutlet: UIView!
    @IBOutlet weak var sunViewOutlet: UIView!
    
    @IBOutlet weak var EarthLabel: UILabel!
    @IBOutlet weak var ISSLabel: UILabel!
    @IBOutlet weak var ISSDistanceLabel: UILabel!
    @IBOutlet weak var moonLabel: UILabel!
    @IBOutlet weak var moonDistanceLabel: UILabel!
    @IBOutlet weak var marsLabel: UILabel!
    @IBOutlet weak var marsDistanceLabel: UILabel!
    @IBOutlet weak var probesLabel: UILabel!
    @IBOutlet weak var sunLabel: UILabel!
    
    @IBOutlet weak var earthFirstRing: UIImageView!
    @IBOutlet weak var earthSecondRing: UIImageView!
    @IBOutlet weak var moonRing: UIImageView!
    @IBOutlet weak var marsRing: UIImageView!
    @IBOutlet weak var sun: UIImageView!
    
    private var firstLineShape = CAShapeLayer()
    private var secondLineShape = CAShapeLayer()
    private var ISSpillingShape = CAShapeLayer()
    private var thirdlineShape = CAShapeLayer()
    private var probesPillingShape = CAShapeLayer()
    private var fourthLineShape = CAShapeLayer()
    
    //MARK: - life cycles & Setup Animations
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instanceCALayers()
        instanceGestures()
    }
    
    override func viewWillAppear(_ animated: Bool) {   
        instanceNavigationController()
        
        animateOrbit(image: earthFirstRing, to: .pi * 2.0)
        animateOrbit(image: earthSecondRing, to: -.pi * 2.0)
        animateOrbit(image: moonRing, to: .pi * 2.0)
        animateOrbit(image: marsRing, to: .pi * 2.0)
        
        animateSun(image: sun)
        sunLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        
        animateLabelOpacity()
        animateLines(shape: firstLineShape,
                    shapeTwo: secondLineShape,
                    shapeThree: thirdlineShape,
                    shapeFour: fourthLineShape)
        
        pillingISS(shape: ISSpillingShape)
        pillingProbes()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        view.layer.removeAllAnimations()
    }
    
    
    //MARK: - Navigation Controller
    
    private func instanceNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor.label
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationItem.backBarButtonItem =
        UIBarButtonItem(title: "To orbit", style: .plain, target: nil, action: nil)
    }
    
    //MARK: - Instance CALayers
    
    private func instanceCALayers() {
        view.layer.insertSublayer(Shaper.instance.returnGradient(view: self.view), at: 0)
        
        firstLineShape = Shaper.instance.firstLineFrame(view: EarthViewOutlet)
        secondLineShape = Shaper.instance.secondLineFrame(view: ISSViewOutlet)
        ISSpillingShape = Shaper.instance.ISSPillingFrame(view: ISSViewOutlet)
        thirdlineShape = Shaper.instance.thirdlineFrame(view: spaceProbesViewOutlet)
        probesPillingShape = Shaper.instance.probesPilling(view: spaceProbesViewOutlet)
        fourthLineShape = Shaper.instance.fourthLineFrame(view: sunViewOutlet)
        
        
        EarthViewOutlet.layer.insertSublayer(firstLineShape, at: 0)
        ISSViewOutlet.layer.insertSublayer(secondLineShape, at: 0)
        ISSViewOutlet.layer.insertSublayer(ISSpillingShape, at: 0)
        spaceProbesViewOutlet.layer.insertSublayer(thirdlineShape, at: 0)
        spaceProbesViewOutlet.layer.insertSublayer(probesPillingShape, at: 0)
        sunViewOutlet.layer.insertSublayer(fourthLineShape, at: 2)
        
    }
    
    //MARK: - Gestures & Segues
    
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
    
    private func instanceGestures() {
        let tapEarth = UITapGestureRecognizer(target: self, action: #selector(didTapEarth))
        let tapISS = UITapGestureRecognizer(target: self, action: #selector(didTapISS))
        let tapMoon = UITapGestureRecognizer(target: self, action: #selector(didTapMoon))
        let tapMars = UITapGestureRecognizer(target: self, action: #selector(didTapMars))
        let tapProbes = UITapGestureRecognizer(target: self, action: #selector(didTapProbes))
        let tapSun = UITapGestureRecognizer(target: self, action: #selector(didTapSun))
                     
        
        EarthViewOutlet.addGestureRecognizer(tapEarth)
        ISSViewOutlet.addGestureRecognizer(tapISS)
        moonViewOutlet.addGestureRecognizer(tapMoon)
        marsViewOutlet.addGestureRecognizer(tapMars)
        spaceProbesViewOutlet.addGestureRecognizer(tapProbes)
        sunViewOutlet.addGestureRecognizer(tapSun)
    }
    
   //MARK: - Animations
    
    private func pillingProbes() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.probesPillingShape.strokeColor == UIColor.whiteColor.withAlphaComponent(0.5).cgColor {
                self.probesPillingShape.strokeColor = UIColor.red.cgColor
            } else if self.probesPillingShape.strokeColor == UIColor.red.cgColor {
                self.probesPillingShape.strokeColor = UIColor.whiteColor.withAlphaComponent(0.5).cgColor
            }
        })
    }
    
    private func pillingISS(shape: CAShapeLayer) {
        let animate = Animator.instance.animatePilling()
        shape.add(animate, forKey: nil)
    }
    
    private func animateLabelOpacity() {
        UILabel.animate(withDuration: 2) {
            self.EarthLabel.alpha = 1
            self.ISSLabel.alpha = 1
            self.ISSDistanceLabel.alpha = 1
            self.moonLabel.alpha = 1
            self.moonDistanceLabel.alpha = 1
            self.marsLabel.alpha = 1
            self.marsDistanceLabel.alpha = 1
            self.probesLabel.alpha = 1
            self.sunLabel.alpha = 0.8
        }
    }

    private func animateLines(shape: CAShapeLayer,
                             shapeTwo: CAShapeLayer,
                             shapeThree: CAShapeLayer,
                             shapeFour: CAShapeLayer) {
        let animate = Animator.instance.animateLine()
        shape.add(animate, forKey: nil)
        shapeTwo.add(animate, forKey: nil)
        shapeThree.add(animate, forKey: nil)
        shapeFour.add(animate, forKey: nil)
    }
    
    private func animateOrbit(image: UIImageView, to: Double) {
        let CAGroup = Animator.instance.rotation(to: to)
        image.layer.speed = 0.3
        image.layer.add(CAGroup, forKey: nil)
    }
    
    private func animateSun(image: UIImageView) {
        let animate = Animator.instance.animateSun()
        image.layer.add(animate, forKey: nil)
    }
}
