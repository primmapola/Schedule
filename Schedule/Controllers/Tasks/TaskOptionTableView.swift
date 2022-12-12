//
//  TaskOptionScheduleView.swift
//  Schedule
//
//  Created by Grigory Don on 12.12.2022.
//

import UIKit

class TaskOptionTableView: UITableViewController {
    
    let idOptionsTasksCell = "idOptionsTasksCell"
    let idOptionsTasksHeader = "idOptionsTasksHeader"
    let headerNameArray = ["ДАТА", "НАЗВАНИЕ", "ЗАДАЧА", "ЦВЕТ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Option Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        tableView.separatorStyle = .none
        tableView.bounces = false
        
        tableView.register(OptionsTaskTableViewCell.self, forCellReuseIdentifier: idOptionsTasksCell)
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsTasksHeader)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsTasksCell, for: indexPath) as! OptionsTaskTableViewCell
        cell.cellConfiguration(indexPath: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsTasksHeader) as! HeaderOptionsTableViewCell
        header.headerConfiguration(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        25
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTaskTableViewCell
        
        switch indexPath.section {
        case 0:
            AlertDate(label: cell.nameCellLabel) { (numberWeekday, date) in
                print(numberWeekday, date)}
        case 1:
            alertForCellName(label: cell.nameCellLabel, name: "Название", placeholder: "Введите название заметки")
        case 2:
            alertForCellName(label: cell.nameCellLabel, name: "Задача", placeholder: "")
        case 3:
            pushControllers(vc: ColorTaskTableViewController())
        default:
            print("")
        }
        
        func pushControllers(vc: UIViewController) {
            
            let viewController = vc
            navigationController?.navigationBar.topItem?.title = "Options"
            navigationController?.pushViewController(viewController, animated: true)

        }
    }
}

