//
//  SearchViewBuilder.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 26.10.2021.
//

import UIKit

class SearchViewBuilder {
    
    class func build() -> UIViewController {
        
        let searchDataFormatter = SearchViewDataFormatter()
        let viewModel = SearchViewModel(dataFormatter: searchDataFormatter)
        let viewController = SearchViewController(viewModel: viewModel)
        
        let navigationViewController = UINavigationController(rootViewController: viewController)
        
        viewController.title = "search"
        viewController.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        viewController.navigationController?.navigationBar.standardAppearance = appearance
        viewController.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        return navigationViewController
    }
}
