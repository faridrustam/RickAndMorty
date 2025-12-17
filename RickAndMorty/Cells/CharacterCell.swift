//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 13.10.25.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    private lazy var characterImage: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    private lazy var characterName: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 20, weight: .bold)
        l.textColor = .black
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var characterStatus: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 16, weight: .regular)
        l.textColor = .systemGray
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var characterSpecies: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 16, weight: .regular)
        l.textColor = .systemGray
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureConstarints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        contentView.backgroundColor = .systemGray6
    }
    
    private func configureConstarints() {
        contentView.addSubViews(characterImage, characterName, characterStatus, characterSpecies)
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: topAnchor),
            characterImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterImage.heightAnchor.constraint(equalToConstant: 200),
            
            characterName.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 4),
            characterName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            characterName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            characterName.heightAnchor.constraint(equalToConstant: 50),
            
            characterStatus.topAnchor.constraint(equalTo: characterName.bottomAnchor),
            characterStatus.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
    
            characterSpecies.topAnchor.constraint(equalTo: characterStatus.bottomAnchor, constant: 2),
            characterSpecies.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            characterSpecies.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            characterSpecies.widthAnchor.constraint(equalToConstant: 150)
            ])
            }

    func configureCell(with character: AllCharacterResult) {
        characterName.text = character.name ?? ""
        characterStatus.text = "Status: \(character.status?.rawValue ?? "")"
        characterSpecies.text = "Species: \(character.species ?? "")"
        characterImage.setImage(with: character.image)
    }
}
