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
        let temp = UIStackView(arrangedSubviews: [imageContainer, infoView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        return temp
    }()
    
    private lazy var imageContainer: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 5
        temp.clipsToBounds = true
        temp.image = UIImage(named: "itunes-icon")
        temp.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
        temp.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
        return temp
    }()
    
    private lazy var infoView: LabelPackComponent = {
        let temp = LabelPackComponent(data: getLabelPackComponentData())
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
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
