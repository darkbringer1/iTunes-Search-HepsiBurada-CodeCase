//
//  SearchViewDataFormatter.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 26.10.2021.
//

import Foundation
import BaseComponents

class SearchViewDataFormatter: SearchViewDataFormatterProtocol {
    
    private var componentData: SearchResponseModel?
    private var list: [SearchResult] = [SearchResult]()
    
    var paginationData: PaginationInfo = PaginationInfo()
    
    func getNumberOfSection() -> Int {
        1
    }
    
    func getNumbeOfItem(in section: Int) -> Int {
        let count = list.count
        return (paginationData.limit <= paginationData.resultCount) ? count + 1 : count
    }
    
    func getCount() -> Int {
        return list.count
    }
    
    func setData(with response: SearchResponseModel) {
        self.componentData = response
        self.paginationData.resultCount = response.results.count
        self.list.append(contentsOf: response.results)
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        return SearchDisplayerItemComponentData(
            imageData: CustomImageViewComponentData(
                imageUrl: createImageData(by: list[index].artworkUrl100!)),
            infoView: LabelPackComponentData(
                title: list[index].collectionName ?? "no collection",
                subtitle: list[index].wrapperType?.rawValue ?? "no type",
                shortDescription: list[index].shortDescription ?? "no short description")
            )
    }
    
    private func createImageData(by value: String) -> String {
        return "\(value)"
    }
}
