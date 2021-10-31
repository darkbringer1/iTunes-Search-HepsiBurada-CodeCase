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
    private let searchBar = UISearchBar()
    private var searchWorkItem: DispatchWorkItem?
    
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addSearchButton()
        addMainComponent()
        addViewModelListeners()
    }
    
    //method to add the collection view into view
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

    //MARK: - PRIVATE METHODS

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
        viewModel.subscribeDetailViewState { [weak self] data in
            self?.fireDetailView(with: data)
        }
    }
    
    //method to add the searchbar into view
    private func addSearchButton() {
        searchBar.sizeToFit()
        navigationItem.title = "iTunes Search"
        navigationController?.navigationBar.prefersLargeTitles = false
        searchBar.delegate = self
        searchBar.scopeButtonTitles = ["Movies", "Apps", "Books", "Music"]
        searchBar.showsScopeBar = true
        showSearchBarButton(shouldShow: true)
        searchBar.tintColor = .black
    }
    
    //button function from the magnifying glass icon in navigationBar right item
    private func showSearchBarButton(shouldShow: Bool) {
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search,
                                           target: self,
                                           action: .searchBarHandler)
        searchButton.tintColor = .black
        if shouldShow {
            navigationItem.rightBarButtonItem = searchButton
        } else {
            navigationItem.titleView = nil
        }
    }
    
    //search icon button action
    @objc func handleShowSearchBar() {
            search(shouldShow: true)
            navigationItem.rightBarButtonItem = nil
            searchBar.becomeFirstResponder()
    }
    
    //when we push the search icon we should show the search bar and when we hit the cancel button we need to hide search bar.
    //calling this func in searchbar delegate cancel func and addSearchBar func
    private func search(shouldShow: Bool) {
            //when we hit the cancel button, search func will be false and will hide the magnifying glass button
            showSearchBarButton(shouldShow: !shouldShow)
            searchBar.showsCancelButton = shouldShow
            //if its false we need searchbar to show the title, if its true we need to show search bar
            navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
    private func fireDetailView(with data: SearchDetailRequest) {
        let viewController = ItemDetailViewBuilder.build(with: data)
        present(viewController, animated: true, completion: nil)
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.replacingOccurrences(of: " ", with: "+")
        viewModel.term = text
        viewModel.clearOffset()
        
        //Dispatch work item added to delay making api calls by 1 second everytime user types in the searchbar
        if text.count > 2 {
            searchWorkItem?.cancel()
            let newTask = DispatchWorkItem { [weak self] in
                self?.viewModel.getData()
                self?.mainComponent.reloadCollectionView()
            }
            self.searchWorkItem = newTask
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: newTask)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        viewModel.clearOffset()
        let entity = viewModel.selectedScopeToPathConverter(scope: selectedScope)
        viewModel.entity = entity
        viewModel.getData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
    
}
