//
//  VideoCorrosalCollectionViewCell.swift
//  Wedding Album
//
//  Created by apple on 27/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class VideoCorrosalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titles: UILabel!
    
    
    @IBOutlet weak var overlay: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        overlay.alpha = 0.3
    }
    
    
}
