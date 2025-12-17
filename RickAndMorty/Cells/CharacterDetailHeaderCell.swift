//
//  CharacterDetailHeaderCell.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 16.12.25.
//

import UIKit

class CharacterDetailHeaderCell: UICollectionViewCell {
    
    private lazy var circleImage: UIImageView = {
        let i = UIImageView()
        i.layer.borderColor = UIColor(red: 152.0/255.0, green: 180.0/255.0, blue: 235.0/255.0, alpha: 1.0).cgColor
        i.layer.borderWidth = 4
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    private lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.textColor = .label
        l.font = .systemFont(ofSize: 24, weight: .bold)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var subLabel: UILabel = {
        let l = UILabel()
        l.textColor = .secondaryLabel
        l.font = .systemFont(ofSize: 14)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImage.makeCircular()
    }
    
    private func configureUI() { }
    
    private func configureConstraints() {
        contentView.addSubViews(circleImage, nameLabel, subLabel)
        
        NSLayoutConstraint.activate([
            circleImage.widthAnchor.constraint(equalToConstant: 180),
            circleImage.heightAnchor.constraint(equalToConstant: 180),
            circleImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            circleImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            
            nameLabel.topAnchor.constraint(equalTo: circleImage.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: circleImage.centerXAnchor),
            
            subLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            subLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor)
        ])
    }
    
    func configureCell(with character: AllCharacterResult) {
        circleImage.setImage(with: character.image)
        nameLabel.text = character.name ?? "Unknown"
        subLabel.text = "\(character.species ?? "Unknown") • \(character.gender?.rawValue ?? "Unknown")"
    }
}
