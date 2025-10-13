//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Farid Rustamov on 10.09.25.
//

import UIKit

class HomeController: BaseController {
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CharacterCell.self, forCellWithReuseIdentifier: "\(CharacterCell.self)")
        return collection
    }()
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshStarted), for: .valueChanged)
        return refresh
    }()
    
    @objc private func refreshStarted() {
        vm.refresh()
        refreshControl.endRefreshing()
    }
    
    let vm = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        navigationItem.title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        collection.refreshControl = refreshControl
    }
    
    override func configureConstraints() {
        view.addSubViews(collection, spinner)
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    override func configureViewModel() {
        vm.sendState = { [weak self] state in
            guard let self else { return }
            DispatchQueue.main.async {
                switch state {
                case .success:
                    self.collection.reloadData()
                case .loading:
                    self.spinner.startAnimating()
                case .loaded:
                    self.spinner.stopAnimating()
                case .error(let error):
                    self.showAlert(and: error)
                case .idle:
                    break
                }
            }
        }
        vm.fetchCharacters()
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CharacterCell.self)", for: indexPath) as! CharacterCell
        cell.configureCell(with: vm.characters[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = vm.characters[indexPath.row]
        let coordinator = CharacterDetailCoordinator(navigationController: navigationController ?? UINavigationController(), title: model.name ?? "", url: model.url ?? "")
        coordinator.start()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2.0 - 24, height: 300)
    }
}

