//
//  EmptyBackgroundView.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 26.10.2021.
//

import UIKit
import BaseComponents

class EmptyBackgroundView: GenericBaseView<EmptyBackgroundViewData> {

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageContainer, infoView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isUserInteractionEnabled = true
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var imageContainer: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.image = UIImage(named: "itunes-icon")
        image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
        image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
        return image
    }()
    
    private lazy var infoView: LabelPackComponent = {
        let info = LabelPackComponent(data: getLabelPackComponentData())
        info.translatesAutoresizingMaskIntoConstraints = false
        return info
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            mainStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            
        ])
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        infoView.setData(by: data.labelPackData)
    }
    
    func activationManager(by value: Bool) {
        isHidden = !value
    }
    
    private func getLabelPackComponentData() -> LabelPackComponentData {
        return LabelPackComponentData()
            .setTitleLabelDistributionData(by: LabelDistributionData()
                                            .setContentMode(by: .center)
                                            .setTextAlignment(by: .center)
                                            .setNumberOfLines(by: 0)
                                            .setLineBreakMode(by: .byWordWrapping)
                                            .setFont(by: RobotoHelper.bold(24).value))
            .setSubtitleLabelDistributionData(by: LabelDistributionData()
                                                .setContentMode(by: .center)
                                                .setTextAlignment(by: .center)
                                                .setNumberOfLines(by: 2)
                                                .setLineBreakMode(by: .byWordWrapping)
                                                .setFont(by: RobotoHelper.regular(16).value))
            .setSpacing(by: 10)
            .setStackViewAlignment(by: .fill)
    }
    
}
