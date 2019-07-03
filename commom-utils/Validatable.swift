//
//  Validatable.swift
//  IosMaster
//
//  Created by Matheus Ramos on 03/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import UIKit

protocol Validatable {
    var value: Any? { get set }
    func setForm(form: Form)
}


