//
//  SearchDisplayerItemComponent.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 25.10.2021.
//

import UIKit
import BaseComponents

class SearchDisplayerItemComponent: GenericBaseView<GenericDataProtocol> {
    
    private lazy var shadowContainerView: UIView = {
        let shadow = UIView()
        shadow.translatesAutoresizingMaskIntoConstraints = false
        shadow.layer.shadowColor = UIColor.black.cgColor
        shadow.layer.shadowOffset = CGSize(width: 0, height: 2)
        shadow.layer.shadowRadius = 4
        shadow.layer.shadowOpacity = 0.4
        shadow.layer.cornerRadius = 6
        return shadow
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
//    private lazy var mainStackView: UIStackView = {
//        let temp = UIStackView(arrangedSubviews: [imageContainer, infoView])
//        temp.translatesAutoresizingMaskIntoConstraints = false
//        temp.isUserInteractionEnabled = true
//        temp.alignment = .center
//        temp.distribution = .fill
//        temp.axis = .vertical
//        temp.spacing = 5
//        return temp
//    }()
    
    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 2
        temp.clipsToBounds = true
        return temp
    }()
    
    private lazy var gradient: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor,    UIColor.black.cgColor]
//        gradientLayer.opacity = 0.7
        return gradientLayer
    }()
    
    private lazy var infoView: LabelPackComponent = {
        let info = LabelPackComponent()
        info.translatesAutoresizingMaskIntoConstraints = false
        info.contentMode = .top
        return info
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(shadowContainerView)
        shadowContainerView.addSubview(containerView)
        containerView.addSubview(imageContainer)
        imageContainer.layer.addSublayer(gradient)
        imageContainer.addSubview(infoView)
        
        NSLayoutConstraint.activate([
            
            shadowContainerView.topAnchor.constraint(equalTo: topAnchor),
            shadowContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            shadowContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            containerView.topAnchor.constraint(equalTo: shadowContainerView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowContainerView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowContainerView.trailingAnchor),
            
            imageContainer.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            imageContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            infoView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor),
            infoView.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            
        ])
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() as? SearchDisplayerItemComponentData else { return }
        imageContainer.setData(by: data.imageData)
        infoView.setData(by: data.infoView)
    }
}
