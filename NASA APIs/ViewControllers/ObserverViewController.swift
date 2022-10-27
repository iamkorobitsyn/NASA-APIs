//
//  ObservatoryViewController.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 22.10.2022.
//

import UIKit

protocol ObserverNewControllerDelegate {
    func updateArrayOfObservers(text: String)
}

class ObserverViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let gradient = Gradient()
    
    var arrayOfObservers: [String] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ObserverViewCell.self, forCellReuseIdentifier: "firstCell")
        tableView.register(NewObserverViewCell.self, forCellReuseIdentifier: "secondCell")
        tableView.tableHeaderView = ObserverHeaderView()
        
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        
        let gradient = gradient.returnGradient(view: self.view, endY: 1)
        self.view.layer.insertSublayer(gradient, at: 0)
        
    }
}


extension ObserverViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return arrayOfObservers.count
        default:
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: "firstCell", for: indexPath) as? ObserverViewCell {
                
                if arrayOfObservers != [] {
                    cell.nameLabel.text = arrayOfObservers[indexPath.row]
                }
                
                
                cell.selectionStyle = .none
                cell.completion = { let vc = ObserverContentViewController()
                    vc.title = self.arrayOfObservers[indexPath.row]
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                return cell
            }
            
        default:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: "secondCell", for: indexPath) as? NewObserverViewCell {
                cell.selectionStyle = .none
                
                cell.completion = {
                    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ObserverNewController") as? ObserverNewController else {return}
                    self.present(vc, animated: true)
                    vc.delegate = self
                }
                return cell
            }
        }
        return UITableViewCell()
    }
}

extension ObserverViewController: ObserverNewControllerDelegate {
    func updateArrayOfObservers(text: String) {
        arrayOfObservers.append(text)
        tableView.reloadData()
            print(arrayOfObservers)
        
       
    }
    
    
}

