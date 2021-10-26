//
//  SearchCollectionView.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 25.10.2021.
//

import UIKit
import BaseComponents

class SearchCollectionView: GenericBaseView<SearchCollectionViewData> {
    
    //this will be active when provider protocol is finished
    weak var delegate: DataProviderProtocol?
    
    lazy var componentCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        collection.register(LoadingCellView.self, forCellWithReuseIdentifier: LoadingCellView.identifier)
        return collection
    }()
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        //will call empty view method
    }
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addCollectionView()
    }
    
    private func addCollectionView() {
        addSubview(componentCollection)
        
        NSLayoutConstraint.activate([
        
            componentCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            componentCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            componentCollection.topAnchor.constraint(equalTo: topAnchor),
            componentCollection.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
    
    private func emptyViewActivationControl() {
        //will call empty view accordig to the collection view count. if zero, show empty view as the background of the collection view
    }
    
    //need to call reload functions in main thread
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.componentCollection.reloadData()
            self.emptyViewActivationControl()
        }
    }
    
    //check if there is more data with item provider to show loading cell at the end of the collection view
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return delegate?.isLoadingCell(for: indexPath.row) ?? false
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension SearchCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.askNumberOfItem(in: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if isLoadingCell(for: indexPath) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingCellView.identifier, for: indexPath) as? LoadingCellView else { fatalError() }
            return cell
        } else {
            guard let data = delegate?.askData(at: indexPath.row) else { fatalError("Please provide at least one item!") }
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else { fatalError("Please provide  registered cell items") }
            cell.setData(by: data)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if isLoadingCell(for: indexPath) {
            delegate?.getMoreData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.isUserInteractionEnabled = false
        cell?.startTappedAnimation(with: { [weak self] finish in
            if finish {
                self?.delegate?.selectedItem(at: indexPath.row)
                cell?.isUserInteractionEnabled = true
            }
        })
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SearchCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (UIScreen.main.bounds.width - 50) / 2
        let height = (UIScreen.main.bounds.height - 50) / 3
        return CGSize(width: width, height: height)
        
    }
    
}
