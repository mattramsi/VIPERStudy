//
//  InvestimentoViewController.swift
//  IosMaster
//
//  Created by Matheus Ramos on 03/07/19.
//  Copyright © 2019 Curso IOS. All rights reserved.
//

import UIKit

class InvestimentoViewController: UIViewController {
    
    struct NameValueType {
    
        var name: String?
        var value: String?
        var type: String?
        
    }
    
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_fundName: UILabel!
    @IBOutlet weak var lbl_whatIs: UILabel!
    @IBOutlet weak var lbl_definition: UILabel!
    @IBOutlet weak var lbl_riskTitle: UILabel!
    @IBOutlet weak var lbl_infoTitle: UILabel!
    @IBOutlet weak var lbl_fundo_mes: UILabel!
    @IBOutlet weak var lbl_cdi_mes: UILabel!
    @IBOutlet weak var lbl_fundo_ano: UILabel!
    @IBOutlet weak var lbl_cdi_ano: UILabel!
    @IBOutlet weak var lbl_fundo_doze_meses: UILabel!
    @IBOutlet weak var lbl_cdi_doze_meses: UILabel!
    @IBOutlet weak var btn_investir: UIButton!
    
    var presentor: InvestimentoPresenter?
    @IBOutlet weak var view_scroll: UIView!
    
    var investimentoInfoArray: Array<NameValueType> = []
    @IBOutlet weak var uiTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        presentor?.startFetchInvestimento()
        
        self.btn_investir.roudedRed()
        uiTableView.register(UINib(nibName: "LabelValueCell", bundle: nil), forCellReuseIdentifier: "LabelValueCell")
        uiTableView.register(UINib(nibName: "LabelDownCell", bundle: nil), forCellReuseIdentifier: "LabelDownCell")
        uiTableView.delegate = self
        uiTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Investimento"
    }
    
}


extension InvestimentoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return investimentoInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let info = self.investimentoInfoArray[indexPath.row]
        
        if info.type == "info" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelValueCell", for: indexPath) as! LabelValueCell
            cell.lbl_name.text = info.name
            cell.lbl_value.text = info.value
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelDownCell", for: indexPath) as! LabelDownCell
            cell.lbl_name.text = info.name
            return cell
        }
        
        return UITableViewCell()
    }
    
}


extension InvestimentoViewController: PresenterToViewInvestimentoProtocol {
    
    func showInvestimento(investimentoArray: Array<InvestimentoInfo>) {
        
        self.setLabel(investimentoArray[0])

        for item in investimentoArray[0].info! {
            let itemFormated = NameValueType(name: item.name, value: item.data, type: "info")
            self.investimentoInfoArray.append(itemFormated)
        }
        
        for item in investimentoArray[0].downInfo! {
            let itemFormated = NameValueType(name: item.name, value: item.data, type: "downInfo")
            self.investimentoInfoArray.append(itemFormated)
        }
        
        
        self.uiTableView.reloadData()
        let height: CGFloat = CGFloat(40 * self.investimentoInfoArray.count)
        self.uiTableView.updateConstraint(attribute: .height, constant: height)
        self.view_scroll.updateConstraint(attribute: .height, constant: height + 700)
    }
    
    func setLabel (_ investimentoArray: InvestimentoInfo) {
        self.lbl_title.text = investimentoArray.title
        self.lbl_fundName.text = investimentoArray.fundName
        self.lbl_whatIs.text = investimentoArray.whatIs
        self.lbl_definition.text = investimentoArray.definition
        self.lbl_riskTitle.text = investimentoArray.riskTitle
        self.lbl_infoTitle.text = investimentoArray.infoTitle
        
        guard
            let moreInfo = investimentoArray.moreInfo,
            let month = moreInfo.month,
            let year = moreInfo.year,
            let months = moreInfo.months
        else {
            return
        }
        
        self.lbl_fundo_mes.text = "\(month.fund!)%"
        self.lbl_cdi_mes.text = "\(month.cDI!)%"
        self.lbl_fundo_ano.text = "\(year.fund!)%"
        self.lbl_cdi_ano.text = "\(year.cDI!)%"
        self.lbl_fundo_doze_meses.text = "\(months.fund!)%"
        self.lbl_cdi_doze_meses.text = "\(months.cDI!)%"
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Investimento", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
