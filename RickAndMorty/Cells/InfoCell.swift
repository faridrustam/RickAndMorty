//
//  InfoCell.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 17.12.25.
//

import UIKit

class InfoCell: UICollectionViewCell {
    
    private lazy var iconImage: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(systemName: "info.circle")
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    private lazy var mainLabel: UILabel = {
        let l = UILabel()
        l.text = "LAST KNOWN LOCATION"
        l.textColor = .secondaryLabel
        l.font = .systemFont(ofSize: 14)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.text = "Earth(C-137)"
        l.textColor = .label
        l.font = .systemFont(ofSize: 16)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
    }
    
    private func configureConstraints() {
        contentView.addSubViews(iconImage, mainLabel, nameLabel)
        
        NSLayoutConstraint.activate([
            iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImage.heightAnchor.constraint(equalToConstant: 30),
            iconImage.widthAnchor.constraint(equalToConstant: 30),
            
            mainLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 16),
            mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            nameLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor)
        ])
    }
    
    func configureCell(with character: InfoItem) {
        iconImage.image = UIImage(systemName: character.icon)
        mainLabel.text = character.title.rawValue
        nameLabel.text = character.data
    }
}
    
