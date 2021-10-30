//
//  ItemDetailViewData.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import Foundation

class ItemDetailViewData {
    
    private(set) var imageData: CustomImageViewComponentData
    private(set) var trackNameDescription: LabelPackComponentData
    private(set) var releaseDate: LabelPackComponentData
    private(set) var priceTag: PriceButtonViewData
    private(set) var additionalInfo: AdditionalInfoComponentData

    init(imageData: CustomImageViewComponentData,
         trackNameDescription: LabelPackComponentData,
         releaseDate: LabelPackComponentData,
         priceTag: PriceButtonViewData,
         additionalInfo: AdditionalInfoComponentData) {
        self.additionalInfo = additionalInfo
        self.imageData = imageData
        self.trackNameDescription = trackNameDescription
        self.releaseDate = releaseDate
        self.priceTag = priceTag
    }
    
    
}
