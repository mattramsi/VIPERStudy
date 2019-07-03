//
//  ViewController.swift
//  IosMaster
//
//  Created by Matheus Ramos on 02/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit


class NavCustom: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.restorationIdentifier = "NavCustom"
        self.navigationBar.tintColor = UIColor.black
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navigationBar.isTranslucent = false
        navigationBar.topItem?.title = self.visibleViewController?.title
    }
    
    
    func setTitle(title: String) {
        navigationBar.topItem?.title = title
    }
    
    func setUploadButton() {
        var image = resizeImage(image: UIImage(named: "ic-upload")!, targetSize: CGSize(width: 30, height: 30))
        let btn_upload = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
        self.visibleViewController?.navigationItem.rightBarButtonItem = btn_upload
    }
    
    func removeUploadButton() {
        self.visibleViewController?.navigationItem.rightBarButtonItem = nil
    }
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
    }
    
    
}


class ViewController: UIViewController {

    @IBOutlet weak var main_view: UIView!
    
    @IBOutlet weak var btn_contato: UIButton!
    
    @IBOutlet weak var btn_investimento: UIButton!
    
    var tabIndex: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.setConstraintsTab()
        self.setTab(index: 1)
    }
    
    
    func setTab(index: Int) {
        
        if index == 1 {
            
            if let navCustom = self.navigationController as? NavCustom {
                navCustom.setTitle(title: "Investimento")
                navCustom.setUploadButton()
            }
        
            
            let investimentoVC = InvestimentoRouter.createModule()
            addViewControllerToContainer(asChildViewController: investimentoVC, view_container: main_view, viewMain: self)
            
            self.btn_investimento.selectedTab()
            self.btn_contato.deselectedTab()
        } else {
            
            if let navCustom = self.navigationController as? NavCustom {
                navCustom.setTitle(title: "Contato")
                navCustom.removeUploadButton()
            }
            
            let contatoVC = ContatoFormRouter.createModule()
            addViewControllerToContainer(asChildViewController: contatoVC, view_container: main_view, viewMain: self)
            
            self.btn_investimento.deselectedTab()
            self.btn_contato.selectedTab()
        }
    }
    
    func setConstraintsTab() {
        let widthBtnContatoConstraint = NSLayoutConstraint(item: self.btn_contato!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: self.view.frame.width/2)
        let widthBtnInvestimentoConstraint = NSLayoutConstraint(item: self.btn_investimento!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: self.view.frame.width/2)
        let trailingConstraint = NSLayoutConstraint(item: self.btn_investimento!, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.btn_contato, attribute:  NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: self.btn_contato!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.btn_investimento, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([trailingConstraint, leadingConstraint, widthBtnContatoConstraint, widthBtnInvestimentoConstraint])
    }
    
    @IBAction func openInvestimento(_ sender: Any) {
        self.setTab(index: 1)
    }

    @IBAction func openContato(_ sender: Any) {
       self.setTab(index: 2)
    }
    
}

