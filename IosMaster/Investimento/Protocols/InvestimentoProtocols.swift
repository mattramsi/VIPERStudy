//
//  InvestimentoProtocols.swift
//  IosMaster
//
//  Created by Matheus Ramos on 03/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterInvestimentoProtocol: class { // Presenter
    var view: PresenterToViewInvestimentoProtocol? { get set }
    var interactor: PresenterToInteractorInvestimentoProtocol? { get set }
    var router: PresentToRouterInvestimentoProtocol? { get set }
    func startFetchInvestimento()
    func showInvestimentoSuccess(navigationController: UINavigationController)
}

protocol PresenterToViewInvestimentoProtocol: class { // View
    func showInvestimento(investimentoArray:Array<InvestimentoInfo>)
    func showError()
}

protocol PresenterToInteractorInvestimentoProtocol: class { //Interactor
    var presenter: InteractorToPresenterInvestimentoProtocol? { get set }
    func fetchInvestimento()
}

protocol PresentToRouterInvestimentoProtocol: class { // Router
     static func createModule() -> InvestimentoViewController
     func pushToSuccessScreen(navigationConroller:UINavigationController)
}

protocol InteractorToPresenterInvestimentoProtocol: class { ///Presenter
    func investimentoFetchedSuccess(investimentoModelArray:Array<InvestimentoInfo>)
    func investimentoFetchFailed()
}

