//
//  ContatoFormPresenter.swift
//  IosMaster
//
//  Created by Matheus Ramos on 02/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import UIKit

class ContatoFormPresenter: ViewToPresenterContatoFormProtocol {
    
    var view: PresenterToViewContatoFormProtocol?
    
    var interactor: PresenterToInteractorContatoFormProtocol?
    
    var router: PresenterToRouterContatoFormProtocol?
    
    func startFetchingContatoForm() {
        interactor?.fetchContatoForm()
    }
    
    func showSuccessController(navigationController: UINavigationController) {
        router?.pushToSuccessScreen(navigationConroller: navigationController)
    }
   
}

extension ContatoFormPresenter: InteractorToPresenterContatoFormProtocol {
    
    func contatoFormFetchedSuccess(contatoFormModelArray: Array<Cell>) {
        view?.showContatoForm(contatoFormArray: contatoFormModelArray)
    }
    
    func contatoFormFetchFailed() {
        view?.showError()
    }
    
}



