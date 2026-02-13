//
//  TypicodeTableViewCell.swift
//
//  Created by Surya Rayala on 2/13/26.
//

import UIKit

class TypicodeTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel?
    var idLabel: UILabel?
    var statusImageView: UIImageView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        
        titleLabel = UILabel()
        titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        titleLabel?.numberOfLines = 0
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        idLabel = UILabel()
        idLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        idLabel?.textColor = .secondaryLabel
        idLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        statusImageView = UIImageView()
        statusImageView?.contentMode = .scaleAspectFit
        statusImageView?.translatesAutoresizingMaskIntoConstraints = false
        statusImageView?.tintColor = .systemGreen
        
        if let  titleLabel = titleLabel,let idLabel = idLabel, let statusImageView = statusImageView {
            contentView.addSubview(statusImageView)
            contentView.addSubview(titleLabel)
            contentView.addSubview(idLabel)
            
            NSLayoutConstraint.activate([
                statusImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                statusImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                statusImageView.widthAnchor.constraint(equalToConstant: 24),
                statusImageView.heightAnchor.constraint(equalToConstant: 24),
                
                titleLabel.leadingAnchor.constraint(equalTo: statusImageView.trailingAnchor, constant: 12),
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                
                idLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                idLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
                idLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
                idLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
            ])
        }
    }
    
    func configure(with item: TypicodeModel) {
        titleLabel?.text = item.title
        idLabel?.text = "ID: \(item.id ?? 0)"
        
        if item.completed ?? false {
            statusImageView?.image = UIImage(systemName: "checkmark.circle.fill")
            statusImageView?.tintColor = .systemGreen
        } else {
            statusImageView?.image = UIImage(systemName: "circle")
            statusImageView?.tintColor = .systemGray
        }
    }
}
