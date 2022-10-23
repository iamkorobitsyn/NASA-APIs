//
//  MoonViewController.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 05.10.2022.
//

import UIKit

protocol MoonViewControllerDelegate: AnyObject {
    func update(index: Int)
}

class MoonViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let header = HeaderView()
    private let tagsCollectionView = TagsCollectionView()
    private var data: FetchLibrary?
    
    var delegate: TagsCollectionViewDelegate?
    
    var spaceObject: SpaceObject?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let test = self.spaceObject?.title else {return}
        delegate?.updatee(object: test)
        
        tagsCollectionView.getspaceObject = spaceObject?.title
        tagsCollectionView.delegate = self
        
        
        
        
        createTableView()
        
    }

    
    private func createTableView() {
        tableView.register(UINib(nibName: "ImageCell", bundle: nil),
                           forCellReuseIdentifier: "ImageCell")
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.separatorStyle = .none
        
        header.headerImage.image = UIImage(named: "headerMoon")
        tableView.tableHeaderView = header.headerFrame
        
        
        
        fetchData(from: spaceObject?.link[0])
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchLibrary(from: url ?? "") { result in
            switch result {
            case.success(let success):
                self.data = success
        
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case.failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.frame
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
        return tagsCollectionView.viewFrame
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as? ImageCell {
            
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

extension MoonViewController: MoonViewControllerDelegate {
    func update(index: Int) {
        
        fetchData(from: spaceObject?.link[index])
        print(index)
    }
}
