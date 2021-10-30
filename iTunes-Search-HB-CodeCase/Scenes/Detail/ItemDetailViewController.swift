//
//  ItemDetailViewController.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import UIKit
import BaseComponents

class ItemDetailViewController: BaseViewController<ItemDetailViewModel> {
    
    private var mainComponent: ItemDetailView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addMainComponent()
        viewModelListeners()
        viewModel.getData()
    }
    
    private func addMainComponent() {
        mainComponent = ItemDetailView()
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainComponent)
        
        NSLayoutConstraint.activate([
            
            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
    }
    private func viewModelListeners() {
        viewModel.subscribeViewState { [weak self] data in
            self?.mainComponent.setData(by: data)
        }
    }
}
