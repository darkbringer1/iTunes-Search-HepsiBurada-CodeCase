//
//  ItemDetailDataFormatterProtocol.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import Foundation

protocol ItemDetailDataFormatterProcol {
    
    func convertItemDetailView(from rawData: SearchResult) -> ItemDetailViewData
    
}
