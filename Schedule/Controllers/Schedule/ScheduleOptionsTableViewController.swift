//
//  OptionsScheduleViewController.swift
//  Schedule
//
//  Created by Grigory Don on 09.12.2022.
//

import UIKit

class ScheduleOptionsTableViewController: UITableViewController {
    
    let idOptionsScheduleCell = "idOptionsScheduleCell"
    let idOptionsScheduleHeader = "idOptionsScheduleHeader"
    let headerNameArray = ["ДАТА И ВРЕМЯ", "ПРЕДМЕТ", "ПРЕПОДАВАТЕЛЬ", "ЦВЕТ", "ПЕРИОД"]
    
    let cellNameArray =
    [
        ["Дата","Время"],
        ["Название","Тип","Корпус","Аудитория"],
        ["Имя преподавателя"],
        [""],
        ["Повторять каждые 7 дней"]
    ]
    
    private let scheduleModel = ScheduleModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Option Schedule"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        tableView.separatorStyle = .none
        tableView.bounces = false
        
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsScheduleCell)
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsScheduleHeader)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
    }
    
    @objc func saveButtonTapped() {
        StorageManager.shared.save(model: scheduleModel)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
           return 2
        case 1:
           return 4
        case 2:
           return 1
        case 3:
           return 1
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsScheduleCell, for: indexPath) as! OptionsTableViewCell
        cell.cellScheduleConfiguration(nameArray: cellNameArray, indexPath: indexPath)
        
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
        
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath {
        case [0,0]:
            AlertDate(label: cell.nameCellLabel) { [self] (numberWeekday, date) in
                scheduleModel.scheduleDate = date
                scheduleModel.scheduleWeekday = numberWeekday
            }
        case [0,1]:
            AlertTime(label: cell.nameCellLabel) { [self] time in
                scheduleModel.scheduleTime = time
            }
        case [1,0]:
            alertForCellName(label: cell.nameCellLabel, name: "Предмет", placeholder: "Введите название предмета") { text in print(text)
                self.scheduleModel.scheduleName = text
            }
        case [1,1]:
            alertForCellName(label: cell.nameCellLabel, name: "Тип", placeholder: "Введите тип предмета") { text in
                self.scheduleModel.scheduleType = text
            }
        case [1,2]:
            alertForCellName(label: cell.nameCellLabel, name: "Корпус", placeholder: "Введите номер корпуса") { text in
                self.scheduleModel.scheduleBuilding = text
            }
        case [1,3]:
            alertForCellName(label: cell.nameCellLabel, name: "Аудитория", placeholder: "Введите номер аудитории") { text in
                self.scheduleModel.scheduleAudience = text
            }
        case [2,0]:
            let teachers = TeachersViewController()
            pushControllers(vc: teachers)
        case [3,0]:
            let colors = ScheduleColorsViewController()
            pushControllers(vc: colors)
        default:
            print("ERROR")
        }
        
        func pushControllers(vc: UIViewController) {
            
            let viewController = vc
            navigationController?.navigationBar.topItem?.title = "Options"
            navigationController?.pushViewController(viewController, animated: true)

        }
    }
}

extension ScheduleOptionsTableViewController: SwitchRepeatProtocol {
    func switchRepeat(value: Bool) {
        scheduleModel.scheduleRepeaet = value
    }
    
    
}
