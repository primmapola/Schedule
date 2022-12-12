//
//  ScheduleTableViewCell.swift
//  Schedule
//
//  Created by Grigory Don on 08.12.2022.
//

import UIKit
import RealmSwift

class ScheduleTableViewCell: UITableViewCell {
    
    let lessonName: UILabel = {
        let label = UILabel()
        label.text = "Программирование"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 20)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let teacherName: UILabel = {
        let label = UILabel()
        label.text = "Анатолий Чуев"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .red
        
        return label
    }()
    
    let lessonTime: UILabel = {
        let label = UILabel()
        label.text = "08:00"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Тип:"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let lessonType: UILabel = {
        let label = UILabel()
        label.text = "Лекция"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 14)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let buildingLabel: UILabel = {
        let label = UILabel()
        label.text = "Корпус:"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let roomLabel: UILabel = {
        let label = UILabel()
        label.text = "501"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 14)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let lessonBuilding: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 14)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let lessonAud: UILabel = {
        let label = UILabel()
        label.text = "Аудитория:"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
        
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        let topStackView = UIStackView(arrangeSubviews: [lessonName, teacherName], axis: .horizontal, spacing: 10, distribution: .fillEqually)
        
        self.addSubview(topStackView)
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topStackView.heightAnchor.constraint(equalToConstant: 25)
            
        ])
        
        self.addSubview(lessonTime)
        NSLayoutConstraint.activate([
            lessonTime.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            lessonTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            lessonTime.widthAnchor.constraint(equalToConstant: 100),
            lessonTime.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        let bottomStackView = UIStackView(arrangeSubviews: [typeLabel, lessonType, buildingLabel, lessonBuilding, lessonAud, roomLabel], axis: .horizontal, spacing: 5, distribution: .fillProportionally)
        
        self.addSubview(bottomStackView)
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            bottomStackView.leadingAnchor.constraint(equalTo: lessonTime.trailingAnchor, constant: 5),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            bottomStackView.heightAnchor.constraint(equalToConstant: 25)
            
        ])
    }
}
