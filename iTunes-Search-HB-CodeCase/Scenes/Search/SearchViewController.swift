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
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .blue
        addSearchBar()
    }
    
    
    func addSearchBar() {
        view.addSubview(searchBar)
        self.navigationItem.titleView = searchBar


    }
    
    lazy var searchBar: UISearchBar = {
        let temp = UISearchBar()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.placeholder = "Search"
        temp.showsScopeBar = true
        temp.barTintColor = UIColor(white: 0.8, alpha: 0.1)
        temp.scopeButtonTitles = ["Movies", "Music", "Apps", "Books"]
        temp.showsCancelButton = true
        temp.tintColor = .red
        return temp
    }()
    

}
