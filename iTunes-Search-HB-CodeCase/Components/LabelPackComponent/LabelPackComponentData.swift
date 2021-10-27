//
//  LabelPackComponentData.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 25.10.2021.
//

import UIKit

class LabelPackComponentData {
    
    private(set) var title: String
    private(set) var subtitle: String
    private(set) var shortDescription: String
    private(set) var stackViewAlignment: UIStackView.Alignment = .center
    private(set) var spacing: CGFloat = 10
    private(set) var titleLabelDistributionData: LabelDistributionData = LabelDistributionData()
    private(set) var subtitleLabelDistributionData: LabelDistributionData = LabelDistributionData()
    private(set) var descriptionLabelDistributionData: LabelDistributionData = LabelDistributionData()
    
    init(title: String = "",
         subtitle: String = "",
         shortDescription: String = "") {
        self.title = title
        self.subtitle = subtitle
        self.shortDescription = shortDescription
    }
    
    func setTitleLabelDistributionData(by value: LabelDistributionData) -> Self {
        titleLabelDistributionData = value
        return self
    }
    
    func setSubtitleLabelDistributionData(by value: LabelDistributionData) -> Self {
        subtitleLabelDistributionData = value
        return self
    }
    
    func setDescriptionLabelDistributionData(by value: LabelDistributionData) -> Self {
        descriptionLabelDistributionData = value
        return self
    }
    
    func setStackViewAlignment(by value: UIStackView.Alignment) -> Self {
        stackViewAlignment = value
        return self
    }
    
    func setSpacing(by value: CGFloat) -> Self {
        spacing = value
        return self
    }
    
    
}
