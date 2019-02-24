//
//  ContentListDelegate.swift
//  SPHExam
//
//  Created by Joseph Chua on 24/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import UIKit
extension ContentListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        let detail:RecordData = listItems[indexPath.row]
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle(for: self.classForCoder))
        let vc: ContentDetailViewController = storyboard.instantiateViewController(withIdentifier: "ContentDetailViewController") as! ContentDetailViewController
        vc.detail = detail
        self.navigationController?.show(vc, sender: nil)
    }
    
}
