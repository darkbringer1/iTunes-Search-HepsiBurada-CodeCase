//
//  ItemDetailViewModel.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class ItemDetailViewModel {
    
    private let formatter: ItemDetailDataFormatterProcol
    private let data: ItemDetailRequest
    private var dataState: ((ItemDetailViewData) -> Void)?
    
    internal init(formatter: ItemDetailDataFormatterProcol, data: ItemDetailRequest) {
        self.formatter = formatter
        self.data = data
    }
    
    
    func getData() {
        do {
            guard let urlRequest = try? ItunesDetailServiceProvider(request: getItemDetailRequest()).returnUrlRequest() else { return }
            fireApiCall(with: urlRequest, with: dataListener)
            print("\(urlRequest)")
        }
    }
    
    func subscribeViewState(with completion: @escaping (ItemDetailViewData) -> Void) {
        dataState = completion
    }
    
    //MARK: - PRIVATE METHODS
    private func getItemDetailRequest() -> ItemDetailRequest {
        return ItemDetailRequest(id: data.id)
    }
    
    private func fireApiCall(with request: URLRequest, with completion: @escaping (Result<SearchResponseModel, ErrorResponse>) -> Void) {
        APIManager.shared.executeRequest(urlRequest: request, completion: completion)
    }
    
    private func apiCallHandler(from response: SearchResponseModel) {
        let data = response.results[0]
        dataState?(formatter.convertItemDetailView(from: data))
    }
    
    private lazy var dataListener: (Result<SearchResponseModel, ErrorResponse>) -> Void = { [weak self] result in
        
        switch result {
            case .failure(let error):
                print("ERROR IN GETTING THE DATA: \(error)")
            case .success(let response):
                self?.apiCallHandler(from: response)
        }
        
    }
    
}
