//
//  PopUpVC.swift
//  Money check
//
//  Created by Roman on 28.09.2021.
//

import UIKit
import Foundation

class PopUpVC: UIViewController, UIGestureRecognizerDelegate {

    private var collectionView: UICollectionView?
    
    private var popUpView: UIView = {
       let popUp = UIView()
        popUp.translatesAutoresizingMaskIntoConstraints = false
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
        
        popUpView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        popUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popUpView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        popUpView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        titleLabel.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 10).isActive = true
        
        categoryTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        categoryTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        categoryTextField.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 20).isActive = true
        categoryTextField.rightAnchor.constraint(equalTo: popUpView.rightAnchor, constant: -20).isActive = true
        
        errorLabel.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -5).isActive = true
        errorLabel.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true
        errorLabel.rightAnchor.constraint(equalTo: popUpView.rightAnchor).isActive = true
        errorLabel.leftAnchor.constraint(equalTo: popUpView.leftAnchor).isActive = true
        errorLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addButton.bottomAnchor.constraint(equalTo: popUpView.bottomAnchor, constant: -10).isActive = true
        addButton.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 50).isActive = true
        addButton.rightAnchor.constraint(equalTo: popUpView.rightAnchor, constant: -50).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
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
        collectionView.register(СellForCreateCat.self, forCellWithReuseIdentifier: СellForCreateCat.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 0.9888455243, green: 1, blue: 0.9262188061, alpha: 1)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.allowsMultipleSelection = false
        collectionView.scrollIndicatorInsets = .zero
        popUpView.addSubview(collectionView)
        
        collectionView.bottomAnchor.constraint(equalTo: errorLabel.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: categoryTextField.bottomAnchor, constant: 10).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: СellForCreateCat.identifier, for: indexPath) as! СellForCreateCat
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


