//
//  DataProviderProtocol.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 25.10.2021.
//

import Foundation
import BaseComponents

protocol DataProviderProtocol: AnyObject {
    
    func askNumberOfItem(in section: Int) -> Int
    func askData(at index: Int) -> GenericDataProtocol?
    func selectedItem(at index: Int)
    func getMoreData()
    func isLoadingCell(for index: Int) -> Bool
    
}

extension DataProviderProtocol {

    func askNumberOfSection() -> Int { return 0 }
    func selectedItem(at index: Int) { }
    func getMoreData() { }
    func isLoadingCell(for index: Int) -> Bool { return false }
    
}

