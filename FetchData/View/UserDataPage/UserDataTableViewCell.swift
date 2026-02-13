//
//  UserDataTableViewCell.swift
//  FetchData
//
//  Created by Surya Rayala on 2/13/26.
//

import UIKit

class UserDataTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel?
    var usernameLabel: UILabel?
    var chevronImageView: UIImageView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        
        nameLabel = UILabel()
        nameLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        usernameLabel = UILabel()
        usernameLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        usernameLabel?.textColor = .secondaryLabel
        usernameLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        chevronImageView = UIImageView()
        chevronImageView?.image = UIImage(systemName: "chevron.right")
        chevronImageView?.contentMode = .scaleAspectFit
        chevronImageView?.tintColor = .systemGray3
        chevronImageView?.translatesAutoresizingMaskIntoConstraints = false
        
        if let nameLabel = nameLabel, let usernameLabel = usernameLabel, let chevronImageView = chevronImageView {
            contentView.addSubview(nameLabel)
            contentView.addSubview(usernameLabel)
            contentView.addSubview(chevronImageView)
            
            NSLayoutConstraint.activate([
                nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),
                nameLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor, constant: -9),
                
                usernameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
                usernameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
                
                chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                chevronImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                chevronImageView.widthAnchor.constraint(equalToConstant: 12),
                chevronImageView.heightAnchor.constraint(equalToConstant: 20)
            ])
        }
    }
    
    func configure(with user: UserModel) {
        nameLabel?.text = user.name ?? "Unknown"
        usernameLabel?.text = "@\(user.username ?? "")"
    }
}
