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
    private var entity = Paths.movie.description

    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .blue
        addSearchButton()
        addMainComponent()
        addViewModelListeners()
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


    //MARK: - PRIVATE METHODS

    private func addViewModelListeners() {
        viewModel.subscribeViewState { [weak self] state in
            switch state {
                case .loading:
                    return
                case .done:
                    self?.mainComponent.reloadCollectionView()
                case .clear:
                    break
                default:
                    break
            }
        }
        viewModel.subscribeDetailViewState { [weak self] data in
            self?.fireDetailView(with: data)
        }
    }
    
    private func addSearchButton() {
        searchBar.sizeToFit()
        navigationItem.title = "iTunes Search"
        navigationController?.navigationBar.prefersLargeTitles = false
        searchBar.delegate = self
        
        searchBar.scopeButtonTitles = ["Movies", "Apps", "Books", "Music"]
        searchBar.showsScopeBar = true
        showSearchBarButton(shouldShow: true)
    }
    
    //button function from the magnifying glass icon in navigationBar right item
    private func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                                target: self,
                                                                action: #selector(handleShowSearchBar))
            
        } else {
            navigationItem.titleView = nil
        }
    }
    @objc private func handleShowSearchBar() {
        search(shouldShow: true)
        navigationItem.rightBarButtonItem = nil
        searchBar.becomeFirstResponder()
    }
    
    
    //when we push the search icon we should show the search bar and when we hit the cancel button we need to hide search bar.
    //calling this func in Delegate cancel func and addSearchBar func
    private func search(shouldShow: Bool) {
        
        //when we hit the cancel button, search func will be false and will hide the magnifying glass button
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        
        //if its false we need searchbar to show the title, if its true we need to show search bar
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
    private func fireDetailView(with data: ItemDetailRequest) {
        let viewController = ItemDetailViewBuilder.build(with: data)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchpls()
//            viewModel.getData(with: filteredText, entity: entity)
        mainComponent.reloadCollectionView()
    }
    
   
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("begin editing")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("end editing")
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("\(selectedScope)")
        entity = selectedScopeToPathConverter(scope: selectedScope)
        searchpls()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel tapped")
        search(shouldShow: false)
    
    }
    
    private func selectedScopeToPathConverter(scope: Int) -> String {
        var selectedScope = Paths.movie.description
        if scope == 0 {
            selectedScope = Paths.movie.description
        } else if scope == 1 {
            selectedScope = Paths.software.description
        } else if scope == 2 {
            selectedScope = Paths.ebook.description
        } else if scope == 3 {
            selectedScope = Paths.music.description
        }
        return selectedScope
    }
    
    private func searchpls() {
        guard let filteredText = searchBar.searchTextField.text?.replacingOccurrences(of: " ", with: "+") else { return }
        viewModel.getData(with: filteredText, entity: entity)
    }
    
}
