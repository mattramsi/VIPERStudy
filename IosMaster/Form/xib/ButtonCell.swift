//
//  ButtonCell.swift
//  IosMaster
//
//  Created by Matheus Ramos on 03/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import UIKit

class ButtonCell: UITableViewCell {
    
    var parentVC: ContatoFormViewController?
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.button.roudedRed()
    }
    

    @IBAction func action(_ sender: Any) {
        setAction()
    }
    
    
    func setAction() {
        
        if let title = self.button.titleLabel?.text {
            switch title {
            case "Enviar":
                
               
                if let viewController = parentVC as? ContatoFormViewController {
                    parentVC?.form.resultForm()
                    let successView = createNib(nameNib: "MensagemEnviadaView", classe: MensagemEnviadaView.self)
                    successView?.tag = 199
                    successView?.enviarNovaMensagem = {
                        
                        if let successView = viewController.view.viewWithTag(199) as? MensagemEnviadaView {
                            successView.removeFromSuperview()
                        }
                    }
                    
                    addNib(model: successView, view_container: viewController.view)
                }
                break
            default:
                print("No action")
                break
            }
        }
    }
    
}


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


