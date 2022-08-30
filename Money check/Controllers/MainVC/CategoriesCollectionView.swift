//
//  CategoriesCollectionView.swift
//  Money check
//
//  Created by Roman on 28.09.2021.
//

import UIKit
import EasyPeasy
import Foundation


struct CustomData {
    var catName: String
    var image: UIImage
}

class CategoriesCollectionView: UIViewController {
 
    fileprivate var categoryArray = [
        CustomData(catName: "Shopping", image: #imageLiteral(resourceName: "ShoppingBag")),
        CustomData(catName: "Groceries", image: #imageLiteral(resourceName: "Ingredients")),
        CustomData(catName: "Gym", image: #imageLiteral(resourceName: "Jym")),
        CustomData(catName: "Gifts", image: #imageLiteral(resourceName: "Gift")),
        CustomData(catName: "Games", image: #imageLiteral(resourceName: "Controller")),
        CustomData(catName: "Restaraunts", image: #imageLiteral(resourceName: "Restaurant")),
        CustomData(catName: "Transport", image: #imageLiteral(resourceName: "Transportation")),
        CustomData(catName: "Bank", image: #imageLiteral(resourceName: "CreditCard")),
        CustomData(catName: "Cloths", image: #imageLiteral(resourceName: "Hanger")),
    ]
    
    weak var delegateCategory: Category?
    
    private var collectionView: UICollectionView?

    let addButton: UIButton = {
        let addLabel = UIButton()
        addLabel.imageView?.image = #imageLiteral(resourceName: "plus_icon")
        addLabel.backgroundColor = .orangeColor
        addLabel.setBackgroundImage(#imageLiteral(resourceName: "plus_icon"), for: .normal)
        addLabel.layer.cornerRadius = 40
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        addLabel.addTarget(self, action: #selector(addNewCategory), for: .touchUpInside )
        return addLabel
    }()
    
    @objc private func addNewCategory() {
        
        let popUpVC = PopUpVC()

        self.addChild(popUpVC)
        popUpVC.view.frame = self.view.frame
        self.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParent: self)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Choose a category"
        createCollectionView()
        setConstrantns()
    }
}

extension CategoriesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func createCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        let frame = 100
        flowLayout.itemSize = CGSize.init(width: frame, height: frame)
        flowLayout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .infinite, collectionViewLayout: flowLayout)
        guard let collectionView = collectionView else {return}
        self.collectionView!.register(CategoriesCollectionCell.self, forCellWithReuseIdentifier: CategoriesCollectionCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        collectionView.backgroundColor = #colorLiteral(red: 0.9888455243, green: 1, blue: 0.9262188061, alpha: 1)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.allowsMultipleSelection = false
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionCell.identifier, for: indexPath) as! CategoriesCollectionCell
        cell.categoryWithImg = self.categoryArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration:0.5 , animations: {
            cell.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedItem = collectionView.cellForItem(at: indexPath) else {return}
        collectionView.cellForItem(at: indexPath)
        selectedItem.contentView.backgroundColor = .orangeColor
        
        let selectedCategory = categoryArray[indexPath.item].catName
        let selectedImage = categoryArray[indexPath.item].image
        delegateCategory?.selectedCategory(categoryName: selectedCategory, categoryImage: selectedImage)
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
 
    func setConstrantns() {
        view.addSubview(addButton)
        addButton.easy.layout(Bottom(20).to(view.safeAreaLayoutGuide, .bottom), Right(20).to(view.safeAreaLayoutGuide, .right), Height(80), Width(80))
    }
}
