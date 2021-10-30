//
//  AdditionalInfoComponentData.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 28.10.2021.
//

import Foundation

class AdditionalInfoComponentData {
    
    private(set) var shortDescription: String
    private(set) var longDescription: String
    
    init(shortDescription: String,
         longDescription: String) {
        self.shortDescription = shortDescription
        self.longDescription = longDescription
    }
    
}
