//
//  SearchViewController.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 25.10.2021.
//

import UIKit
import BaseComponents
import DefaultNetworkOperationPackage

class SearchViewController: BaseViewController<SearchViewModel> {
    
    private var mainComponent: SearchCollectionView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .blue
//        addSearchBar()
        addMainComponent()
    }
    
    private func addMainComponent() {
        mainComponent = SearchCollectionView()
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        mainComponent.delegate = viewModel
        
        view.addSubview(mainComponent)
        
        NSLayoutConstraint.activate([
        
            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainComponent.topAnchor.constraint(equalTo: view.topAnchor),
            mainComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        ])
    }
    
    
//    func addSearchBar() {
//        view.addSubview(searchBar)
//        self.navigationItem.titleView = searchBar
//
//
//    }
    
//    lazy var searchBar: UISearchBar = {
//        let temp = UISearchBar()
//        temp.translatesAutoresizingMaskIntoConstraints = false
//        temp.placeholder = "Search"
//        temp.showsScopeBar = true
//        temp.barTintColor = UIColor(white: 0.8, alpha: 0.1)
//        temp.scopeButtonTitles = ["Movies", "Music", "Apps", "Books"]
//        temp.showsCancelButton = true
//        temp.tintColor = .red
//        return temp
//    }()
    

}
