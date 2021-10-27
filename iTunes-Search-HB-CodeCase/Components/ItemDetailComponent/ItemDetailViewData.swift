//
//  ItemDetailViewData.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import Foundation

class ItemDetailViewData {
    
    private(set) var imageData: CustomImageViewComponentData
    private(set) var labelPackData: LabelPackComponentData
    
    internal init(imageData: CustomImageViewComponentData,
                  labelPackData: LabelPackComponentData) {
        self.imageData = imageData
        self.labelPackData = labelPackData
    }
    
}
