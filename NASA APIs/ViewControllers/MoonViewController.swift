//
//  MoonViewController.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 05.10.2022.
//

import UIKit

protocol Delegate: AnyObject {
    func update(index: Int)
}

class MoonViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let header = HeaderView()
    private let tagsView = TagsView()
    private var data: FetchLibrary?
    
    var tags = TagsView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ImageCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
        header.headerImage.image = UIImage(named: "headerMoon")
        tableView.tableHeaderView = header.headerFrame
        navigationSettings()
        fetchData(from: SearchNamesAndUrl.init().URL[0])
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tagsView.delegate = self
    }
    
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.nasaLibrary(from: url ?? "") { result in
            switch result {
            case.success(let success):
                self.data = success
                DispatchQueue.main.async {
                    self.getData()
                    self.tableView.reloadData()
                }
            case.failure(let error):
                print(error)
            }
        }
    }
    
    private func getData() {
        print("Hello")
        print(data?.collection.items.count ?? 0)
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
        return data?.collection.items.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tagsView.viewFrame
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as? ImageCell {
            
            let pictureDescription = data?.collection.items[indexPath.row].data[indexPath.startIndex]
            let image = data?.collection.items[indexPath.row].links[indexPath.startIndex]
            cell.pictureDescription?.text = pictureDescription?.description
            cell.selectionStyle = .none
            
            NetworkManager.shared.fetchImage(from: image?.href ?? "") { result in
                switch result {
                case .success(let image):
                    cell.pictureOutlet.image = UIImage(data: image)
                    cell.activityIndicatorOutlet.stopAnimating()
                    cell.activityIndicatorOutlet.isHidden = true
                case .failure(let error):
                    print(error)
                }
            }
            
            cell.completion = {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
            
            //            if cell.pictureDescription.text?.count ?? 0 < 216 {
            //                cell.deployButtonOutlet.isHidden = true
            //            }
            
            return cell
        }
        return UITableViewCell()
    }
}

extension MoonViewController: Delegate {
    func update(index: Int) {
        fetchData(from: SearchNamesAndUrl.init().URL[index])
        self.tableView.reloadData()
        print(index)
    }
}
