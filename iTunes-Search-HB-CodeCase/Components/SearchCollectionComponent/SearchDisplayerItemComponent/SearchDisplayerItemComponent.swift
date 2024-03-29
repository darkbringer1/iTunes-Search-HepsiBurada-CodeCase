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
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imagePriceRelease, trackNameDescription])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var priceAndRelease: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [priceTag, releaseDate])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .leading
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    private lazy var imagePriceRelease: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageContainer, priceAndRelease])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .top
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    private lazy var priceTag: PriceButtonView = {
        let price = PriceButtonView()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.contentMode = .center
        return price
    }()
    
    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let image = CustomImageViewComponentContainer()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var releaseDate: LabelPackComponent = {
        let release = LabelPackComponent()
        release.translatesAutoresizingMaskIntoConstraints = false
        return release
    }()
    
    private lazy var trackNameDescription: LabelPackComponent = {
        let info = LabelPackComponent()
        info.translatesAutoresizingMaskIntoConstraints = false
        info.contentMode = .left
        return info
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(shadowContainerView)
        shadowContainerView.addSubview(containerView)
        containerView.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            
            shadowContainerView.topAnchor.constraint(equalTo: topAnchor),
            shadowContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            shadowContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            containerView.topAnchor.constraint(equalTo: shadowContainerView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowContainerView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowContainerView.trailingAnchor),
            
            mainStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            mainStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15),
            mainStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            mainStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
        ])
        
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() as? SearchDisplayerItemComponentData else { return }
        imageContainer.setData(by: data.imageData)
        releaseDate.setData(by: data.releaseDate)
        priceTag.setData(by: data.priceTag)
        trackNameDescription.setData(by: data.trackNameDescription)
        mainStack.setCustomSpacing(5 , after: imagePriceRelease)
    }
    
}
