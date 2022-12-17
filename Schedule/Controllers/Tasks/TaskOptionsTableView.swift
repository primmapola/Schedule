//
//  TaskOptionScheduleView.swift
//  Schedule
//
//  Created by Grigory Don on 12.12.2022.
//

import UIKit

class TaskOptionsTableView: UITableViewController {
    
    let idOptionsTasksCell = "idOptionsTasksCell"
    let idOptionsTasksHeader = "idOptionsTasksHeader"
    
    let headerNameArray = ["ДАТА", "НАЗВАНИЕ", "ЗАДАЧА", "ЦВЕТ"]
    let cellNames = ["Дата","Название","Задача",""]
    
    var hexColorAttribute = "1A4766"
    
    var taskModel = TaskModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Option Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        tableView.separatorStyle = .none
        tableView.bounces = false
        
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsTasksCell)
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsTasksHeader)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
    }
    
    @objc func saveButtonTapped() {
        taskModel.taskColor = hexColorAttribute
//        StorageManager.shared.save(model: taskModel)
        taskModel = TaskModel()
        alertOk(title: "Сохранено")
        hexColorAttribute = "1A4766"
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsTasksCell, for: indexPath) as! OptionsTableViewCell
        cell.cellTaskConfiguration(nameArray: cellNames, indexPath: indexPath, hexColor: hexColorAttribute)
        
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
        
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath.section {
        case 0:
            AlertDate(label: cell.nameCellLabel) { [self] (date) in
                taskModel.taskDate = date
            }
        case 1:
            alertForCellName(label: cell.nameCellLabel, name: "Название", placeholder: "ВВедите название") { [self] name in
                taskModel.taskName = name
            }
        case 2:
            alertForCellName(label: cell.nameCellLabel, name: "Содержимое", placeholder: "") { [self] content in
                taskModel.taskContent = content
            }
        case 3:
            let colors = TaskColorsTableViewController()
            pushControllers(vc: colors)
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

