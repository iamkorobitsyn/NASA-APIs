//
//  TabBarController.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 25.05.2022.
//

import Foundation
import UIKit

class EarthTabBarController: UITabBarController {
    
    //MARK: - Properties

    
    let navigationBackground = UIView()
    
    var nasaImageView = UIImageView()
    var spaceXImageView = UIImageView()
    
    let nasaItem: UIViewController = NasaVC()
    let spaceXItem: UIViewController = SpaceXVC()
    
    var circleLayerLeft = ThinLineShape()
    var leftLine = ThinLineShape()
    var circleLayerRight = ThinLineShape()
    var rightLine = ThinLineShape()
    
    private let shapeBezier = ShapeBezier()

    private let animator = Animator()
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationController()
        
        let controllers = [nasaItem, spaceXItem]
        setViewControllers(controllers, animated: true)
        
        addLogoButtons()
    }
    
    //MARK: - viewDidLayoutSubviews
    
    override func viewDidLayoutSubviews() {
        insertShapes()
    }
    
    
    //MARK: - Custom Tab Bar Controller
    
    func insertShapes()
    {
        shapeBezier.tabCirclePath(shapeLayer: circleLayerLeft)
        circleLayerLeft.position = CGPoint(x: nasaImageView.bounds.midX, y: nasaImageView.bounds.midY)
        circleLayerLeft.strokeColor = UIColor.upGradient.cgColor
        circleLayerLeft.fillColor = .none
        circleLayerLeft.lineWidth = 0.9
        nasaImageView.layer.addSublayer(circleLayerLeft)
        
        shapeBezier.tabCirclePath(shapeLayer: circleLayerRight)
        circleLayerRight.position = CGPoint(x: spaceXImageView.bounds.midX, y:spaceXImageView.bounds.midY)
        circleLayerRight.strokeColor = UIColor.upGradient.cgColor
        circleLayerRight.fillColor = .none
        circleLayerRight.lineWidth = 0.9
        spaceXImageView.layer.addSublayer(circleLayerRight)
        
        shapeBezier.tabLinePath(shapeLayer: leftLine)
        leftLine.strokeColor = UIColor.upGradient.cgColor
        leftLine.fillColor = UIColor.white.withAlphaComponent(0).cgColor
        leftLine.lineWidth = 0.9
        nasaImageView.layer.addSublayer(leftLine)
        
        shapeBezier.tabLinePath(shapeLayer: rightLine)
        rightLine.strokeColor = UIColor.upGradient.cgColor
        rightLine.fillColor = UIColor.white.withAlphaComponent(0).cgColor
        rightLine.lineWidth = 0.9
        spaceXImageView.layer.addSublayer(rightLine)
        rightLine.isHidden = true
    }
  
    func circleAnimate(shape: CAShapeLayer) {
        let animate = animator.animateCircle360()
        shape.add(animate, forKey: nil)
    }
    
    func lineAnimate(shape: CAShapeLayer) {
        let animate = animator.fastAnimateLine()
        shape.add(animate, forKey: nil)
    }

    //MARK: - customNavigationController
    
    private func customNavigationController() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Earth ", style: .plain, target: nil, action: nil)
    }
    
    private func animateTwo(image: UIImageView) {
        let CAGroup = animator.animateCircleStartVC(to: -.pi * 2.0)
        CAGroup.speed = 0.3
        image.layer.add(CAGroup, forKey: nil)
    }
    
    private func animateOne(image: UIImageView) {
        let CAGroup = animator.animateCircleStartVC(to: .pi * 2.0)
        CAGroup.speed = 0.3
        image.layer.add(CAGroup, forKey: nil)
    }

    //MARK: - Add Logos
    
    private func addLogoButtons() {
        view.addSubview(nasaImageView)
        nasaImageView.translatesAutoresizingMaskIntoConstraints = false
        nasaImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nasaImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        nasaImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor,
                                               constant: -tabBar.bounds.width / 4).isActive = true
        nasaImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35).isActive = true
        nasaImageView.contentMode = .scaleAspectFit
        nasaImageView.image = UIImage(named: "logoNasa")
        
        view.addSubview(spaceXImageView)
        spaceXImageView.translatesAutoresizingMaskIntoConstraints = false
        spaceXImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        spaceXImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        spaceXImageView.centerXAnchor.constraint(
            equalTo: view.centerXAnchor, constant: tabBar.bounds.width / 4).isActive = true
        spaceXImageView.bottomAnchor.constraint(
            equalTo: view.bottomAnchor, constant: -35).isActive = true
        spaceXImageView.contentMode = .scaleAspectFit
        spaceXImageView.image = UIImage(named: "logoSpaceX")
    }
}



    //MARK: - UITabBarControllerDelegate

extension EarthTabBarController: UITabBarControllerDelegate {

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let selectedIndex = tabBar.items?.firstIndex(of: item)
        if selectedIndex == 0 {
            circleAnimate(shape: circleLayerLeft)
            lineAnimate(shape: leftLine)
            leftLine.isHidden = false
            rightLine.isHidden = true
                    } else {
            
            circleAnimate(shape: circleLayerRight)
            lineAnimate(shape: rightLine)
            leftLine.isHidden = true
            rightLine.isHidden = false
        }
    }

}
