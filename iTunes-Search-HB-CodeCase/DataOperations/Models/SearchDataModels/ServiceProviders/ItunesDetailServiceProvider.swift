//
//  ItunesDetailServiceProvider.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class ItunesDetailServiceProvider: ApiServiceProvider<ItemDetailRequest> {
    
    init(request: ItemDetailRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.base.description,
                   path: Paths.lookup.description,
                   data: request)
    }
    
}
