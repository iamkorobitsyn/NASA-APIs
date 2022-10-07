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
    private let tagsView = TagsView()
    private var data: FetchLibrary?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        header.headerImage.image = UIImage(named: "headerMoon")
        tableView.tableHeaderView = header.headerFrame
        navigationSettings()
        fetchData(from: MoonLink.photoLibrary.rawValue)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let text = data?.collection.items[indexPath.row].data[indexPath.startIndex]
        cell.textLabel?.text = text?.description
        
        return cell
    }
}
