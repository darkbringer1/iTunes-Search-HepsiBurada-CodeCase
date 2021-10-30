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
    private let data: SearchDetailRequest
    private var dataState: ((ItemDetailViewData) -> Void)?
    
    internal init(formatter: ItemDetailDataFormatterProcol, data: SearchDetailRequest) {
        self.formatter = formatter
        self.data = data
    }
    
    //calling the api for the with the request for data
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
    private func getItemDetailRequest() -> SearchDetailRequest {
        return SearchDetailRequest(id: data.id)
    }
    
    //calling this in getdata func
    private func fireApiCall(with request: URLRequest, with completion: @escaping (Result<SearchResponseModel, ErrorResponse>) -> Void) {
        APIManager.shared.executeRequest(urlRequest: request, completion: completion)
    }
    
    //if we get the data, calling this method to get
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
