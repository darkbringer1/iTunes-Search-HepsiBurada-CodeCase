//
//  SearchDataRequest.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 25.10.2021.
//

import Foundation

class SearchDataRequest: Codable {
    
    private(set) var term: String?
    private(set) var entity: String?
    private(set) var wrapperType: String?
    private(set) var offset: Int = 0
    private(set) var limit: Int = 20
    
    init(wrapperType: String? = nil,
         entity: String? = "",
         term: String? = "",
         offset: Int = 0,
         limit: Int = 20) {
        self.wrapperType = wrapperType
        self.entity = entity
        self.term = term?.replacingOccurrences(of: " ", with: "+")
        self.offset = offset
        self.limit = limit
    }
    
}
