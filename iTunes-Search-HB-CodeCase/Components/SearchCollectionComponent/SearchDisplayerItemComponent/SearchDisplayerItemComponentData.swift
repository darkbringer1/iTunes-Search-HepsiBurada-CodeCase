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
    private(set) var infoView: LabelPackComponentData
    
    init(imageData: CustomImageViewComponentData,
         infoView: LabelPackComponentData) {
        self.imageData = imageData
        self.infoView = infoView
    }
}
