//
//  MoonViewController.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 05.10.2022.
//

import UIKit

protocol TagsCollectionViewDelegate: AnyObject {
    func update(index: Int)
}

class ContentViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let header = ContentHeaderView()
    private let tagsCollectionView = TagsCollectionView()
    private var data: FetchLibrary?
    private let gradient = Gradient()
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    var spaceObject: SpaceObject?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        createContentTableView()

        tagsCollectionView.getspaceObject = spaceObject?.title
        tagsCollectionView.delegate = self
        
        let gradient = gradient.returnGradient(view: self.view, endY: 7)
        self.view.layer.insertSublayer(gradient, at: 0)
    }

    private func createContentTableView() {
        tableView.register(UINib(nibName: "ContentCell", bundle: nil),
                           forCellReuseIdentifier: "ContentCell")
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.separatorStyle = .none
        tableView.backgroundColor = .none
        
        header.headerImage.image = UIImage(named: spaceObject?.image ?? "")
        tableView.tableHeaderView = header.headerFrame
        
        fetchData(from: spaceObject?.link[0])
        
        createActivityIndicator()
    }
    
    private func createActivityIndicator() {
        tableView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: self.tableView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.tableView.centerYAnchor).isActive = true
        activityIndicator.widthAnchor.constraint(equalTo: self.tableView.widthAnchor).isActive = true
        activityIndicator.heightAnchor.constraint(equalTo: self.tableView.heightAnchor).isActive = true
        activityIndicator.startAnimating()
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchLibrary(from: url ?? "") { result in
            switch result {
            case.success(let success):
                self.data = success
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                }
            case.failure(let error):
                print(error)
            }
        }
    }
}
    
extension ContentViewController: UITableViewDataSource, UITableViewDelegate {
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
        return tagsCollectionView.viewFrame
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as? ContentCell {
            let pictureDescription = data?.collection.items[indexPath.row].data[indexPath.startIndex]
            let image = data?.collection.items[indexPath.row].links[indexPath.startIndex]
            cell.pictureDescription?.text = pictureDescription?.description
            cell.selectionStyle = .none
            
            cell.pictureOutlet.image = .none
            cell.activityIndicatorOutlet.isHidden = false
            cell.activityIndicatorOutlet.startAnimating()

            cell.pictureOutlet.fetchImage(from: image?.href ?? "") {
                cell.activityIndicatorOutlet.stopAnimating()
                cell.activityIndicatorOutlet.isHidden = true
            }

            cell.completion = {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
            return cell
        }
        return UITableViewCell()
    }
}

extension ContentViewController: TagsCollectionViewDelegate {
    func update(index: Int) {
        
        fetchData(from: spaceObject?.link[index])
        print(index)
    }
}
