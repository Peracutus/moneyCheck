//
//  IntroductionView.swift
//  Money check
//
//  Created by Roman on 04.11.2021.
//

import UIKit
import EasyPeasy
import Lottie


class IntroductionView: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var countModels: InfoViewModel?
    
    private let prevButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PREV", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(tapBack), for: .touchUpInside)
        button.tintColor = .gray
        return button
    }()
    
    @objc private func tapBack() {
        pageControl.currentPage -= 1
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        if pageControl.currentPage >= 0 {

            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.orangeColor, for: .normal)
        button.addTarget(self, action: #selector(tapNext), for: .touchUpInside)
        button.tintColor = .gray
        return button
    }()
    
    @objc private func tapNext() {
        pageControl.currentPage += 1
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        if pageControl.currentPage <= 3 {

            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    private var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .orangeColor
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(InfoCell.self, forCellWithReuseIdentifier: InfoCell.reuseId)
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        navigationController?.navigationBar.isHidden = true
        setupBottomControls()
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCell.reuseId, for: indexPath) as! InfoCell
        let infoModel = InfoViewModel(rawValue: indexPath.row)
        cell.animationView.animation = Animation.named(infoModel!.image)
        cell.animationView.play()
        cell.label.text = infoModel?.description
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate { (_) in
            self.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        } completion: { (_) in
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    private func setupBottomControls() {
        let stackView = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton], axis: .horizontal, spacing: 0, distribution: .fillEqually)
        view.addSubview(stackView)
        stackView.easy.layout(Left(20), Right(20), Height(50), Bottom().to(view.safeAreaLayoutGuide, .bottom))
    }
    
    
}
