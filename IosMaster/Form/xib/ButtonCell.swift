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
                
                if parentVC!.form.resultForm() {
                    let successView = createNib(nameNib: "MensagemEnviadaView", classe: MensagemEnviadaView.self)
                    successView?.tag = 199
                    successView?.enviarNovaMensagem = {
                        
                        if let successView = self.parentVC?.view.viewWithTag(199) as? MensagemEnviadaView {
                            successView.removeFromSuperview()
                        }
                    }
                    
                    addNib(model: successView, view_container: parentVC?.view)
                } else {
                    let alert = UIAlertController(title: "Alert", message: "Formulário Incompleto!", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                    parentVC?.present(alert, animated: true, completion: nil)
                }
               
                
                break
            default:
                print("No action")
                break
            }
        }
    }
    
}



