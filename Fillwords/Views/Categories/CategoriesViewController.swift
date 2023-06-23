//
//  CategoriesViewController.swift
//  Fillwords
//
//  Created by Данил Швец on 07.05.2023.
//

import UIKit
import AVFoundation

class CategoriesViewController: UIViewController {
    private struct UIConstants {
        static let topPaddingPageContol: CGFloat = 15
        static let bottomPaddingCollection: CGFloat = -170
        static let topPaddingPlayButton: CGFloat = 30
        static let playButtonHeight: CGFloat = 75
        static let playButtonCornerRadius: CGFloat = 20
        static let padding: CGFloat = 20
        static let buttonSize: CGFloat = 35
    }
    private lazy var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(settingsButtonPressed), for: .touchUpInside)
        return button
    }()
    private lazy var infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(infoButtonPressed), for: .touchUpInside)
        return button
    }()
    private let largeConfig = UIImage.SymbolConfiguration(pointSize: UIConstants.buttonSize, weight: .bold, scale: .large)
    private let infoText = "В данной игре Вам необходимо составлять слова из букв, расположенных на игровой доске. Чтобы составить слово, проведите пальцем по буквам."
    
    private lazy var collectionView: UICollectionView = {
        let safeAreaInsets = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.safeAreaInsets
        let topPadding = safeAreaInsets?.top ?? 0
        let bottomPadding = safeAreaInsets?.bottom ?? 0
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        let sizeCell = CGSize(width: view.bounds.width, height: view.bounds.height - (topPadding + bottomPadding) - (UIConstants.topPaddingPageContol + UIConstants.buttonSize + 2 * UIConstants.padding) + UIConstants.bottomPaddingCollection)
        layout.itemSize = sizeCell
        layout.scrollDirection = .horizontal
        collection.isPagingEnabled = true
        layout.minimumLineSpacing = 1
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        collection.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.self.description())
        return collection
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .systemOrange
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        return button
    }()
    private lazy var soundIsOn = true
    private var player: AVAudioPlayer?
    
    private let categories = (0...3).map({ CategoriesStruct(index: $0) })
    private let boardStruct = BoardStruct()
    private let answersStruct = AnswersStruct()
    private let infoStruct = InfoStruct()
    
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureEttingsButton()
        configureInfoButton()
        configureCollectionView()
        configurePageControl()
        configurePlayButton()
    }
    
    
    // MARK: - Конфигурация частей интерфейса
    
    private func configureEttingsButton() {
        view.addSubview(settingsButton)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.padding).isActive = true
        settingsButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: UIConstants.padding).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: UIConstants.buttonSize).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: UIConstants.buttonSize).isActive = true
        let settingsButtonButtonImage = UIImage(systemName: "gearshape", withConfiguration: largeConfig)
        settingsButton.setImage(settingsButtonButtonImage, for: .normal)
        settingsButton.tintColor = .gray
        settingsButton.imageView?.contentMode = .scaleAspectFill
    }
    
    private func configureInfoButton() {
        view.addSubview(infoButton)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.padding).isActive = true
        infoButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -UIConstants.padding).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: UIConstants.buttonSize).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: UIConstants.buttonSize).isActive = true
        let infoButtonImage = UIImage(systemName: "info.circle", withConfiguration: largeConfig)
        infoButton.setImage(infoButtonImage, for: .normal)
        infoButton.tintColor = .systemOrange
        infoButton.imageView?.contentMode = .scaleAspectFill
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: infoButton.bottomAnchor, constant: UIConstants.padding).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: UIConstants.bottomPaddingCollection).isActive = true
    }
    
    private func configurePlayButton() {
        view.addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        playButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: UIConstants.topPaddingPlayButton).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 2.0).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: UIConstants.playButtonHeight).isActive = true
        playButton.layer.cornerRadius = UIConstants.playButtonCornerRadius
        playButton.backgroundColor = UIColor(red: 0.64, green: 0.82, blue: 0.64, alpha: 1.00)
        playButton.tintColor = .black
        playButton.setTitle("ИГРАТЬ", for: .normal)
        playButton.titleLabel?.font = .boldSystemFont(ofSize: 30.0)
    }
    
    private func configurePageControl(){
        view.addSubview(pageControl)
        pageControl.numberOfPages = categories.count
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: UIConstants.topPaddingPageContol).isActive = true
    }
}

extension CategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.self.description(), for: indexPath) as? CategoriesCollectionViewCell else { return .init() }
        cell.fillCategoriesData(category: categories[indexPath.item])
        return cell
    }
}


extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}

extension CategoriesViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPosition = scrollView.contentOffset.x / view.frame.width
        pageControl.currentPage = Int(scrollPosition)
    }
    
    private func presentGameViewController() {
        let gameViewController = GameViewController()
        let currentPage = pageControl.currentPage
        switch currentPage {
        case 0:
            gameViewController.charsArray = boardStruct.level_1
            gameViewController.answers = answersStruct.level_1
            gameViewController.isMemesViewController = false
            gameViewController.infoLabel = infoStruct.level_1
        case 1:
            gameViewController.charsArray = boardStruct.level_2
            gameViewController.answers = answersStruct.level_2
            gameViewController.isMemesViewController = false
            gameViewController.infoLabel = infoStruct.level_2
        case 2:
            gameViewController.charsArray = boardStruct.level_3
            gameViewController.answers = answersStruct.level_3
            gameViewController.isMemesViewController = false
            gameViewController.infoLabel = infoStruct.level_3
        case 3:
            gameViewController.charsArray = boardStruct.level_4
            gameViewController.answers = answersStruct.level_4
            gameViewController.isMemesViewController = true
            gameViewController.infoLabel = infoStruct.level_4
        default:
            gameViewController.charsArray = boardStruct.level_1
            gameViewController.answers = answersStruct.level_1
            gameViewController.infoLabel = infoStruct.level_1
        }
        gameViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.present(gameViewController, animated: true)
    }
    
    private func showMyViewControllerInACustomizedSheet() {
        let viewControllerToPresent = SettingsViewController()
        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    private func playSound() {
        let pathToSound = Bundle.main.path(forResource: "Snap", ofType: "wav")!
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
    
    @objc private func infoButtonPressed() {
        animate(button: infoButton)
        let popUpWindow = PopUpViewController(title: "ФИЛВОРДЫ", text: infoText, buttontext: "OK")
        present(popUpWindow, animated: true, completion: nil)
    }
    @objc private func settingsButtonPressed() {
        animate(button: settingsButton)
        UIView.animate(withDuration: 0.5) {
            self.settingsButton.transform = self.settingsButton.transform.rotated(by: CGFloat.pi)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.showMyViewControllerInACustomizedSheet()
        }
    }
    
    @objc private func playButtonPressed() {
        if UserDefaults.standard.value(forKey: "soundIsOn") != nil {
            soundIsOn = UserDefaults.standard.bool(forKey: "soundIsOn")
        }
        animate(button: playButton)
        if soundIsOn {
            playSound()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.presentGameViewController()
        }
    }
    
}
