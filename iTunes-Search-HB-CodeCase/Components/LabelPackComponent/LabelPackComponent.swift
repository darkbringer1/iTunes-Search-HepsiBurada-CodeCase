//
//  LabelPackComponent.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 25.10.2021.
//

import UIKit
import BaseComponents

class LabelPackComponent: GenericBaseView<LabelPackComponentData> {
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel, shortDescription])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.text = " "
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        title.contentMode = .center
        title.textAlignment = .center
        title.font = RobotoHelper.regular(16).value
        return title
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textColor = .black
        subtitle.text = " "
        subtitle.lineBreakMode = .byWordWrapping
        subtitle.numberOfLines = 0
        subtitle.contentMode = .center
        subtitle.textAlignment = .center
        subtitle.font = RobotoHelper.regular(16).value
        return subtitle
    }()
    
    private lazy var shortDescription: UILabel = {
        let desc = UILabel()
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.textColor = .black
        desc.text = " "
        desc.lineBreakMode = .byWordWrapping
        desc.numberOfLines = 0
        desc.contentMode = .center
        desc.textAlignment = .center
        desc.font = RobotoHelper.regular(16).value
        return desc
    }()
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
        shortDescription.text = data.shortDescription
    }
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        setupTitleConfigurations()
        setupSubtitleConfigurations()
    }
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addUserComponents()
    }
    
    private func addUserComponents() {
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
        ])
        
    }
    
    private func setupTitleConfigurations() {
        guard let data = returnData() else { return }
        titleLabel.lineBreakMode = data .titleLabelDistributionData.lineBreakMode
        titleLabel.numberOfLines = data.titleLabelDistributionData.numberOfLines
        titleLabel.contentMode = data.titleLabelDistributionData.contentMode
        titleLabel.textAlignment = data.titleLabelDistributionData.textAlignment
        titleLabel.font = data.titleLabelDistributionData.font
    }
    
    private func setupSubtitleConfigurations() {
        guard let data = returnData() else { return }
        subtitleLabel.lineBreakMode = data.subtitleLabelDistributionData.lineBreakMode
        subtitleLabel.numberOfLines = data.subtitleLabelDistributionData.numberOfLines
        subtitleLabel.contentMode = data.subtitleLabelDistributionData.contentMode
        subtitleLabel.textAlignment = data.subtitleLabelDistributionData.textAlignment
        subtitleLabel.font = data.subtitleLabelDistributionData.font
    }
    
    private func setMainStackView() {
        guard let data = returnData() else { return }
        mainStackView.spacing = data.spacing
        mainStackView.alignment = data.stackViewAlignment
    }
    
    
    
}
