//
//  InvestimentoInteractor.swift
//  IosMaster
//
//  Created by Matheus Ramos on 03/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class InvestimentoInteractor: PresenterToInteractorInvestimentoProtocol {
    
    var presenter: InteractorToPresenterInvestimentoProtocol?
    
    func fetchInvestimento() {
   
        Alamofire.request(API_INVESTIMENTO_LIST).responseJSON { response in
            
            if(response.response?.statusCode == 200){
                if let json = response.result.value as AnyObject? {
                    let arrayResponse = [json["screen"]] as! NSArray
                    let arrayObject = Mapper<InvestimentoInfo>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                    self.presenter?.investimentoFetchedSuccess(investimentoModelArray: arrayObject)
                }
            }else {
                self.presenter?.investimentoFetchFailed()
            }
        }
        
    }
    
    
}
