//
//  SettingsViewController.swift
//  Fillwords
//
//  Created by Данил Швец on 23.06.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    private struct UIConstants {
        static let buttonSize: CGFloat = 30
        static let buttonCornerRadius: CGFloat = 15
        static let buttonPadding: CGFloat = 20
        static let cornerRadius: CGFloat = 30
        static let imageSize: CGFloat = 40
        static let labelHeight: CGFloat = 40
        static let labelWidth: CGFloat = 70
        static let switchWidth: CGFloat = 70
        static let switchHeight: CGFloat = 50
        static let padding: CGFloat = 30
    }
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(closeViewController), for: .touchUpInside)
        return button
    }()
    private let largeConfig = UIImage.SymbolConfiguration(pointSize: UIConstants.buttonSize, weight: .regular, scale: .default)
    
    private lazy var soundLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private lazy var soundImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .systemBackground
        image.layer.cornerRadius = UIConstants.cornerRadius
        image.layer.masksToBounds = true
        return imageView
    }()
    private let switchSoundState: UISwitch = {
        let switchController = UISwitch()
        if UserDefaults.standard.value(forKey: "soundIsOn") != nil {
            switchController.isOn = UserDefaults.standard.bool(forKey: "soundIsOn")
        } else {
            switchController.isOn = true
        }
        switchController.addTarget(self, action: #selector(switchValueSound(_:)), for: .valueChanged)
        return switchController
    }()
    
    private lazy var vibroLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    private lazy var vibroImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .systemBackground
        image.layer.cornerRadius = UIConstants.cornerRadius
        image.layer.masksToBounds = true
        return imageView
    }()
    private let switchVibroState: UISwitch = {
        let switchController = UISwitch()
        if UserDefaults.standard.value(forKey: "vibroIsOn") != nil {
            switchController.isOn = UserDefaults.standard.bool(forKey: "vibroIsOn")
        } else {
            switchController.isOn = true
        }
        switchController.addTarget(self, action: #selector(switchValueVibro(_:)), for: .valueChanged)
        return switchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        navigationController?.navigationBar.isHidden = true
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureCloseButton()
        configureSoundLabel()
        configureSwitchSound()
        configureSoundImageView()
        configureVibroLabel()
        configureSwitchVibro()
        configureVibroImageView()
    }
    
    
    private func configureCloseButton() {
        let closeButtonImage = UIImage(systemName: "xmark", withConfiguration: largeConfig)
        closeButton.setImage(closeButtonImage, for: .normal)
        closeButton.tintColor = .systemGray
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.buttonPadding).isActive = true
        closeButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -UIConstants.buttonPadding).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: UIConstants.buttonSize).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: UIConstants.buttonSize).isActive = true
        closeButton.clipsToBounds = true
        closeButton.layer.cornerRadius = UIConstants.buttonCornerRadius
    }
    
    private func configureSoundLabel() {
        soundLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(soundLabel)
        soundLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: UIConstants.padding).isActive = true
        soundLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 2*UIConstants.padding).isActive = true
        soundLabel.widthAnchor.constraint(equalToConstant: UIConstants.labelWidth).isActive = true
        soundLabel.heightAnchor.constraint(equalToConstant: UIConstants.labelHeight).isActive = true
        soundLabel.text = "Звук"
    }
    private func configureSwitchSound() {
        switchSoundState.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(switchSoundState)
        switchSoundState.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: UIConstants.padding + 5).isActive = true
        switchSoundState.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -2*UIConstants.padding).isActive = true
        switchSoundState.widthAnchor.constraint(equalToConstant: UIConstants.switchWidth).isActive = true
        switchSoundState.heightAnchor.constraint(equalToConstant: UIConstants.switchHeight).isActive = true
    }
    private func configureSoundImageView() {
        soundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(soundImageView)
        soundImageView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: UIConstants.padding).isActive = true
        soundImageView.rightAnchor.constraint(equalTo: switchSoundState.leftAnchor, constant: -UIConstants.padding).isActive = true
        soundImageView.widthAnchor.constraint(equalToConstant: UIConstants.imageSize).isActive = true
        soundImageView.heightAnchor.constraint(equalToConstant: UIConstants.imageSize).isActive = true
        if (switchSoundState.isOn){
            soundImageView.image = UIImage(systemName: "speaker.circle")
            soundImageView.tintColor = .systemTeal
        }
        else{
            soundImageView.image = UIImage(systemName: "speaker.slash.circle")
            soundImageView.tintColor = .systemRed
        }
    }
    
    private func configureVibroLabel() {
        vibroLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vibroLabel)
        vibroLabel.topAnchor.constraint(equalTo: soundLabel.bottomAnchor, constant: UIConstants.padding).isActive = true
        vibroLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 2*UIConstants.padding).isActive = true
        vibroLabel.widthAnchor.constraint(equalToConstant: 1.5*UIConstants.labelWidth).isActive = true
        vibroLabel.heightAnchor.constraint(equalToConstant: UIConstants.labelHeight).isActive = true
        vibroLabel.text = "Вибро"
    }
    private func configureSwitchVibro() {
        switchVibroState.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(switchVibroState)
        switchVibroState.topAnchor.constraint(equalTo: soundLabel.bottomAnchor, constant: UIConstants.padding + 5).isActive = true
        switchVibroState.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -2*UIConstants.padding).isActive = true
        switchVibroState.widthAnchor.constraint(equalToConstant: UIConstants.switchWidth).isActive = true
        switchVibroState.heightAnchor.constraint(equalToConstant: UIConstants.switchHeight).isActive = true
    }
    private func configureVibroImageView() {
        vibroImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vibroImageView)
        vibroImageView.topAnchor.constraint(equalTo: soundLabel.bottomAnchor, constant: UIConstants.padding).isActive = true
        vibroImageView.rightAnchor.constraint(equalTo: switchVibroState.leftAnchor, constant: -UIConstants.padding).isActive = true
        vibroImageView.widthAnchor.constraint(equalToConstant: UIConstants.imageSize).isActive = true
        vibroImageView.heightAnchor.constraint(equalToConstant: UIConstants.imageSize).isActive = true
        if (switchVibroState.isOn){
            vibroImageView.image = UIImage(systemName: "iphone.gen2.radiowaves.left.and.right.circle")
            vibroImageView.tintColor = .systemGreen
        }
        else{
            vibroImageView.image = UIImage(systemName: "iphone.gen2.slash.circle")
            vibroImageView.tintColor = .systemOrange
        }
    }
    
    @objc func closeViewController() {
        dismiss(animated: true)
    }
    
    @objc func switchValueSound(_ sender: UISwitch!) {
        if (sender.isOn){
            soundImageView.image = UIImage(systemName: "speaker.circle")
            soundImageView.tintColor = .systemTeal
        }
        else{
            soundImageView.image = UIImage(systemName: "speaker.slash.circle")
            soundImageView.tintColor = .systemRed
        }
        UserDefaults.standard.setValue(sender.isOn, forKey: "soundIsOn")
    }
    
    @objc func switchValueVibro(_ sender: UISwitch!) {
        if (sender.isOn){
            vibroImageView.image = UIImage(systemName: "iphone.gen2.radiowaves.left.and.right.circle")
            vibroImageView.tintColor = .systemGreen
        }
        else{
            vibroImageView.image = UIImage(systemName: "iphone.gen2.slash.circle")
            vibroImageView.tintColor = .systemOrange
        }
        UserDefaults.standard.setValue(sender.isOn, forKey: "vibroIsOn")
    }

    
}
