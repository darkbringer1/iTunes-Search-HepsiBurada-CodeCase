//
//  ItunesDetailServiceProvider.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class ItunesDetailServiceProvider: ApiServiceProvider<SearchDetailRequest> {
    
    init(request: SearchDetailRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.base.description,
                   path: Paths.lookup.description,
                   data: request)
    }
    
}
