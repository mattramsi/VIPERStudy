//
//  MensagemEnviadaView.swift
//  IosMaster
//
//  Created by Matheus Ramos on 03/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import UIKit

class MensagemEnviadaView: UIView {
    
    var enviarNovaMensagem: (() -> Void)?
   
    @IBAction func enviarNovaMensagem(_ sender: Any) {
        self.enviarNovaMensagem?()
    }
    
}
