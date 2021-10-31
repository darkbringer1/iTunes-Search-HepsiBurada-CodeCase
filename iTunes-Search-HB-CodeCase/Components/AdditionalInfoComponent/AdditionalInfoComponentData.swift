//
//  AdditionalInfoComponentData.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 28.10.2021.
//

import UIKit

class AdditionalInfoComponentData {
    
    private(set) var shortDescription: String
    private(set) var longDescription: String
    private(set) var shortDescriptionDistributionData: AdditionalInfoDistributionData = AdditionalInfoDistributionData()
    private(set) var longDescriptionDistributionData: AdditionalInfoDistributionData = AdditionalInfoDistributionData()
    
    init(shortDescription: String = "",
         longDescription: String = "") {
        self.shortDescription = shortDescription
        self.longDescription = longDescription
    }
    
    func setLongDescriptionDistributionData(by value: AdditionalInfoDistributionData) -> Self {
        longDescriptionDistributionData = value
        return self
    }
    
    func setShortDescriptionLabelDistributionData(by value: AdditionalInfoDistributionData) -> Self {
        shortDescriptionDistributionData = value
        return self
    }
    
}
