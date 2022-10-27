//
//  NewObserverViewCell.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 26.10.2022.
//

import UIKit

class NewObserverViewCell: UITableViewCell {
    
    let openView = UIView()
    let label = UILabel()
    let icon = UIImageView()
    
    var completion: (() -> ())?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        createOpenView()
        createLabel()
        createIcon()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        openView.addGestureRecognizer(tap)
    }
    
    @objc func didTap() {
        completion?()
    }
    
    
    private func createIcon() {
        self.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        icon.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
        icon.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -10).isActive = true
        icon.tintColor = UIColor.label.withAlphaComponent(0.5)
        icon.image = .init(systemName: "plus")
    }
    
    private func createLabel() {
        openView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width / 2).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.centerXAnchor.constraint(equalTo: openView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: openView.centerYAnchor).isActive = true
        label.text = "Add new observer"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .ultraLight)
    }
    
    private func createOpenView() {
        contentView.addSubview(openView)
        openView.translatesAutoresizingMaskIntoConstraints = false
        openView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 1.5).isActive = true
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

        // Configure the view for the selected state
    }

}
