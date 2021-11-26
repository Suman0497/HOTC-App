//
//  PhotoAlbumCollectionViewCell.swift
//  Wedding Album
//
//  Created by apple on 26/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class PhotoAlbumCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var albumImages: UIImageView!
    
    
    @IBOutlet weak var albumTitles: UILabel!

    @IBOutlet weak var overlayView: UIView!
    
    
    override func awakeFromNib() {
        
        
        super.awakeFromNib()
        overlayView.alpha = 0.3
    }
    
}
