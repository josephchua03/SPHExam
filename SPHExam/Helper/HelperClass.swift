//
//  HelperClass.swift
//  SPHExam
//
//  Created by Joseph Chua on 24/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import UIKit

//MARK: Alert Message
func displayAlertMessage(vc:UIViewController,alertTitle:String, alertMessage:String, handler:((UIAlertAction) -> Void)? = nil) -> UIAlertController? {
    let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
    vc.present(alert, animated: true, completion: nil)
    return alert
}
