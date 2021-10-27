//
//  ItunesServiceProvider.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 26.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class ItunesServiceProvider: ApiServiceProvider<SearchDataRequest> {
    
    init(request: SearchDataRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.base.description,
                   path: Paths.search.description,
                   data: request)
    }
    
}
