//
//  TagsView.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 07.10.2022.
//

import Foundation
import UIKit

class TagsView: UIView {
    
    let textArray = ["Brat", "Brat Bratan", "Brat Bratan Bratishka", "Bro"]
    
    let viewFrame = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
    var tagsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewFrame.addSubview(tagsCollection)
        tagsCollection.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 55)
        tagsCollection.dataSource = self
        tagsCollection.delegate = self
        tagsCollection.register(UINib(nibName: "TagsCell", bundle: nil), forCellWithReuseIdentifier: "TagsCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TagsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = tagsCollection.dequeueReusableCell(
            withReuseIdentifier: "TagsCell", for: indexPath) as? TagsCell {
            cell.button.setTitle(textArray[indexPath.row], for: .normal)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
                label.text = textArray[indexPath.item]
                label.sizeToFit()
                return CGSize(width: label.frame.width + 25, height: 55)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    
}
