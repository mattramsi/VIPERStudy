//
//  protocols.swift
//  IosMaster
//
//  Created by Matheus Ramos on 02/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterContatoFormProtocol: class{
    
    var view: PresenterToViewContatoFormProtocol? {get set}
    var interactor: PresenterToInteractorContatoFormProtocol? {get set}
    var router: PresenterToRouterContatoFormProtocol? {get set}
    func startFetchingContatoForm()
    func showSuccessController(navigationController:UINavigationController)
    
}

protocol PresenterToViewContatoFormProtocol:class {
    func showContatoForm(contatoFormArray:Array<Cell>)
    func showError()
}

protocol PresenterToRouterContatoFormProtocol: class {
    static func createModule() -> ContatoFormViewController
    func pushToSuccessScreen(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorContatoFormProtocol: class {
    var presenter: InteractorToPresenterContatoFormProtocol? {get set}
    func fetchContatoForm()
}

protocol InteractorToPresenterContatoFormProtocol: class {
    func contatoFormFetchedSuccess(contatoFormModelArray:Array<Cell>)
    func contatoFormFetchFailed()
}
