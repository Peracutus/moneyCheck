//
//  PopUpVC.swift
//  Money check
//
//  Created by Roman on 28.09.2021.
//

import UIKit
import EasyPeasy
import Foundation

class PopUpVC: UIViewController, UIGestureRecognizerDelegate {

    private var collectionView: UICollectionView?
    
    private var popUpView: UIView = {
       let popUp = UIView()
        popUp.layer.cornerRadius = 15
        popUp.layer.backgroundColor = #colorLiteral(red: 0.9888455243, green: 1, blue: 0.9262188061, alpha: 1)
        popUp.layer.borderWidth = 2
        popUp.layer.masksToBounds = true
        popUp.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return popUp
    }()
    
    private var titleLabel = UILabel(text: "Add new category", font: .avenirNextDemiBold20(), alignment: .center)
    private var categoryTextField = UITextField(placeholder: "Print a name")
    private var errorLabel = UILabel(text: "Incorrect data!", font: .avenirNextDemiBold20(), alignment: .center)
    private var addButton = UIButton(color: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), name: "Done")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray.withAlphaComponent(0.85)
        errorLabel.isHidden = true
        addButton.addTarget(self, action: #selector(addNewItem), for: .touchUpInside)
        setConstraints()
        moveIn()
        tapAction()
        createCollectionView()
    }
    
    private func addCategory() {
        if categoryTextField.text?.isEmpty == true {
            errorLabel.isHidden = true
            moveOut()
        } else {
            errorLabel.isHidden = false
        }
    }
    @objc private func addNewItem(_ sender: UIButton) {
        pushEffect(sender)
        addCategory()
    }
    
    //MARK: SwipeGestureRecognizer
    private func tapAction() {
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(self.tapOutsideView(recognizer:)))
        view.addGestureRecognizer(tapAction)
    }

   @objc private func tapOutsideView (recognizer: UITapGestureRecognizer? = nil) {
    let yTap = recognizer!.location(in: popUpView).y
        
        if yTap < 0 || yTap > 300 {
            moveOut()
        }
    }
    
    private func setConstraints() {
        
        view.addSubview(popUpView)
        popUpView.addSubview(titleLabel)
        popUpView.addSubview(categoryTextField)
        popUpView.addSubview(errorLabel)
        popUpView.addSubview(addButton)
        
        popUpView.easy.layout(CenterX(),CenterY(), Left(20), Right(20), Height(300))
        titleLabel.easy.layout(CenterX(), Top(10))
        categoryTextField.easy.layout(Top(10).to(titleLabel, .bottom), Height(40), Left(20), Right(20))
        errorLabel.easy.layout(Bottom(5).to(addButton, .top), CenterX(), Left(), Right(), Height(50))
        addButton.easy.layout(Bottom(10), CenterX(), Left(50), Right(50), Height(40))
    }
}

//MARK:- Setup Collection View

extension PopUpVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private func createCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        
        let frame = 98
        flowLayout.itemSize = CGSize.init(width: frame, height: frame)
        flowLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .infinite, collectionViewLayout: flowLayout)
        guard let collectionView = collectionView else {return}
        self.collectionView!.register(cellForCreateCat.self, forCellWithReuseIdentifier: cellForCreateCat.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 0.9888455243, green: 1, blue: 0.9262188061, alpha: 1)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.allowsMultipleSelection = false
        collectionView.scrollIndicatorInsets = .zero
        popUpView.addSubview(collectionView)
        collectionView.easy.layout(Bottom().to(errorLabel, .top), Left(), Right(), Top(10).to(categoryTextField, .bottom))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellForCreateCat.identifier, for: indexPath) as! cellForCreateCat
        cell.imageCategory.image = #imageLiteral(resourceName: "Hearts")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration:0.5 , animations: {
            cell.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
}


