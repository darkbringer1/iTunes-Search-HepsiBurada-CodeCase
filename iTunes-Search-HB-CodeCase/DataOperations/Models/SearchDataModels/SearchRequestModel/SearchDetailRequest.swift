//
//  SearchDetailRequest.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import Foundation

class SearchDetailRequest: Codable {
    
    private(set) var id: Int

    public init(id: Int) {
        self.id = id
    }
    
}
