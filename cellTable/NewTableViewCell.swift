//
//  NewTableViewCell.swift
//  cellTable
//
//  Created by admin on 17.02.2023.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    
    let avatar = UIImageView()
      
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    let discriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
        
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        SetupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func SetupCell(){
        [avatar,nameLabel,discriptionLabel] .forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            avatar.heightAnchor.constraint(equalToConstant: 32),
            avatar.widthAnchor.constraint(equalToConstant: 32),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            discriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            discriptionLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor,constant: 15),
            discriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            discriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
            
        ])
    }
    
    func configure (task : Task){
        //avatar.image = contact.image
        nameLabel.text = task.taskName
        discriptionLabel.text = task.taskDescription
    }
    
    

}
