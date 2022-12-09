//
//  HeaderOptionsScheduleTableViewCell.swift
//  Schedule
//
//  Created by Grigory Don on 09.12.2022.
//

import UIKit

class HeaderOptionsScheduleTableViewCell: UITableViewHeaderFooterView {
    
    let headerLabel = UILabel(text: "", font: .avenirNext14(), aligment: .left)
    let headerNameArray = ["ДАТА И ВРЕМЯ", "ПРЕДМЕТ", "ПРЕПОДАВАТЕЛЬ", "ЦВЕТ", "ПЕРИОД"]

    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setConstraints()
       
        
        headerLabel.textColor = .systemGray
        self.contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func headerConfiguration(section: Int) {
        headerLabel.text = headerNameArray[section]
    }
    
    func setConstraints() {
     
        self.addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
