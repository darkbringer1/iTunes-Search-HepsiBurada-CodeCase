//
//  ItemDetailDataFormatter.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import Foundation

class ItemDetailDataFormatter: ItemDetailDataFormatterProcol {
    
    func convertItemDetailView(from rawData: SearchResult) -> ItemDetailViewData {
        
        let image = createImageData(by: rawData.artworkUrl100!)
        let trackName = rawData.trackName
        let collectionName = rawData.collectionName ?? rawData.trackCensoredName
        let releaseDate = dateToString(with: rawData.releaseDate ?? "no release date")
        let price = rawData.price
        let trackPrice = rawData.trackPrice
        let guaranteedPrice = price ?? trackPrice
        let shordDescription = rawData.shortDescription ?? rawData.kind
        let longDescription = rawData.longDescription ?? rawData.collectionCensoredName
            
        return ItemDetailViewData(imageData: CustomImageViewComponentData(imageUrl: image),
                                  trackNameDescription: LabelPackComponentData(title: trackName, subtitle: collectionName!),
                                  releaseDate: LabelPackComponentData(title: "Release Date:", subtitle: releaseDate),
                                  priceTag: PriceButtonViewData(price:  "$ " + String(guaranteedPrice ?? 0.00)),
                                  additionalInfo: AdditionalInfoComponentData(
                                    shortDescription: shordDescription ?? "No Description given about this product",
                                    longDescription: longDescription ?? "No Description given about this product"))
    }
    
    //MARK: - private function to convert date to human readable format 

    private func createImageData(by value: String) -> String {
        return "\(value)"
    }
    
    private func dateToString(with date: String) -> String {
        
        var date = date
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date2 = formatter1.date(from: date) {
            let formatter2 = DateFormatter()
            formatter2.dateFormat = "dd MMMM yyyy"
            formatter2.locale = Locale(identifier: "en_US_POSIX")
            
            let dateString = formatter2.string(from: date2)
            date = dateString
        }
        return date
    }
    
}
