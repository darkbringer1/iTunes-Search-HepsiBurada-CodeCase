//
//  SearchViewModel.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 25.10.2021.
//

import BaseComponents

class SearchViewModel {
  
    
    
    
}

extension SearchViewModel: DataProviderProtocol {
    func askNumberOfSection() -> Int {
        1
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        1
    }
    
    func askData(at index: Int) -> GenericDataProtocol? {
        return nil
    }
    
}
