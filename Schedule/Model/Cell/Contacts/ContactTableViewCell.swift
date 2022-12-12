//
//  ContactTableViewCell.swift
//  Schedule
//
//  Created by Grigory Don on 12.12.2022.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    let contactImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "testContact")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    let phoneImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "phone.fill")
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    let mailImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "evenlop.fill")
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    let nameLabel = UILabel(text: "Name", font: .avenirNext20(), aligment: .left)
    let phonelabel = UILabel(text: "89185444335", font: .avenirNext14(), aligment: .left)
    let mailLabel = UILabel(text: "dongrigory29@gmail.com", font: .avenirNext14(), aligment: .left)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        self.addSubview(contactImageView)
        NSLayoutConstraint.activate([
            contactImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            contactImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            contactImageView.widthAnchor.constraint(equalToConstant: 70),
            contactImageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        self.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 21)
        ])
        
        let stackView = UIStackView(arrangeSubviews: [phoneImageView, phonelabel, mailImageView, mailLabel], axis: .horizontal, spacing: 3, distribution: .fillProportionally)
        
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
    
}
