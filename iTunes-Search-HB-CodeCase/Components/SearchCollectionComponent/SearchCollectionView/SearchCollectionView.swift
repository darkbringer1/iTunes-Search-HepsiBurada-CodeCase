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
    private var emptyView: EmptyBackgroundView!
    
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
        setupBackgroundView()
    }
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addCollectionView()
    }
    
    private func addCollectionView() {
        addSubview(componentCollection)
        componentCollection.backgroundColor = .white
        
        NSLayoutConstraint.activate([
        
            componentCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            componentCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            componentCollection.topAnchor.constraint(equalTo: topAnchor),
            componentCollection.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
    
    private func emptyViewActivationControl() {
        //will call empty view accordig to the collection view count. if zero, show empty view as the background of the collection view
        emptyView.activationManager(by: ((delegate?.askNumberOfItem(in: 0) ?? 0) <= 0))
        
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
    
    //a function to setup empty background view
    private func setupBackgroundView() {
        emptyView = EmptyBackgroundView(frame: .zero,
                                        data: EmptyBackgroundViewData(
                                            labelPackData: LabelPackComponentData(
                                                title: "Please search anything you \nwant on the search bar",
                                                subtitle: "You can access the search bar by tapping on the top right corner.").setTitleLabelDistributionData(by: LabelDistributionData().setLineBreakMode(by: .byWordWrapping).setNumberOfLines(by: 2))))
        
        componentCollection.backgroundView = emptyView
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension SearchCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.askNumberOfItem(in: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //pagination loading cell view. if there are no more data, will not show this cell
        if isLoadingCell(for: indexPath) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingCellView.identifier, for: indexPath) as? LoadingCellView else { fatalError() }
            //to prevent an app crash, loading cell is not clickable
            cell.isUserInteractionEnabled = false
            return cell
        } else {
            guard let data = delegate?.askData(at: indexPath.row) else { fatalError("Please provide at least one item!") }
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else { fatalError("Please provide  registered cell items") }
            cell.setData(by: data)
            return cell
        }
        
    }
    
    //MARK: - AFTER PAGINATION COMPLETES, CALLS FOR MORE DATA FROM API

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if isLoadingCell(for: indexPath) {
            delegate?.getMoreData()
        }
    }
    
    //MARK: - getting the selected item index information. To prevent repeated tapping, user interaction is disabled until the animation finishes.

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
    
    //MARK: - CELL WIDTH AND HEIGHT

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (UIScreen.main.bounds.width - 40) / 2
        return CGSize(width: width, height: width)
        
    }
    
}
