//
//  CharacterController.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 13.10.25.
//

import UIKit

enum CharacterSection: Int, CaseIterable {
    case header
    case info
    case episodes
}

class CharacterDetailController: BaseController {
    
    private lazy var collection: UICollectionView = {
        let layout = createLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CharacterDetailHeaderCell.self, forCellWithReuseIdentifier: "\(CharacterDetailHeaderCell.self)")
        return collection
    }()
    
    private let vm: CharacterDetailViewModel
    
    init(vm: CharacterDetailViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        view.addSubViews(collection)
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension CharacterDetailController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return CharacterSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = CharacterSection(rawValue: section) else { return 0 }
        
        switch section {
        case .header:
            return 1
        case .info:
            return 4
        case .episodes:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = CharacterSection(rawValue: indexPath.section)
        
        switch section {
        case .header:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CharacterDetailHeaderCell.self)", for: indexPath) as! CharacterDetailHeaderCell
            cell.configureCell(with: vm.characterData)
            return cell
        case .info:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CharacterDetailHeaderCell.self)", for: indexPath) as! CharacterDetailHeaderCell

            return cell
        case .episodes:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CharacterDetailHeaderCell.self)", for: indexPath) as! CharacterDetailHeaderCell

            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension CharacterDetailController {
    private func createLayout() -> UICollectionViewLayout {
        
        return UICollectionViewCompositionalLayout { sectionIndex, environment in
            
            guard let section = CharacterSection(rawValue: sectionIndex) else { return nil }
            
            switch section {
            case .header:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(300))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(300))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 16, leading: 16, bottom: 24, trailing: 16)
                return section
                
            case .info:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 12
                section.contentInsets = .init(top: 0, leading: 16, bottom: 24, trailing: 16)
                return section
                
            case .episodes:
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(180), heightDimension: .absolute(160))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(180), heightDimension: .absolute(160))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 16, bottom: 16, trailing: 16)
                return section
            }
        }
    }
}
