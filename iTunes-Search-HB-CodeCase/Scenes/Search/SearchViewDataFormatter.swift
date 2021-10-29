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
        let releaseDate = dateToString(with: list[index].releaseDate ?? "no release date")
        let price = list[index].price
        let trackPrice = list[index].trackPrice
        let guaranteedPrice = price ?? trackPrice
        
        
        
        return SearchDisplayerItemComponentData(
            imageData: CustomImageViewComponentData(imageUrl: image),
            trackNameDescription: LabelPackComponentData(
                title: trackName,
                subtitle: collectionName!)
                .setTitleLabelDistributionData(by: LabelDistributionData()
                                                .setTextAlignment(by: .left)
                                                .setNumberOfLines(by: 2)
                                                .setLineBreakMode(by: .byTruncatingTail)
                                                .setContentMode(by: .left)),
            releaseDate: LabelPackComponentData(
                title: "Release Date:",
                subtitle: releaseDate)
                .setTitleLabelDistributionData(by: LabelDistributionData()
                                                .setFont(by: RobotoHelper.bold(5).value)),
            priceTag: PriceButtonViewData(price: "$ " + String(guaranteedPrice ?? 0.00)))
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
    
    //MARK: - private function to convert date to human readable format

    private func dateToString(with date: String) -> String {
        
        var date = date
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date2 = formatter1.date(from: date) {
            let formatter2 = DateFormatter()
            formatter2.dateFormat = "MMM yyyy"
            formatter2.locale = Locale(identifier: "en_US_POSIX")
            
            let dateString = formatter2.string(from: date2)
            date = dateString
        }
        return date
    }
    
}
