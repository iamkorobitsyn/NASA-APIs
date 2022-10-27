//
//  TagsView.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 07.10.2022.
//

import Foundation
import UIKit

class TagsCollectionView: UIView {
   
    var getspaceObject: [String]?
    var delegate: ContentViewController?

    private var selectedCell: IndexPath = [0, 0]

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
        tagsCollection.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        tagsCollection.backgroundColor = UIColor.black.withAlphaComponent(1)
        tagsCollection.dataSource = self
        tagsCollection.delegate = self
        tagsCollection.register(UINib(nibName: "TagsCell", bundle: nil), forCellWithReuseIdentifier: "TagsCell")
       
        tagsCollection.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TagsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getspaceObject?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = tagsCollection.dequeueReusableCell(withReuseIdentifier: "TagsCell",
                                                         for: indexPath) as? TagsCell {
            
            cell.label.text = getspaceObject?[indexPath.row]
            cell.backgroundColor = UIColor.systemGray4.withAlphaComponent(1)
            cell.layer.cornerRadius = 7
            
            tagsCollection.cellForItem(at: selectedCell)?.backgroundColor =
            UIColor.upGradient.withAlphaComponent(1)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let updateSize = UILabel(frame: CGRect.zero)
        updateSize.text = getspaceObject?[indexPath.item]
        updateSize.sizeToFit()
        return CGSize(width: updateSize.frame.width + 30, height: 35)
    }
        
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tagsCollection.cellForItem(at: selectedCell)?.backgroundColor =
        UIColor.systemGray4.withAlphaComponent(1)
        tagsCollection.cellForItem(at: indexPath)?.backgroundColor =
        UIColor.upGradient.withAlphaComponent(1)
        selectedCell = indexPath
        delegate?.update(index: indexPath.row)
        
        
    }
}
