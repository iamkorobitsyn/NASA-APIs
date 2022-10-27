//
//  ObserverViewCell.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 25.10.2022.
//

import UIKit

class ObserverViewCell: UITableViewCell {
    
    let openView = UIView()
    let browsingLabel = UILabel()
    var nameLabel = UILabel()
    let nameIcon = UIImageView()
    let browseIcon = UIImageView()
    
    var completion: (() -> ())?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        createOpenView()
        createBrowsingLabel()
        createNameLabel()
        createNameIcon()
        createBrowseIcon()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        self.openView.addGestureRecognizer(tap)
    }
    
    @objc func didTap() {
        completion?()
    }
    
    private func createBrowseIcon() {
        self.addSubview(browseIcon)
        browseIcon.translatesAutoresizingMaskIntoConstraints = false
        browseIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        browseIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        browseIcon.centerYAnchor.constraint(equalTo: browsingLabel.centerYAnchor).isActive = true
        browseIcon.trailingAnchor.constraint(equalTo: browsingLabel.leadingAnchor, constant: -10).isActive = true
        browseIcon.tintColor = UIColor.label.withAlphaComponent(0.5)
        browseIcon.image = .init(systemName: "arrow.forward.circle.fill")
    }
    
    private func createNameIcon() {
        self.addSubview(nameIcon)
        nameIcon.translatesAutoresizingMaskIntoConstraints = false
        nameIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        nameIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameIcon.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
        nameIcon.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: -10).isActive = true
        nameIcon.tintColor = UIColor.label.withAlphaComponent(0.5)
        nameIcon.image = .init(systemName: "person")
        
    }
    
    private func createNameLabel() {
        self.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width - 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: openView.topAnchor, constant: -10 ).isActive = true
        nameLabel.text = "Default Name"
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 25, weight: .thin)
        
        
    }
    
    private func createBrowsingLabel() {
        self.addSubview(browsingLabel)
        browsingLabel.translatesAutoresizingMaskIntoConstraints = false
        browsingLabel.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width / 2 - 10).isActive = true
        browsingLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        browsingLabel.centerXAnchor.constraint(equalTo: openView.centerXAnchor).isActive = true
        browsingLabel.centerYAnchor.constraint(equalTo: openView.centerYAnchor).isActive = true
        browsingLabel.text = "Start browsing"
        browsingLabel.textAlignment = .center
        browsingLabel.font = .systemFont(ofSize: 20, weight: .ultraLight)
    }
    
    private func createOpenView() {
        contentView.addSubview(openView)
        openView.translatesAutoresizingMaskIntoConstraints = false
        openView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
        openView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        openView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        openView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10) .isActive = true
        openView.layer.borderWidth = 0.5
        openView.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        openView.layer.cornerRadius = 10
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

}
