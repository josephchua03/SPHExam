//
//  ContentListViewController.swift
//  SPHExam
//
//  Created by Joseph Chua on 24/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import UIKit

class ContentListViewController:UIViewController {
    
    @IBOutlet weak var lblNoResult: UILabel!
    @IBOutlet weak var actIndicator: UIActivityIndicatorView!
    @IBOutlet weak var colListData: UICollectionView!
    var listItems = Array<RecordData>()
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataList()
    }
    
    func getDataList(){
        self.actIndicator.startAnimating()
        getListDataFromAPIWithParameters(completion: {(data:DataResponse) in
            DispatchQueue.main.async {
                self.actIndicator.stopAnimating()
                self.listItems = generateData(data: data)
                self.displayData(boolean: !self.listItems.isEmpty)
            }
        },
        serviceError: { (errorMessage:String) in
            DispatchQueue.main.async {
                self.displayData(boolean: false)
                _ = displayAlertMessage(vc: self,alertTitle: "Error" ,alertMessage: errorMessage)
            }
        })
        
    }
    
    func displayData(boolean:Bool){
        if boolean {
            self.lblNoResult.isHidden = true
            self.colListData.reloadData()
        }
        else{
            self.actIndicator.stopAnimating()
            self.lblNoResult.isHidden = false
        }
    }
    
}
