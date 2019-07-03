//
//  LabelValueView.swift
//  IosMaster
//
//  Created by Matheus Ramos on 03/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import UIKit

class LabelValueCell: UITableViewCell {
    
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_value: UILabel!
    
}


class LabelDownCell: UITableViewCell {
    
    @IBOutlet weak var lbl_name: UILabel!
    
    @IBAction func download(_ sender: Any) {
        guard let url = URL(string: "https://google.com") else { return }
        UIApplication.shared.open(url)
        
    }
    
}
