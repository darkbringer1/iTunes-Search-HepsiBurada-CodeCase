//
//  ItemDetailView.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import UIKit
import BaseComponents

class ItemDetailView: GenericBaseView<ItemDetailViewData> {
    
//    private lazy var shadowContainerView: UIView = {
//        let shadow = UIView()
//        shadow.translatesAutoresizingMaskIntoConstraints = false
//        shadow.layer.shadowColor = UIColor.black.cgColor
//        shadow.layer.shadowOffset = CGSize(width: 0, height: 2)
//        shadow.layer.shadowRadius = 4
//        shadow.layer.shadowOpacity = 0.4
//        shadow.layer.cornerRadius = 6
//        return shadow
//    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        return view
    }()
    
    private lazy var mainStack: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imagePriceRelease, trackNameDescription, additionalInfo])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .top
        temp.distribution = .fillProportionally
        temp.axis = .vertical
        return temp
    }()
    
    private lazy var priceAndRelease: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [releaseDate, priceStack])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .leading
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 5
        return temp
    }()
    
    private lazy var imagePriceRelease: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageContainer, priceAndRelease])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .top
        temp.distribution = .fill
        temp.axis = .horizontal
        temp.spacing = 5
        return temp
    }()
    
    private lazy var priceStack: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [productPrice, priceTag])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .horizontal
        temp.spacing = 5
        return temp
    }()
    
    lazy var productPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Product Price: "
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.contentMode = .center
        label.textAlignment = .center
        label.font = RobotoHelper.regular(14).value
        return label
    }()
    
    private lazy var priceTag: PriceButtonView = {
        let price = PriceButtonView()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.contentMode = .center
        return price
    }()
    
    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 10
        temp.heightAnchor.constraint(equalToConstant: 100).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 100).isActive = true
        temp.clipsToBounds = true
        return temp
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
    private lazy var additionalInfo: AdditionalInfoComponent = {
        let info = AdditionalInfoComponent()
        info.translatesAutoresizingMaskIntoConstraints = false
        return info
    }()
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        setupContainerViewLayers()
    }
    private func addComponents() {
//        addSubview(shadowContainerView)
        addSubview(containerView)
        containerView.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            
//            shadowContainerView.topAnchor.constraint(equalTo: topAnchor),
//            shadowContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            shadowContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            shadowContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
//
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            mainStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            mainStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -40),
            mainStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            mainStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            
        ])
        
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        DispatchQueue.main.async {
            UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve) { [self] in
                imageContainer.setData(by: data.imageData)
                releaseDate.setData(by: data.releaseDate)
                priceTag.setData(by: data.priceTag)
                trackNameDescription.setData(by: data.trackNameDescription)
                mainStack.setCustomSpacing(10 , after: imagePriceRelease)
                mainStack.setCustomSpacing(20, after: trackNameDescription)
                additionalInfo.setData(by: data.additionalInfo)
            }
        }
    }
    
    private func setupContainerViewLayers() {
        containerView.layer.cornerRadius = 10
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func activationManager(by value: Bool) {
        isHidden = !value
    }
    
    private func getSize() -> CGFloat {
        return (UIScreen.main.bounds.size.width - 60) / 3
    }
}
