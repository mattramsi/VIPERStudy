//
//  Form.swift
//  IosMaster
//
//  Created by Matheus Ramos on 03/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import UIKit

class Form {
    
    var fields: [Validatable] = []
    
    init() {}
    
    init(fields: [Validatable]) {
        
        if !fields.isEmpty {
            for i in 0...(self.fields.count - 1) {
                self.fields[i].setForm(form: self)
            }
        }
    }
    
    func addValidatable(field: Validatable) {
        self.fields.append(field)
        field.setForm(form: self)
    }
    
    
    func resultForm() {
        
        if !fields.isEmpty {
            for i in 0...(self.fields.count - 1) {
                print(self.fields[i].value)
            }
        }
    }
}
