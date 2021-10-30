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
    
    //check if we need to load more according to limit and result count. if result count is lower than limit it will return false
    func checkLoadingMore() -> Bool {
        return limit <= resultCount && !fetching
    }
    
    //next offset will always change when pagination is active
    mutating func nextOffset() {
        fetching = true
        offset += limit
    }
    
}
