//
//  ItemDetailDataFormatter.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import Foundation

class ItemDetailDataFormatter: ItemDetailDataFormatterProcol {
    
    func convertItemDetailView(from rawData: SearchResult) -> ItemDetailViewData {
        let title = rawData.collectionName ?? ""
        let subtitle = rawData.collectionPrice ?? 0.00
        let description = rawData.shortDescription ?? ""
        let labelPack = LabelPackComponentData(title: title, subtitle: String(subtitle), shortDescription: description)
            .setTitleLabelDistributionData(by: LabelDistributionData()
                                            .setContentMode(by: .left)
                                            .setTextAlignment(by: .left)
                                            .setNumberOfLines(by: 0)
                                            .setLineBreakMode(by: .byWordWrapping)
                                            .setFont(by: RobotoHelper.bold(20).value))
            .setSubtitleLabelDistributionData(by: LabelDistributionData()
                                                .setContentMode(by: .left)
                                                .setTextAlignment(by: .left)
                                                .setLineBreakMode(by: .byWordWrapping)
                                                .setFont(by: RobotoHelper.italic(14).value))
            .setDescriptionLabelDistributionData(by: LabelDistributionData()
                                                    .setContentMode(by: .left)
                                                    .setTextAlignment(by: .left)
                                                    .setLineBreakMode(by: .byWordWrapping)
                                                    .setFont(by: RobotoHelper.light(14).value))
        return ItemDetailViewData(
            imageData: createImageData(with: rawData.artworkUrl100!),
            labelPackData: labelPack)
    }
    
    private func createImageData(with value: String) -> CustomImageViewComponentData {
        return CustomImageViewComponentData(imageUrl: value)
    }
    
}
