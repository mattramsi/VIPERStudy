//
//  Interactor.swift
//  IosMaster
//
//  Created by Matheus Ramos on 02/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ContatoFormInteractor: PresenterToInteractorContatoFormProtocol {
    
    var presenter: InteractorToPresenterContatoFormProtocol?
    
    func fetchContatoForm() {
        Alamofire.request(API_CONTATO_FORM_LIST).responseJSON { response in
            
            if(response.response?.statusCode == 200){
                if let json = response.result.value as AnyObject? {
                    let arrayResponse = json["cells"] as! NSArray
                    let arrayObject = Mapper<Cell>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                    self.presenter?.contatoFormFetchedSuccess(contatoFormModelArray: arrayObject)
                }
            }else {
                self.presenter?.contatoFormFetchFailed()
            }
        }
    }
}
