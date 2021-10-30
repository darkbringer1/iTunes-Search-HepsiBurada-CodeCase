//
//  SearchViewModel.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 25.10.2021.
//
import Foundation
import BaseComponents
import DefaultNetworkOperationPackage

class SearchViewModel {
    
    private var searchViewState: ((ViewState) -> Void)?
    private var dataFormatter: SearchViewDataFormatterProtocol
    private var detailViewState: ((SearchDetailRequest) -> Void)?
    
    //changing these parameters from
    var term: String = ""
    var entity: String = Paths.movie.description
    
    init(dataFormatter: SearchViewDataFormatterProtocol) {
        self.dataFormatter = dataFormatter
    }
    
    //MARK: - ACCESSABLE METHODS FROM VC
    
    func subscribeDetailViewState(with completion: @escaping (SearchDetailRequest) -> Void) {
        detailViewState = completion
    }
    
    //calling the api for the with the request for data
    func getData() {
        if dataFormatter.paginationData.offset == 0 {
            dataFormatter.clearCollectionView()
        }
        searchViewState?(.loading)
        do {
            guard let urlRequest = try? ItunesServiceProvider(request: getSearchRequest(term: term, entity: entity)).returnUrlRequest() else { return }
            fireApiCall(with: urlRequest, with: dataListener)
            print("\(urlRequest)")
        }
    }
    
    //to clear the offset we send with the api request so that we always show an updated new page
    func clearOffset() {
        dataFormatter.paginationData.offset = 0
    }
    
    func subscribeViewState(with completion: @escaping (ViewState) -> Void) {
        searchViewState = completion
    }
    
    //MARK: - SCOPE CHANGE HANDLER METHOD

    func selectedScopeToPathConverter(scope: Int) -> String {
        switch scope {
            case 0:
                return Paths.movie.description
            case 1:
                return Paths.software.description
            case 2:
                return Paths.ebook.description
            case 3:
                return Paths.music.description
            default:
                return Paths.movie.description
        }
    }
    
    
    //MARK: - PRIVATE METHODS TO HANDLE API CALLS
    
    private func fireApiCall(with request: URLRequest, with completion: @escaping (Result<SearchResponseModel, ErrorResponse>) -> Void) {
        ApiManagerBuilder.build().executeRequest(urlRequest: request, completion: completion)
    }

    private func getSearchRequest(term: String?, entity: String) -> SearchDataRequest {
        return SearchDataRequest(wrapperType: nil,
                                 entity: entity,
                                 term: term,
                                 offset: dataFormatter.paginationData.offset,
                                 limit: dataFormatter.paginationData.limit)
    }
    
    private func apiCallHandler(from response: SearchResponseModel) {
        dataFormatter.setData(with: response)
        searchViewState?(.done)
    }
    
    //MARK: - LISTENER HANDLERS
    private lazy var dataListener: (Result<SearchResponseModel, ErrorResponse>) -> Void = { [weak self] result in
        self?.dataFormatter.paginationData.fetching = false
        switch result {
            case .failure(let error):
                print("error data listener: \(error)")
            case .success(let response):
                self?.apiCallHandler(from: response)
        }
    }
    
}

extension SearchViewModel: DataProviderProtocol {
    
    func askNumberOfItem(in section: Int) -> Int {
        return dataFormatter.getNumbeOfItem(in: section)
    }
    
    func askData(at index: Int) -> GenericDataProtocol? {
        return dataFormatter.getItem(at: index)
    }
    
    func isLoadingCell(for index: Int) -> Bool {
        return index >= dataFormatter.getCount()
    }
    
    func getMoreData() {
        guard dataFormatter.paginationData.checkLoadingMore() else { return }
        dataFormatter.paginationData.nextOffset()
        getData()
    }
    
    func selectedItem(at index: Int) {
        print("index: \(index)")
        //detail view will show according to below methods(to be added
        detailViewState?(SearchDetailRequest(id: dataFormatter.getItemId(at: index)))
    }
    
}
