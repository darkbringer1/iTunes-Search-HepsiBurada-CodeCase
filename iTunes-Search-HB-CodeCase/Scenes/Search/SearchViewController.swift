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
        addSearchBar()
        addMainComponent()
        addViewModelListeners()
        viewModel.getData()
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

    private func addViewModelListeners() {
        viewModel.subscribeViewState { [weak self] state in
            switch state {
                case .loading:
                    return
                case .done:
                    self?.mainComponent.reloadCollectionView()
                default:
                    break
            }
        }
        
    }

    func addSearchBar() {
       
        
        
        
    }

    

}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("\(searchText)")
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("begin editing")
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("end editing")
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("\(selectedScope)")
    }
}
