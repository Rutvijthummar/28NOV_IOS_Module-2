//
//  SimpleAlertFunction.swift
//  M5ASS16
//
//  Created by MAC on 24/05/23.
//

import Foundation
import UIKit


class utilityFunction : NSObject {
    func showSimpleAlert(vc : UIViewController, title : String, message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(okAction)
        vc.present(alert, animated: true, completion: nil)
    }
}
