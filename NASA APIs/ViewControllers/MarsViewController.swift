//
//  MarsViewController.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 08.09.2022.
//

import UIKit

class MarsViewController: UIViewController {
    
    private let backgroundNavigation = UIView()
    
    private let navigationView = CustomNavigationViewWithTheEarth()
    
    private let animator = Animator()
    
    var manifest: Manifest?
    
    
    @IBOutlet weak var test01: UILabel!
    @IBOutlet weak var test02: UILabel!
    @IBOutlet weak var test03: UILabel!
    @IBOutlet weak var test04: UILabel!
    @IBOutlet weak var test05: UILabel!
    @IBOutlet weak var test06: UILabel!
    @IBOutlet weak var test07: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationController()
        
        fetchData(from: Link.curiosityManifest.rawValue)
       
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url ?? "") { result in
            switch result {
            case.success(let result):
                self.manifest = result
                DispatchQueue.main.async {
                    self.createOutlets()
                }
            case.failure(let error):
                print(error)
            }
        }
    }
    
    private func createOutlets() {
        test01.text = manifest?.photoManifest.name
        test02.text = manifest?.photoManifest.landingDate
        test03.text = manifest?.photoManifest.launchDate
        test04.text = manifest?.photoManifest.status
        test05.text = String("\(manifest?.photoManifest.maxSol)")
        test06.text = manifest?.photoManifest.maxDate
        test07.text = String("\(manifest?.photoManifest.totalPhotos)")
    }
    
    private func customNavigationController() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Mars", style: .plain, target: nil, action: nil)
        let imageView = navigationView
        navigationItem.titleView = imageView
        animateTwo(image: imageView.firstNavigationRing)
        animateOne(image: imageView.secondNavigationRing)
        
        view.addSubview(backgroundNavigation)

        backgroundNavigation.translatesAutoresizingMaskIntoConstraints = false
        backgroundNavigation.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backgroundNavigation.heightAnchor.constraint(equalToConstant: 105).isActive = true
        backgroundNavigation.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundNavigation.backgroundColor = UIColor.downGradient
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
    
    
}
