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
        
        view.backgroundColor = .brown
        addMainComponent()
        viewModelListeners()
        viewModel.getData()
    }
    
    private func addMainComponent() {
        mainComponent = ItemDetailView()
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainComponent)
        
        NSLayoutConstraint.activate([
            
            mainComponent.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            mainComponent.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
    }
    private func viewModelListeners() {
        viewModel.subscribeViewState { [weak self] data in
            self?.mainComponent.setData(by: data)
        }
    }
}
