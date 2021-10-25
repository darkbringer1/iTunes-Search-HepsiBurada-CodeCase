//
//  PaginationInfo.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 25.10.2021.
//

import Foundation

struct PaginationInfo {
    var resultCount: Int = 0
    var limit: Int = 20
    var offset: Int = 0
    var fetching: Bool = false
    
    func checkLoadingMore() -> Bool {
        return limit <= resultCount && !fetching
    }
    
    mutating func nextOffset() {
        fetching = true
        offset += limit
    }
    
}
