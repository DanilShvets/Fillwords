//
//  ViewController.swift
//  Fillwords
//
//  Created by Данил Швец on 06.05.2023.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    struct UIConstants {
        static let cornerRadius: CGFloat = 20
        static let cornerRadiusLabel: CGFloat = 15
        static let padding: CGFloat = 20
        static let buttonSize: CGFloat = 35
        static let memDescriptionHeight: CGFloat = 70
    }
    
    private lazy var arrayOfViews = [UIView]()
    private lazy var currentAnswerArray: Array<Character> = []
    private let memesDescriptionStruct = MemesDescriptionStruct()
    private lazy var labelNumber = 0
    private lazy var viewTagForRestart = 1
    private let largeConfig = UIImage.SymbolConfiguration(pointSize: UIConstants.buttonSize, weight: .bold, scale: .large)
    
    var charsArray = Array<Character>()
    var answers = [String]()
    var isMemesViewController = false
    var infoLabel = ""
    
    private lazy var arrayOfCurrentAnswersViews = [UIView]()
    private lazy var highliteColor = UIColor.random
    private lazy var previousView = UIView()
    private lazy var counterOfRightAnswers = 0
    private lazy var feedbackGenerator : UINotificationFeedbackGenerator? = nil
    private lazy var soundIsOn = true
    private lazy var vibroIsOn = true
    
    // MARK: - Создание ячеек игрового поля

    private lazy var row1Column1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 1
        return view
    }()
    private lazy var row1Column1Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row1Column2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 2
        return view
    }()
    private lazy var row1Column2Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row1Column3: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 3
        return view
    }()
    private lazy var row1Column3Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row1Column4: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 4
        return view
    }()
    private lazy var row1Column4Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row1Column5: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 5
        return view
    }()
    private lazy var row1Column5Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row1Column6: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 6
        return view
    }()
    private lazy var row1Column6Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row2Column1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 7
        return view
    }()
    private lazy var row2Column1Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row2Column2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 8
        return view
    }()
    private lazy var row2Column2Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row2Column3: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 9
        return view
    }()
    private lazy var row2Column3Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row2Column4: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 10
        return view
    }()
    private lazy var row2Column4Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row2Column5: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 11
        return view
    }()
    private lazy var row2Column5Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row2Column6: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 12
        return view
    }()
    private lazy var row2Column6Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row3Column1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 13
        return view
    }()
    private lazy var row3Column1Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row3Column2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 14
        return view
    }()
    private lazy var row3Column2Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row3Column3: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 15
        return view
    }()
    private lazy var row3Column3Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row3Column4: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 16
        return view
    }()
    private lazy var row3Column4Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row3Column5: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 17
        return view
    }()
    private lazy var row3Column5Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row3Column6: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 18
        return view
    }()
    private lazy var row3Column6Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row4Column1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 19
        return view
    }()
    private lazy var row4Column1Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row4Column2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 20
        return view
    }()
    private lazy var row4Column2Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row4Column3: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 21
        return view
    }()
    private lazy var row4Column3Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row4Column4: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 22
        return view
    }()
    private lazy var row4Column4Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row4Column5: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 23
        return view
    }()
    private lazy var row4Column5Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row4Column6: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 24
        return view
    }()
    private lazy var row4Column6Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row5Column1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 25
        return view
    }()
    private lazy var row5Column1Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row5Column2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 26
        return view
    }()
    private lazy var row5Column2Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row5Column3: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 27
        return view
    }()
    private lazy var row5Column3Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row5Column4: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 28
        return view
    }()
    private lazy var row5Column4Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row5Column5: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 29
        return view
    }()
    private lazy var row5Column5Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row5Column6: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 30
        return view
    }()
    private lazy var row5Column6Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row6Column1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 31
        return view
    }()
    private lazy var row6Column1Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row6Column2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 32
        return view
    }()
    private lazy var row6Column2Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row6Column3: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 33
        return view
    }()
    private lazy var row6Column3Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row6Column4: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 34
        return view
    }()
    private lazy var row6Column4Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row6Column5: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 35
        return view
    }()
    private lazy var row6Column5Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    private lazy var row6Column6: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        view.layer.cornerRadius = UIConstants.cornerRadius
        view.layer.masksToBounds = true
        view.tag = 36
        return view
    }()
    private lazy var row6Column6Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    
    
    // MARK: - Создание дополнительных элементов интерфейса
    
    private lazy var showCurrentWord: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.backgroundColor = UIColor(red: 0.96, green: 0.69, blue: 0.51, alpha: 1.00)
        label.numberOfLines = 0
        label.sizeToFit()
        label.layer.cornerRadius = UIConstants.cornerRadiusLabel
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var memeDesctiption: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.backgroundColor = UIColor(red: 0.65, green: 0.82, blue: 0.87, alpha: 1.00)
        label.numberOfLines = 0
        label.layer.cornerRadius = UIConstants.cornerRadiusLabel
        label.layer.masksToBounds = true
        label.isHidden = true
        label.textAlignment = .center
        return label
    }()
    
    private lazy var restartLevel: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(restartLevelButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var exitButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(exitButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(infoButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private var player: AVAudioPlayer?
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.isMultipleTouchEnabled = false
        if UserDefaults.standard.value(forKey: "soundIsOn") != nil {
            soundIsOn = UserDefaults.standard.bool(forKey: "soundIsOn")
        }
        if UserDefaults.standard.value(forKey: "vibroIsOn") != nil {
            vibroIsOn = UserDefaults.standard.bool(forKey: "vibroIsOn")
        }
        view.backgroundColor = .systemBackground
        addViewsToArray()
        configureBoard()
        configureRestartButton()
        configureInfoButton()
        configureExitButton()
    }
    
    
    // MARK: - Конфигурация игрового поля
    
    private func configureFirstRow() -> UIStackView {
        [row1Column1Label, row1Column2Label, row1Column3Label, row1Column4Label, row1Column5Label, row1Column6Label].forEach { label in
            arrayOfViews[labelNumber].addSubview(label)
            label.text = String(charsArray[labelNumber])
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: arrayOfViews[labelNumber].centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: arrayOfViews[labelNumber].centerYAnchor).isActive = true
            labelNumber += 1
        }
        
        let stack = UIStackView(arrangedSubviews: [row1Column1, row1Column2, row1Column3, row1Column4, row1Column5, row1Column6])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }
    
    private func configureSecondRow() -> UIStackView {
        [row2Column1Label, row2Column2Label, row2Column3Label, row2Column4Label, row2Column5Label, row2Column6Label].forEach { label in
            arrayOfViews[labelNumber].addSubview(label)
            label.text = String(charsArray[labelNumber])
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: arrayOfViews[labelNumber].centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: arrayOfViews[labelNumber].centerYAnchor).isActive = true
            labelNumber += 1
        }
        
        let stack = UIStackView(arrangedSubviews: [row2Column1, row2Column2, row2Column3, row2Column4, row2Column5, row2Column6])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }
    
    private func configureThidrRow() -> UIStackView {
        [row3Column1Label, row3Column2Label, row3Column3Label, row3Column4Label, row3Column5Label, row3Column6Label].forEach { label in
            arrayOfViews[labelNumber].addSubview(label)
            label.text = String(charsArray[labelNumber])
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: arrayOfViews[labelNumber].centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: arrayOfViews[labelNumber].centerYAnchor).isActive = true
            labelNumber += 1
        }
        
        let stack = UIStackView(arrangedSubviews: [row3Column1, row3Column2, row3Column3, row3Column4, row3Column5, row3Column6])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }
    
    private func configureFourthRow() -> UIStackView {
        [row4Column1Label, row4Column2Label, row4Column3Label, row4Column4Label, row4Column5Label, row4Column6Label].forEach { label in
            arrayOfViews[labelNumber].addSubview(label)
            label.text = String(charsArray[labelNumber])
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: arrayOfViews[labelNumber].centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: arrayOfViews[labelNumber].centerYAnchor).isActive = true
            labelNumber += 1
        }
        
        let stack = UIStackView(arrangedSubviews: [row4Column1, row4Column2, row4Column3, row4Column4, row4Column5, row4Column6])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }
    
    private func configureFithRow() -> UIStackView {
        [row5Column1Label, row5Column2Label, row5Column3Label, row5Column4Label, row5Column5Label, row5Column6Label].forEach { label in
            arrayOfViews[labelNumber].addSubview(label)
            label.text = String(charsArray[labelNumber])
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: arrayOfViews[labelNumber].centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: arrayOfViews[labelNumber].centerYAnchor).isActive = true
            labelNumber += 1
        }
        
        let stack = UIStackView(arrangedSubviews: [row5Column1, row5Column2, row5Column3, row5Column4, row5Column5, row5Column6])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }
    
    private func configureSixthRow() -> UIStackView {
        [row6Column1Label, row6Column2Label, row6Column3Label, row6Column4Label, row6Column5Label, row6Column6Label].forEach { label in
            arrayOfViews[labelNumber].addSubview(label)
            label.text = String(charsArray[labelNumber])
            label.translatesAutoresizingMaskIntoConstraints = false
            label.centerXAnchor.constraint(equalTo: arrayOfViews[labelNumber].centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: arrayOfViews[labelNumber].centerYAnchor).isActive = true
            labelNumber += 1
        }
        
        let stack = UIStackView(arrangedSubviews: [row6Column1, row6Column2, row6Column3, row6Column4, row6Column5, row6Column6])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }
    
    private func configureBoard() {
        let stack = UIStackView(arrangedSubviews: [configureFirstRow(), configureSecondRow(), configureThidrRow(), configureFourthRow(), configureFithRow(), configureSixthRow()])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stack.widthAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
        stack.heightAnchor.constraint(equalTo: stack.widthAnchor).isActive = true
        
        view.addSubview(showCurrentWord)
        showCurrentWord.translatesAutoresizingMaskIntoConstraints = false
        showCurrentWord.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showCurrentWord.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -25).isActive = true
    }
    
    
    // MARK: - Конфигурация дополнительных элементов интерфейса
    
    private func configureRestartButton() {
        view.addSubview(restartLevel)
        restartLevel.translatesAutoresizingMaskIntoConstraints = false
        restartLevel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.padding).isActive = true
        restartLevel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -UIConstants.padding).isActive = true
        restartLevel.widthAnchor.constraint(equalToConstant: UIConstants.buttonSize).isActive = true
        restartLevel.heightAnchor.constraint(equalToConstant: UIConstants.buttonSize).isActive = true
        let restartButtonImage = UIImage(systemName: "arrow.counterclockwise.circle", withConfiguration: largeConfig)
        restartLevel.setImage(restartButtonImage, for: .normal)
        restartLevel.tintColor = .systemTeal
        restartLevel.imageView?.contentMode = .scaleAspectFill
    }
    
    private func configureInfoButton() {
        view.addSubview(infoButton)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.padding).isActive = true
        infoButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: UIConstants.buttonSize).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: UIConstants.buttonSize).isActive = true
        let infoButtonImage = UIImage(systemName: "info.circle", withConfiguration: largeConfig)
        infoButton.setImage(infoButtonImage, for: .normal)
        infoButton.tintColor = .systemOrange
        infoButton.imageView?.contentMode = .scaleAspectFill
        
    }
    
    private func configureExitButton() {
        view.addSubview(exitButton)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.padding).isActive = true
        exitButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: UIConstants.padding).isActive = true
        exitButton.widthAnchor.constraint(equalToConstant: UIConstants.buttonSize).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: UIConstants.buttonSize).isActive = true
        let exitButtonImage = UIImage(systemName: "escape", withConfiguration: largeConfig)
        exitButton.setImage(exitButtonImage, for: .normal)
        exitButton.tintColor = .systemRed
        exitButton.imageView?.contentMode = .scaleAspectFill
    }
    
    private func showMemeDescription(withText descriptionText: String) {
        memeDesctiption.isHidden = false
        view.addSubview(memeDesctiption)
        memeDesctiption.translatesAutoresizingMaskIntoConstraints = false
        memeDesctiption.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -UIConstants.padding).isActive = true
        memeDesctiption.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        memeDesctiption.widthAnchor.constraint(equalToConstant: view.bounds.width - 2 * UIConstants.padding).isActive = true
        memeDesctiption.heightAnchor.constraint(equalToConstant: UIConstants.memDescriptionHeight).isActive = true
        memeDesctiption.text = memesDescriptionStruct.memes[descriptionText]
        memeDesctiption.tintColor = .black
    }
    
    
    // MARK: - Обработка жестов и отрисовка ввода
    
    private func clearViews(afterView currentView: UIView) {
        var indexOfView = 0
        for i in 0..<arrayOfCurrentAnswersViews.count {
            if arrayOfCurrentAnswersViews[i] == currentView {
                indexOfView = i
            }
        }
        
        for index in stride(from: arrayOfCurrentAnswersViews.count - 1, to: indexOfView, by: -1) {
            arrayOfCurrentAnswersViews[index].backgroundColor = .lightGray.withAlphaComponent(0.5)
            arrayOfCurrentAnswersViews.remove(at: index)
            currentAnswerArray.remove(at: index)
        }
    }
        
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if vibroIsOn {
            feedbackGenerator = UINotificationFeedbackGenerator()
            feedbackGenerator?.prepare()
        }
        
        if let touch = touches.first {
            let position = touch.location(in: view)
            
            if String(currentAnswerArray) != "" {
                showCurrentWord.text = "   " + String(currentAnswerArray) + "   "
            }
            
            for view in arrayOfViews {
                let globalPoint = view.superview!.convert(view.frame.origin, to: self.view)
                let arrayOfCurrentAnswersViewsLength = arrayOfCurrentAnswersViews.count
                
                if position.x >= globalPoint.x && position.x <= globalPoint.x + view.bounds.width  && position.y >= globalPoint.y && position.y <= globalPoint.y + view.bounds.height && (view.backgroundColor == .lightGray.withAlphaComponent(0.5) || view.backgroundColor != highliteColor) && view.tag != 100 && arrayOfCurrentAnswersViewsLength < 15 {
                    
//                  Проверка на пересечение отгаданного слова и ограничение возможности выбирать по диагонали
                    if arrayOfCurrentAnswersViewsLength > 0 {
                        let xCoordLastView = globalPoint.x
                        let yCoordLastView = globalPoint.y
                        let xCoordPreviousView = arrayOfCurrentAnswersViews.last?.superview!.convert((arrayOfCurrentAnswersViews.last?.frame.origin)!, to: self.view).x
                        let yCoordPreviousView = arrayOfCurrentAnswersViews.last?.superview!.convert((arrayOfCurrentAnswersViews.last?.frame.origin)!, to: self.view).y
                        let distanceBetweenCenters = sqrt(pow(xCoordPreviousView! - xCoordLastView, 2) + pow(yCoordPreviousView! - yCoordLastView, 2))
                        
                        if distanceBetweenCenters < view.bounds.width * 1.3 {
                            view.backgroundColor = highliteColor
                            currentAnswerArray.append(charsArray[view.tag - 1])
                            arrayOfCurrentAnswersViews.append(view)
                        }
                    } else {
                        view.backgroundColor = highliteColor
                        currentAnswerArray.append(charsArray[view.tag - 1])
                        arrayOfCurrentAnswersViews.append(view)
                    }
                    if soundIsOn {
                        playSound()
                    }
                } else if position.x >= globalPoint.x && position.x <= globalPoint.x + view.bounds.width  &&
                            position.y >= globalPoint.y && position.y <= globalPoint.y + view.bounds.height && view.backgroundColor == highliteColor {
                    clearViews(afterView: view)
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            let answer = String(currentAnswerArray)
            
            if answers.contains(answer) {
                arrayOfCurrentAnswersViews.forEach { view in
                    view.tag = 100
                }
                highliteColor = UIColor.random
                counterOfRightAnswers += 1
                
                if vibroIsOn {
                    feedbackGenerator?.notificationOccurred(.success)
                }
                
                if counterOfRightAnswers == answers.count {
                    showResult()
                }
                
                if isMemesViewController {
                    var runCount = 0
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                        self.showMemeDescription(withText: answer)
                        runCount += 1
                        if runCount == 3 {
                            timer.invalidate()
                            self.memeDesctiption.isHidden = true
                        }
                    }
                }
                
            } else {
                arrayOfCurrentAnswersViews.forEach { view in
                    view.backgroundColor = .lightGray.withAlphaComponent(0.5)
                }
                if vibroIsOn {
                    feedbackGenerator?.notificationOccurred(.error)
                }
            }
            currentAnswerArray.removeAll()
            arrayOfCurrentAnswersViews.removeAll()
            showCurrentWord.text = ""
            if vibroIsOn {
                feedbackGenerator = nil
            }
        }
    }
    
    private func showResult() {
        let popUpWindow = PopUpViewController(title: "РЕЗУЛЬТАТ", text: "Данный уровень успешно пройден!", buttontext: "В МЕНЮ")
        popUpWindow.isNotResultPopUp = false
        present(popUpWindow, animated: true, completion: nil)
    }
    
    private func addViewsToArray() {
        arrayOfViews.append(row1Column1)
        arrayOfViews.append(row1Column2)
        arrayOfViews.append(row1Column3)
        arrayOfViews.append(row1Column4)
        arrayOfViews.append(row1Column5)
        arrayOfViews.append(row1Column6)
        arrayOfViews.append(row2Column1)
        arrayOfViews.append(row2Column2)
        arrayOfViews.append(row2Column3)
        arrayOfViews.append(row2Column4)
        arrayOfViews.append(row2Column5)
        arrayOfViews.append(row2Column6)
        arrayOfViews.append(row3Column1)
        arrayOfViews.append(row3Column2)
        arrayOfViews.append(row3Column3)
        arrayOfViews.append(row3Column4)
        arrayOfViews.append(row3Column5)
        arrayOfViews.append(row3Column6)
        arrayOfViews.append(row4Column1)
        arrayOfViews.append(row4Column2)
        arrayOfViews.append(row4Column3)
        arrayOfViews.append(row4Column4)
        arrayOfViews.append(row4Column5)
        arrayOfViews.append(row4Column6)
        arrayOfViews.append(row5Column1)
        arrayOfViews.append(row5Column2)
        arrayOfViews.append(row5Column3)
        arrayOfViews.append(row5Column4)
        arrayOfViews.append(row5Column5)
        arrayOfViews.append(row5Column6)
        arrayOfViews.append(row6Column1)
        arrayOfViews.append(row6Column2)
        arrayOfViews.append(row6Column3)
        arrayOfViews.append(row6Column4)
        arrayOfViews.append(row6Column5)
        arrayOfViews.append(row6Column6)
    }
    
    func goBactToCategories() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func playSound() {
        let pathToSound = Bundle.main.path(forResource: "Bubble", ofType: "wav")!
        let url = URL(fileURLWithPath: pathToSound)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            
        }
    }
    
    private func animate(button: UIButton) {
        UIView.animate(withDuration: 0.1) {
            button.transform = button.transform.scaledBy(x: 0.85, y: 0.85)
        }
        UIView.animate(withDuration: 0.1, delay: 0.1) {
            button.transform = button.transform.scaledBy(x: 1.0/0.85, y: 1.0/0.85)
        }
    }
    
    
    // MARK: - @objc методы
    
    @objc private func restartLevelButtonPressed() {
        animate(button: restartLevel)
        arrayOfViews.forEach { view in
            view.tag = viewTagForRestart
            view.backgroundColor = .lightGray.withAlphaComponent(0.5)
            viewTagForRestart += 1
        }
        counterOfRightAnswers = 0
        currentAnswerArray.removeAll()
        arrayOfCurrentAnswersViews.removeAll()
        viewTagForRestart = 1
    }
    
    @objc private func infoButtonPressed() {
        animate(button: infoButton)
        let popUpWindow = PopUpViewController(title: "ИНФОРМАЦИЯ", text: infoLabel, buttontext: "OK")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.present(popUpWindow, animated: true, completion: nil)
        }
    }
    
    @objc private func exitButtonPressed() {
        animate(button: exitButton)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.goBactToCategories()
        }
    }
    
}

