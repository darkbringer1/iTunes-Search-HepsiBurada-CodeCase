//
//  SearchDisplayerItemComponentData.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 25.10.2021.
//

import Foundation
import BaseComponents

class SearchDisplayerItemComponentData: GenericDataProtocol {
    
    var type: GenericRowType? = nil
    
    private(set) var imageData: CustomImageViewComponentData
    private(set) var trackNameDescription: LabelPackComponentData
    private(set) var releaseDate: LabelPackComponentData
    private(set) var priceTag: PriceButtonViewData
    
    init(imageData: CustomImageViewComponentData,
         trackNameDescription: LabelPackComponentData,
         releaseDate: LabelPackComponentData,
         priceTag: PriceButtonViewData) {
        
        self.imageData = imageData
        self.trackNameDescription = trackNameDescription
        self.releaseDate = releaseDate
        self.priceTag = priceTag
    }
    
}
