//
//  ContentListDataSource.swift
//  SPHExam
//
//  Created by Joseph Chua on 24/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import UIKit

extension ContentListViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return listItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentListCell", for: indexPath) as! ContentListCell
        
        let detail:RecordData = listItems[indexPath.row]
        cell.lblTitle.text = detail.year
        cell.lblSubtitle.text = String(detail.totalRecord)
        if !detail.imageIconName.isEmpty {
            cell.imgViewThumbnail.image = UIImage.init(imageLiteralResourceName: detail.imageIconName)
            
        }
        return cell
    }
    
    
}
