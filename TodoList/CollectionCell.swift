//
//  CollectionCell.swift
//  Project
//
//  Created by Sherzod on 10/03/22.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var collView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collView.layer.masksToBounds = false
        collView.layer.shadowColor = UIColor.systemGray3.cgColor
        collView.layer.shadowOpacity = 0.4
        collView.layer.shadowOffset = CGSize(width: 1, height: 5)
        collView.layer.shadowRadius = 4
        collView.layer.cornerRadius = 5
        
        
    }
    
}
