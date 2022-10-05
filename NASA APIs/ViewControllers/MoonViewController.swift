//
//  MoonViewController.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 05.10.2022.
//

import UIKit

class MoonViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let header = HeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        header.headerImage.image = UIImage(named: "headerMoon")
        tableView.tableHeaderView = header.headerFrame
        
        navigationSettings()
    }
    
    private func navigationSettings() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Nasa repository", style: .plain, target: nil, action: nil)
        title = "Moon"
    }
}

extension MoonViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
    
}
