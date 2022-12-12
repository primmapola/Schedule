//
//  ContactOptionTableViewController.swift
//  Schedule
//
//  Created by Grigory Don on 12.12.2022.
//

import UIKit

class ContactOptionTableViewController: UITableViewController {
    
    let idOptionsContactCell = "idOptionsContactCell"
    let idOptionsContactHeader = "idOptionsContactHeader"
    let headerNameArray = ["ИМЯ", "ТЕЛЕФОН", "ПОЧТА", "ТИП", "ВЫБЕРИТЕ ИЗОБРАЖЕНИЕ"]
    
    let cellNameArray = ["name", "phone", "mail", "type", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Option Schedule"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        tableView.separatorStyle = .none
        tableView.bounces = false
        
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsContactCell)
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsContactHeader)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsContactCell, for: indexPath) as! OptionsTableViewCell
        cell.cellContactCofiguration(nameArray: cellNameArray, indexPath: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 4 ? 200 : 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsContactHeader) as! HeaderOptionsTableViewCell
        header.headerConfiguration(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        25
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath.section {
        case 0:
            alertForCellName(label: cell.nameCellLabel, name: "Имя", placeholder: "Введите имя")
        case 1:
            alertForCellName(label: cell.nameCellLabel, name: "Телефон", placeholder: "Введите номер телефона")
        case 2:
            alertForCellName(label: cell.nameCellLabel, name: "Почта", placeholder: "Введите электронный адрес")
        case 3: alertContact(label: cell.nameCellLabel) { (type) in
            print(type)
        }
        default:
            print("asd")
        }
        
        func pushControllers(vc: UIViewController) {
            
            let viewController = vc
            navigationController?.navigationBar.topItem?.title = "Options"
            navigationController?.pushViewController(viewController, animated: true)

        }
    }
}
