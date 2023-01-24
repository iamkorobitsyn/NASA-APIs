//
//  MoonViewController.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 05.10.2022.
//

import UIKit

protocol collectionViewForHeaderOfSectionDelegate: AnyObject {
    func update(index: Int)
}

class ContentViewController: UIViewController {
    
    private var data: FetchLibrary?
    var spaceObject: SpaceObject?
    
    @IBOutlet weak var tableView: UITableView!
    private let tableViewHeader = headerView()
    private let collectionViewForHeaderOfSection = headerViewForSection()

    private let activityIndicator = UIActivityIndicatorView(style: .medium)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        instanceTableView()
        collectionViewForHeaderOfSection.getspaceObject = spaceObject?.title
        collectionViewForHeaderOfSection.delegate = self
    }
    
    //MARK: - Instance UITableView

    private func instanceTableView() {
        tableView.register(UINib(nibName: "ContentViewCell", bundle: nil),
                           forCellReuseIdentifier: "ContentViewCell")
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.separatorStyle = .none
        tableView.backgroundColor = .none
        tableViewHeader.headerImage.image = UIImage(named: spaceObject?.image ?? "")
        tableView.tableHeaderView = tableViewHeader.headerFrame
        fetchData(from: spaceObject?.link[0])
        setupActivityIndicator()
    }
    
    //MARK: - Activity Indicator
    
    private func setupActivityIndicator() {
        tableView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.tableView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.tableView.centerYAnchor),
            activityIndicator.widthAnchor.constraint(equalTo: self.tableView.widthAnchor),
            activityIndicator.heightAnchor.constraint(equalTo: self.tableView.heightAnchor),
        ])
        activityIndicator.startAnimating()
    }
    
    //MARK: - Fetch Data
    
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

//MARK: - UITableView DataSourse & Delegate
    
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
        return collectionViewForHeaderOfSection.viewFrame
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ContentViewCell", for: indexPath) as? ContentViewCell {
            let pictureDescription = data?.collection.items[indexPath.row].data[indexPath.startIndex]
            let image = data?.collection.items[indexPath.row].links[indexPath.startIndex]
            cell.pictureDescription?.text = pictureDescription?.description
            cell.selectionStyle = .none
            cell.pictureOutlet.image = .none
            cell.activityIndicatorOutlet.isHidden = false
            cell.activityIndicatorOutlet.startAnimating()

            cell.pictureOutlet.fetchImage(from: image?.href ?? "", cash: true) {
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

extension ContentViewController: collectionViewForHeaderOfSectionDelegate {
    func update(index: Int) {
        
        fetchData(from: spaceObject?.link[index])
        print(index)
    }
}
