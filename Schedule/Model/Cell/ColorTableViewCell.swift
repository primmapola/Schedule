//
//  ColorScheduleTableViewCell.swift
//  Schedule
//
//  Created by Grigory Don on 12.12.2022.
//

import UIKit

class ColorTableViewCell: UITableViewCell {
    
    let backgroundViewCell: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellConfiguration(indexPath: IndexPath) {
        switch indexPath.section {
        case 0: backgroundViewCell.backgroundColor = UIColor().colorFromHex("BE2813")
        case 1: backgroundViewCell.backgroundColor = UIColor().colorFromHex("F07F5A")
        case 2: backgroundViewCell.backgroundColor = UIColor().colorFromHex("F3AF22")
        case 3: backgroundViewCell.backgroundColor = UIColor().colorFromHex("467C24")
        case 4: backgroundViewCell.backgroundColor = UIColor().colorFromHex("2D7FC1")
        case 5: backgroundViewCell.backgroundColor = UIColor().colorFromHex("1A4766")
        default:
            backgroundViewCell.backgroundColor = UIColor().colorFromHex("FFFFFF")
        }
    }
    
    func setConstraints() {
        
        self.addSubview(backgroundViewCell)
        NSLayoutConstraint.activate([
            backgroundViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgroundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backgroundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            backgroundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1)
        ])
    }
}
