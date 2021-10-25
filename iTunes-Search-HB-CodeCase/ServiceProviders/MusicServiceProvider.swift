//
//  MusicServiceProvider.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 25.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class MusicServiceProvider: ApiServiceProvider<SearchDataRequest> {
    
    init(request: SearchDataRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.base.description,
                   path: Paths.music.description,
                   data: request)
    }
    
}
