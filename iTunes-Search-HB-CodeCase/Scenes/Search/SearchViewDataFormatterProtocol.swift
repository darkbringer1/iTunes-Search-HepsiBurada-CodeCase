//
//  SearchViewDataFormatterProtocol.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 26.10.2021.
//

import Foundation
import BaseComponents

protocol SearchViewDataFormatterProtocol {
    
    var paginationData: PaginationInfo { get set }
    
    func getNumberOfSection() -> Int
    
    func getNumbeOfItem(in section: Int) -> Int
    
    func getCount() -> Int
    
    func setData(with response: SearchResponseModel)
    
    func getItem(at index: Int) -> GenericDataProtocol?
    
    func getItemId(at index: Int) -> Int
    
    func clearCollectionView()
}

