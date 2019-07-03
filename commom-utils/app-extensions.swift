//
//  app-extensions.swift
//  IosMaster
//
//  Created by Matheus Ramos on 03/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import UIKit


extension UIButton {
    
    func roudedRed () {
        self.backgroundColor = .red
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func selectedTab() {
        self.backgroundColor = hexStringToUIColor(hex: "#B91000")
    }
    
    func deselectedTab() {
        self.backgroundColor = hexStringToUIColor(hex: "#ff0000")
    }
    
    
    
}



extension UIApplication {
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

extension String {
    
    
    var withoutSpecialCharacters: String {
        return self.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
    }
    
    
    var removingWhitespaces: String {
        return components(separatedBy: .whitespaces).joined()
    }
    
    
}


extension UITextField {
    
    func underlined(){
        
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.03702943
        
    }
    
    func validated(){
        self.layer.shadowColor = UIColor.green.cgColor
    }
    
    func invalidated(){
        self.layer.shadowColor = UIColor.red.cgColor
    }
    
}
