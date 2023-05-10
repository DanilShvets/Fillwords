//
//  CategoriesCollectionViewCell.swift
//  Fillwords
//
//  Created by Данил Швец on 07.05.2023.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    private struct UIConstants {
        static let titleTextFontSizeNormal = 32.0
        static let titleTextFontSizeSmall = 28.0
        static let titleTextHeightNormal = 50.0
        static let titleTextHeightSmall = 35.0
        static let padding = 50.0
        static let verticalStackSpacing = 40.0
        static let cornerRadius = 30.0
    }
    
    private let screenSize: CGFloat = 667.0
    
    private lazy var titleText: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 80.0)
        label.sizeToFit()
        return label
    }()
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .systemBackground
        image.layer.cornerRadius = UIConstants.cornerRadius
        image.layer.masksToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureVerticalStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillCategoriesData(category: CategoriesStruct) {
        image.image = category.image
        titleText.text = category.titleText
    }
    
    private func configureVerticalStack() {
        if bounds.height <= screenSize {
            titleText.font = UIFont.boldSystemFont(ofSize: UIConstants.titleTextFontSizeSmall)
            titleText.heightAnchor.constraint(equalToConstant: UIConstants.titleTextHeightSmall).isActive = true
        } else {
            titleText.font = UIFont.boldSystemFont(ofSize: UIConstants.titleTextFontSizeNormal)
            titleText.heightAnchor.constraint(equalToConstant: UIConstants.titleTextHeightNormal).isActive = true
        }
        
        let verticalStack = UIStackView(arrangedSubviews: [titleText, image])
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.alignment = .center
        verticalStack.distribution = .equalSpacing
        verticalStack.backgroundColor = .systemBackground
        verticalStack.spacing = UIConstants.verticalStackSpacing
        
        addSubview(verticalStack)
        verticalStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        verticalStack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        verticalStack.widthAnchor.constraint(equalToConstant: bounds.width - UIConstants.padding).isActive = true
        verticalStack.heightAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
}
