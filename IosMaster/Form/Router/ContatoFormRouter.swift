//
//  ContatoFormRouter.swift
//  IosMaster
//
//  Created by Matheus Ramos on 03/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import UIKit

class ContatoFormRouter: PresenterToRouterContatoFormProtocol {
    
    func pushToSuccessScreen(navigationConroller: UINavigationController) {
        navigationConroller.pushViewController(navigationConroller, animated: true)
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    
    static func createModule() -> ContatoFormViewController {

        let view = mainstoryboard.instantiateViewController(withIdentifier: "ContatoFormViewController") as! ContatoFormViewController
        
        let presenter: ViewToPresenterContatoFormProtocol & InteractorToPresenterContatoFormProtocol = ContatoFormPresenter()
        let interactor: PresenterToInteractorContatoFormProtocol = ContatoFormInteractor()
        let router: PresenterToRouterContatoFormProtocol = ContatoFormRouter()
        
        view.presentor = presenter as! ContatoFormPresenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
        
    }
}
