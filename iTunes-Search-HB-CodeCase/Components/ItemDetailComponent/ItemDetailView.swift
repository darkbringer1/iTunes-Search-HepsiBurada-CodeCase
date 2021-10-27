//
//  ItemDetailView.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import UIKit
import BaseComponents

class ItemDetailView: GenericBaseView<ItemDetailViewData> {
    
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
//        temp.layer.cornerRadius = 2
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
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
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
