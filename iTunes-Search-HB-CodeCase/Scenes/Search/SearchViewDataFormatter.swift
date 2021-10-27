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
        
        let title = list[index].collectionName ?? "no collection"
        let subtitle = list[index].trackId ?? Int(0.00)
        let shortDescription = list[index].shortDescription ?? "no short description"
        
        let labelPack = LabelPackComponentData(title: "Collection: " + title,
                                               subtitle: "Price: " + String(subtitle),
                                               shortDescription: shortDescription).setDescriptionLabelDistributionData(by: LabelDistributionData().setLineBreakMode(by: .byTruncatingTail).setNumberOfLines(by: 2))
        
        
        return SearchDisplayerItemComponentData(
            imageData: CustomImageViewComponentData(
                imageUrl: createImageData(by: list[index].artworkUrl100!)),
            infoView: labelPack)
    }
    
    private func createImageData(by value: String) -> String {
        return "\(value)"
    }
    
    func getItemId(at index: Int) -> Int {
        return list[index].trackId
    }
    
}
