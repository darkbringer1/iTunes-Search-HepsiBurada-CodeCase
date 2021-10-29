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
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 2
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.text = " "
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 2
        title.contentMode = .left
        title.textAlignment = .left
        title.font = RobotoHelper.bold(14).value
        return title
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textColor = .black
        subtitle.text = " "
        subtitle.lineBreakMode = .byTruncatingTail
        subtitle.numberOfLines = 2
        subtitle.contentMode = .left
        subtitle.textAlignment = .left
        subtitle.font = RobotoHelper.regular(14).value
        return subtitle
    }()
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
    }
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        setupTitleConfigurations()
        setupSubtitleConfigurations()
        setMainStackView()
    }
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addUserComponents()
    }
    
    private func addUserComponents() {
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
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
