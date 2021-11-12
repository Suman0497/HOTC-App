//
//  VideoSubfolderCollectionViewCell.swift
//  Wedding Album
//
//  Created by apple on 02/11/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class VideoSubfolderCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var overlay: PlayVideoClass!

    @IBOutlet weak var titlelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        overlay.alpha = 1
    }

}
