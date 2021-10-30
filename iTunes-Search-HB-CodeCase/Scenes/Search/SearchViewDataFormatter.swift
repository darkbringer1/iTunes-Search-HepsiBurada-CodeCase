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
        
        let image = createImageData(by: list[index].artworkUrl100!)
        let trackName = list[index].trackName
        let collectionName = list[index].collectionName ?? list[index].trackCensoredName
        let releaseDate = list[index].releaseDate?.dateToString(format: .short) ?? "No Release Date"
        let price = list[index].price
        let trackPrice = list[index].trackPrice
        let guaranteedPrice = getPrice(price1: price, price2: trackPrice)
        
        return SearchDisplayerItemComponentData(
            imageData: CustomImageViewComponentData(imageUrl: image),
            trackNameDescription: LabelPackComponentData(
                title: trackName,
                subtitle: collectionName!),
            releaseDate: LabelPackComponentData(
                title: "Release Date:",
                subtitle: releaseDate),
            priceTag: PriceButtonViewData(price: guaranteedPrice))
    }
    
    private func createImageData(by value: String) -> String {
        return "\(value)"
    }
    
    func getItemId(at index: Int) -> Int {
        return list[index].trackId!
    }
    
    func clearCollectionView() {
        list = []
    }
    
    
    //MARK: - Private function to get a non optional price tag from the API

    private func getPrice(price1: Double?, price2: Double?) -> String {
        if let garanti = price1 ?? price2, Int(garanti) != 0 {
            return "$ " + String(garanti)
        } else {
            return "Free"
        }
    }
    
}
