//
//  ContentDetailViewController.swift
//  SPHExam
//
//  Created by Joseph Chua on 24/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import UIKit
class ContentDetailViewController:UIViewController {
    @IBOutlet weak var imgViewIcon: UIImageView!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblQuarter: UILabel!
    var detail = RecordData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgViewIcon.image = UIImage.init(imageLiteralResourceName: detail.imageIconName)
        lblYear.text = detail.year
        lblTotal.text = String(detail.totalRecord)
        var stringQuarterDetail = ""
        for info in detail.records {
            stringQuarterDetail.append(info.quarter + " : " + info.volumeOfMobileData + "\n")
        }
        lblQuarter.text = stringQuarterDetail
    }
    
}
