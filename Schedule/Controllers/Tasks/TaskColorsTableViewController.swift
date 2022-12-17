//
//  TaskColorsTableViewController.swift
//  Schedule
//
//  Created by Grigory Don on 12.12.2022.
//

import UIKit

class TaskColorsTableViewController: UITableViewController {
    
    let idOptionsColorCell = "idOptionsColorCell"
    let idOptionsScheduleHeader = "idOptionsScheduleHeader"
    let headerNameArray = ["Красный","Оранжевый","Желтый", "Зеленый", "Синий", "Темно синий", "Белый"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Color Schedule"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        tableView.separatorStyle = .none
        tableView.bounces = false
        
        tableView.register(ColorTableViewCell.self, forCellReuseIdentifier: idOptionsColorCell)
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsScheduleHeader)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsColorCell, for: indexPath) as! ColorTableViewCell
        cell.cellConfiguration(indexPath: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsScheduleHeader) as! HeaderOptionsTableViewCell
        header.headerConfiguration(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        25
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            setColor(color: "BE2813")
        case 1:
            setColor(color: "F07F5A")
        case 2:
            setColor(color: "F3AF22")
        case 3:
            setColor(color: "467C24")
        case 4:
            setColor(color: "2D7FC1")
        case 5:
            setColor(color: "1A4766")
        case 6:
            setColor(color: "2D038F")
        default:
            setColor(color: "FFFFFF")
        }
    }
    
    func pushControllers(vc: UIViewController) {
        
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    private func setColor(color: String) {
        let taskOptions = self.navigationController?.viewControllers[1] as! TaskOptionsTableView
        taskOptions.hexColorAttribute = color
        taskOptions.tableView.reloadRows(at: [[3,0]], with: .none)
        self.navigationController?.popViewController(animated: true)
    }
}

