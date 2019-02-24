//
//  ContentListCell.swift
//  SPHExam
//
//  Created by Joseph Chua on 24/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import UIKit

class ContentListCell: UICollectionViewCell{
    
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgViewThumbnail: UIImageView!
    @IBOutlet weak var actIndicatorImageLoad: UIActivityIndicatorView!
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
    }
}
