//
//  ItemDetailDataFormatter.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import Foundation

class ItemDetailDataFormatter: ItemDetailDataFormatterProcol {
    
    //converting the SearchResult model with something viewModel can understand.
    func convertItemDetailView(from rawData: SearchResult) -> ItemDetailViewData {
        
        let image = createImageData(by: rawData.artworkUrl100!)
        let trackName = rawData.trackName
        let collectionName = rawData.collectionName ?? rawData.trackCensoredName
        let releaseDate = rawData.releaseDate?.dateToString(format: .long) ?? "No Release Date"
        let price = rawData.price
        let trackPrice = rawData.trackPrice
        let guaranteedPrice = getPrice(price1: price, price2: trackPrice)
        let shordDescription = rawData.shortDescription ?? rawData.artistName
        let longDescription = rawData.longDescription ?? rawData.description
            
        return ItemDetailViewData(imageData: CustomImageViewComponentData(imageUrl: image),
                                  trackNameDescription: LabelPackComponentData(title: trackName, subtitle: collectionName!),
                                  releaseDate: LabelPackComponentData(title: "Release Date:", subtitle: releaseDate),
                                  priceTag: PriceButtonViewData(price: guaranteedPrice),
                                  additionalInfo: AdditionalInfoComponentData(
                                    shortDescription: shordDescription ?? "No Description given about this product",
                                    longDescription: longDescription ?? "No Description given about this product"))
    }
    
    //image url as string. if url is nil will return empty string to prevent a crash
    private func createImageData(by value: String?) -> String {
        return value ?? ""
    }

    //Private function to get a non optional price tag from the API
    private func getPrice(price1: Double?, price2: Double?) -> String {
        if let garanti = price1 ?? price2, Int(garanti) != 0 {
            return "$ " + String(garanti)
        } else {
            return "Free"
        }
    }
    
}
