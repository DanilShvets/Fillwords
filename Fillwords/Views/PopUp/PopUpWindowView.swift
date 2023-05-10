//
//  PopUpWindow.swift
//  Fillwords
//
//  Created by Данил Швец on 07.05.2023.
//

import UIKit

class PopUpWindowView: UIView {
    
    struct UIConstants {
        static let cornerRadius: CGFloat = 30
        static let popViewSize: CGFloat = 300
        static let popUpTitleHeight: CGFloat = 55
        static let popUpTextHeight: CGFloat = 67
        static let popUpVerticalPadding: CGFloat = 8
        static let popUpHorizontalPadding: CGFloat = 8
        static let popUpButtonHeight: CGFloat = 60
    }
    
    var popupView = UIView(frame: CGRect.zero)
    var popupTitle = UILabel(frame: CGRect.zero)
    var popupText = UILabel(frame: CGRect.zero)
    var popupButton = UIButton(frame: CGRect.zero)
    
    init() {
        super.init(frame: CGRect.zero)
        backgroundColor = .black.withAlphaComponent(0.3)
        
        popupView.backgroundColor = UIColor(red: 1.00, green: 0.97, blue: 0.84, alpha: 1.00)
        popupView.layer.masksToBounds = true
        popupView.layer.cornerRadius = UIConstants.cornerRadius
        
        popupTitle.textColor = .black
        popupTitle.backgroundColor = UIColor(red: 0.97, green: 0.88, blue: 0.68, alpha: 1.00)
        popupTitle.layer.masksToBounds = true
        popupTitle.adjustsFontSizeToFitWidth = true
        popupTitle.clipsToBounds = true
        popupTitle.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
        popupTitle.numberOfLines = 1
        popupTitle.textAlignment = .center
        
        popupText.textColor = .black
        popupText.backgroundColor = UIColor(red: 1.00, green: 0.97, blue: 0.84, alpha: 1.00)
        popupText.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        popupText.numberOfLines = 0
        popupText.textAlignment = .center
        
        popupButton.setTitleColor(.black, for: .normal)
        popupButton.titleLabel?.font = UIFont.systemFont(ofSize: 23.0, weight: .bold)
        popupButton.backgroundColor = UIColor(red: 0.97, green: 0.88, blue: 0.68, alpha: 1.00)
        
        popupView.addSubview(popupTitle)
        popupView.addSubview(popupText)
        popupView.addSubview(popupButton)
        
        addSubview(popupView)
        
        popupView.translatesAutoresizingMaskIntoConstraints = false
        popupView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        popupView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        popupView.widthAnchor.constraint(equalToConstant: UIConstants.popViewSize).isActive = true
        popupView.heightAnchor.constraint(equalToConstant: UIConstants.popViewSize).isActive = true
        
        popupTitle.translatesAutoresizingMaskIntoConstraints = false
        popupTitle.topAnchor.constraint(equalTo: popupView.topAnchor).isActive = true
        popupTitle.leadingAnchor.constraint(equalTo: popupView.leadingAnchor).isActive = true
        popupTitle.trailingAnchor.constraint(equalTo: popupView.trailingAnchor).isActive = true
        popupTitle.heightAnchor.constraint(equalToConstant: UIConstants.popUpTitleHeight).isActive = true
        
        popupText.translatesAutoresizingMaskIntoConstraints = false
        popupText.topAnchor.constraint(equalTo: popupTitle.bottomAnchor, constant: UIConstants.popUpVerticalPadding).isActive = true
        popupText.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: UIConstants.popUpHorizontalPadding).isActive = true
        popupText.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -UIConstants.popUpHorizontalPadding).isActive = true
        popupText.bottomAnchor.constraint(equalTo: popupButton.topAnchor, constant: -UIConstants.popUpVerticalPadding).isActive = true
        
        popupButton.translatesAutoresizingMaskIntoConstraints = false
        popupButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor).isActive = true
        popupButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor).isActive = true
        popupButton.bottomAnchor.constraint(equalTo: popupView.bottomAnchor).isActive = true
        popupButton.heightAnchor.constraint(equalToConstant: UIConstants.popUpButtonHeight).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

