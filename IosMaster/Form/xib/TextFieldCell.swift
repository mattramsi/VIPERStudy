//
//  TextFieldCell.swift
//  IosMaster
//
//  Created by Matheus Ramos on 03/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import UIKit

class TextFieldCell: UITableViewCell, Validatable {
    
    var value: Any?
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btn_clear: UIButton!
    var typefield: Int = 1
    let maskCelular = MaskCelular()
    var form: Form!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.btn_clear.isHidden = true
        self.label.textColor = UIColor.lightGray
        self.textField.underlined()
        self.textField.addTarget(self, action: #selector(validacao), for: .editingChanged)
    }
    
    @IBAction func clear(_ sender: Any) {
        self.textField.text = ""
        self.btn_clear.isHidden = true
        self.textField.underlined()
    }
    
    @objc func validacao() {
        self.btn_clear.isHidden = false
    
        switch typefield {
        case 2:
            self.textField.validated()
            break
        case 4:
            self.textField.validated()
            if matches(regex: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", string: self.textField.text) {
                self.textField.validated()
            } else {
                self.textField.invalidated()
            }
            break
        case 6:
            self.textField.delegate = maskCelular
            if matches(regex: "^[0-9]{11}$", string: self.textField.text?.withoutSpecialCharacters.removingWhitespaces) {
                self.textField.validated()
            } else {
                self.textField.invalidated()
            }
            break
        default:
            break
        }
        
        value = self.textField.text
    }
    
    
    func setForm(form: Form) { self.form = form }
}



class MaskCelular: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text?.count == 2 && string.count != 0 {
            textField.text = "(" + textField.text! + ") "
        }
        else if textField.text?.count == 10 && string.count != 0 {
            textField.text = textField.text! + "-"
        }
        if textField.text?.count == 15 && string.count != 0 {
            return false
        }
        return true
    }
    
}
