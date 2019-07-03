//
//  InvestimentoRouter.swift
//  IosMaster
//
//  Created by Matheus Ramos on 03/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import Foundation
import UIKit

class InvestimentoRouter: PresentToRouterInvestimentoProtocol {
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    
    static func createModule() -> InvestimentoViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "InvestimentoViewController") as! InvestimentoViewController
        
        let presenter: ViewToPresenterInvestimentoProtocol & InteractorToPresenterInvestimentoProtocol = InvestimentoPresenter()
        let interactor: PresenterToInteractorInvestimentoProtocol = InvestimentoInteractor()
        let router: PresentToRouterInvestimentoProtocol = InvestimentoRouter()
        
        view.presentor = presenter as! InvestimentoPresenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
        
    }
    
    func pushToSuccessScreen(navigationConroller: UINavigationController) {
        navigationConroller.pushViewController(navigationConroller, animated: true)
    }
    
}
