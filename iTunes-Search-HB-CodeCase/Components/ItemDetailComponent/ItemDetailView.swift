//
//  ItemDetailView.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import UIKit
import BaseComponents

class ItemDetailView: GenericBaseView<ItemDetailViewData> {
    
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
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageContainer, infoView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .horizontal
        temp.spacing = 20
        return temp
    }()
    
    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.heightAnchor.constraint(equalToConstant: getSize()).isActive = true
        temp.widthAnchor.constraint(equalToConstant: getSize()).isActive = true
        return temp
    }()
    
    private lazy var infoView: LabelPackComponent = {
        let temp = LabelPackComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(shadowContainerView)
        shadowContainerView.addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            shadowContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            shadowContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            shadowContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            shadowContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            
            containerView.topAnchor.constraint(equalTo: shadowContainerView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowContainerView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowContainerView.trailingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        DispatchQueue.main.async {
            UIView.transition(with: self, duration: 1.0, options: .transitionCrossDissolve) {
                self.imageContainer.setData(by: data.imageData)
                self.infoView.setData(by: data.labelPackData)
            }
        }
    }
    
    func activationManager(by value: Bool) {
        isHidden = !value
    }
    
    private func getSize() -> CGFloat {
        return (UIScreen.main.bounds.size.width - 60) / 3
    }
}
