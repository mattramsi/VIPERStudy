//
//  ContatoFormTableViewController.swift
//  IosMaster
//
//  Created by Matheus Ramos on 03/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit


protocol Validatable {
    var value: Any? { get set }
    func setForm(form: Form)
}

class Form {
    
    var fields: [Validatable] = []
    
    init() {
        
    }
    
    init(fields: [Validatable]) {
        
        if !fields.isEmpty {
            for i in 0...(self.fields.count - 1) {
                self.fields[i].setForm(form: self)
            }
        }
        
    }
    
    func addValidatable(field: Validatable) {
        self.fields.append(field)
        field.setForm(form: self)
    }
    
    
    func resultForm() {
        
        if !fields.isEmpty {
            for i in 0...(self.fields.count - 1) {
                print(self.fields[i].value)
            }
        }
  
    }
}

class ContatoFormViewController: UIViewController {
    
    var presentor: ContatoFormPresenter?
    var campos: Array<Cell> = []
    @IBOutlet weak var uiTableView: UITableView!
    var form = Form()
    var validatables: [Validatable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presentor?.startFetchingContatoForm()
        
        uiTableView.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "textFieldCell")
        uiTableView.register(UINib(nibName: "ButtonCell", bundle: nil), forCellReuseIdentifier: "ButtonCell")
        uiTableView.register(UINib(nibName: "CheckboxCell", bundle: nil), forCellReuseIdentifier: "CheckboxCell")
        uiTableView.delegate = self
        uiTableView.dataSource = self
        
        uiTableView.separatorStyle = .none
        uiTableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Contato"
    }
    
}

extension ContatoFormViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let campo = self.campos[indexPath.row]
        
        if campo.type == Type.field.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as! TextFieldCell
            cell.label.text = campo.message
            cell.typefield = campo.id!
     
            self.form.addValidatable(field: cell)
            return cell
        } else if campo.type == Type.checkbox.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckboxCell", for: indexPath) as! CheckboxCell
            cell.label.text = campo.message
             self.form.addValidatable(field: cell)
            return cell
        } else if campo.type == Type.send.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
            cell.parentVC = self
            cell.button.setTitle(campo.message, for: .normal)
  
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ContatoFormViewController: PresenterToViewContatoFormProtocol {
    
    func showContatoForm(contatoFormArray: Array<Cell>) {
        self.campos = contatoFormArray
        self.uiTableView.reloadData()
        
    }
    
    func showError() {
        
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Contato Form", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}




enum Type: Int {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}

enum TypeField: Int {
    case text = 2
    case telNumber = 6
    case email = 4
    case permiteEmail = 5
}
