//
//  InvestimentoPresenter.swift
//  IosMaster
//
//  Created by Matheus Ramos on 03/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import UIKit

class InvestimentoPresenter: ViewToPresenterInvestimentoProtocol {
    
    var view: PresenterToViewInvestimentoProtocol?
    
    var interactor: PresenterToInteractorInvestimentoProtocol?
    
    var router: PresentToRouterInvestimentoProtocol?
    
    func startFetchInvestimento() {
        interactor?.fetchInvestimento()
    }
    
    func showInvestimentoSuccess(navigationController: UINavigationController) {
        router?.pushToSuccessScreen(navigationConroller: navigationController)
    }

}

extension InvestimentoPresenter: InteractorToPresenterInvestimentoProtocol {
    
    func investimentoFetchedSuccess(investimentoModelArray: Array<InvestimentoInfo>) {
        view?.showInvestimento(investimentoArray: investimentoModelArray)
    }
    
    func investimentoFetchFailed() {
        view?.showError()
    }

}
