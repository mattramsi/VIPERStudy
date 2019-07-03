//
//  CheckboxCell.swift
//  IosMaster
//
//  Created by Matheus Ramos on 03/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import UIKit

class CheckboxCell: UITableViewCell, Validatable {
    
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var label: UILabel!
    var checkboxValid: Bool = false
    var form: Form!
    var value: Any?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.label.textColor = UIColor.lightGray
        self.btn.backgroundColor = .clear
        self.btn.setTitle("", for: .normal)
        self.btn.layer.cornerRadius = 5
        self.btn.layer.borderWidth = 1
        self.btn.layer.borderColor = UIColor.lightGray.cgColor
        self.btn.addTarget(self, action: #selector(validacao), for: UIControl.Event.touchUpInside)
    }
 
    @objc func validacao(){
        if(!checkboxValid){
            checkboxValid = true
            
            self.btn.backgroundColor = UIColor.red
        } else {
            checkboxValid = false
            self.btn.backgroundColor = .clear
        }
        value = checkboxValid
    }
    
    func setForm(form: Form) { self.form = form }
}
