//
//  app-constants.swift
//  IosMaster
//
//  Created by Matheus Ramos on 02/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import UIKit

let API_CONTATO_FORM_LIST:String = "https://floating-mountain-50292.herokuapp.com/cells.json"
let API_INVESTIMENTO_LIST:String = "https://floating-mountain-50292.herokuapp.com/fund.json"


func addNib(model: UIView?, view_container: UIView?){
    
    if (model != nil && view_container != nil) {
        model!.frame = view_container!.bounds
        view_container!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view_container!.addSubview(model!)
    } else {
        print("Não foi possível carregar view");
    }
}

func createNib<T>(nameNib: String?, classe: T.Type) -> T? {
    
    if let model = Bundle.main.loadNibNamed(nameNib!, owner: nil, options: nil)?.first as? T {
        
        return model
    }
    
    return nil
}

extension UIView {
    
    func updateConstraint(attribute: NSLayoutConstraint.Attribute, constant: CGFloat) -> Void {
        DispatchQueue.main.async(execute: {
            if let constraint = (self.constraints.filter{$0.firstAttribute == attribute}.first) {
                constraint.constant = constant
                self.layoutIfNeeded()
            }
        })
    }
}

func matches(regex: String, string: String?) -> Bool {
    return string?.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
}


func addViewControllerToContainer(asChildViewController viewController: UIViewController, view_container: UIView, viewMain: UIViewController) {
  
    viewController.view.frame = view_container.bounds;
    viewController.willMove(toParent: viewMain)
    view_container.addSubview(viewController.view)
    viewMain.addChild(viewController)
    viewController.didMove(toParent: viewMain)
    
}

func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size
    
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
