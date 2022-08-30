//
//  AddittingNewCellVC.swift
//  Money check
//
//  Created by Roman on 01.08.2021.
//

import UIKit
import EasyPeasy
import CoreData
import RealmSwift

class AddingNewCellVC: UIViewController {
    
    private let realm = try! Realm()
    let confirmBtn = UIButton(color: .orangeColor, name: "Save")
    let constants = Constants()
    let editStyle = false
    
    let textInputTitle = UITextField(placeholder: "Enter your title")
    let textInputAmount = UITextField(placeholder: "Enter your value")
    let textWithPicker = UITextField(placeholder: "Enter smthng")
    
    private let main = MainVC()
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "plus_icon").withTintColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        image.layer.borderWidth = 2
        image.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        image.layer.cornerRadius = 10
        return image
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let generalView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        confirmBtn.addTarget(self, action: #selector(saveHandle(_:)) , for: .touchUpInside)
        registerKeyboardNotification()
        
        textInputTitle.delegate = self
        textInputAmount.delegate = self
        textWithPicker.delegate = self
    }
    
    deinit {
        removeKeyboardNotification()
    }
    
    private func setupUI() {
        
        view.backgroundColor = UIColor(named: "bgColor")
        let imageForCat = UIButton()
        imageForCat.setImage(UIImage(systemName: "plus")!, for: .normal)
        imageForCat.tintColor = .black
        imageForCat.addTarget(self, action: #selector(addCategory), for: .touchUpInside)
        
        let stack2 = UIStackView(arrangedSubviews: [textWithPicker, imageForCat], axis: .horizontal, spacing: 10, distribution: .fillProportionally)
        let stack = UIStackView(arrangedSubviews: [constants.label(text: "Title"),
                                                   textInputTitle,
                                                   constants.label(text: "Amount"),
                                                   textInputAmount,
                                                   constants.label(text: "Date"),
                                                   constants.dateView,
                                                   constants.label(text: "Type"),
                                                   constants.typePick,
                                                   constants.label(text: "Category"),
                                                   stack2
        ],
        axis: .vertical,
        spacing: 0,
        distribution: .equalSpacing)
        stack.alignment = .leading
        view.addSubview(scrollView)
        scrollView.addSubview(generalView)
        generalView.addSubview(stack)
        generalView.addSubview(confirmBtn)
        generalView.addSubview(imageView)
        
        scrollView.easy.layout(Left(),Right(),Top(),Bottom().to(view.safeAreaLayoutGuide, .bottom))
        generalView.easy.layout(CenterX(),CenterY(),Height().like(scrollView, .height), Width().like(scrollView, .width), Bottom(10).to(scrollView, .bottom))
        imageView.easy.layout(Right(10), Bottom(10).to(confirmBtn, .top), Left(10).to(stack2, .right), Height().like(imageView, .width))
        
        stack.easy.layout(Top(20).to(view.safeAreaLayoutGuide, .top),Bottom(20).to(confirmBtn, .top),Left(20),Right())
        confirmBtn.easy.layout(Left(20), Right(20),Bottom(100).to(generalView, .bottom),Height(50))
        
    }
    
    @objc private func addCategory() {
        let categories = CategoriesCollectionView()
        categories.delegateCategory = self
        navigationController?.pushViewController(categories, animated: true)
    }
    
    @objc private func saveHandle(_ sender: UIButton) {
        
        guard let titleTextField = textInputTitle.text else {return}
        guard let amountTextField = textInputAmount.text else {return}
        
        if titleTextField.isEmpty || amountTextField.isEmpty {
            showError(title: "Empty Text Field", message: "You have not entered a text!")
            return
        }
        
        guard (Double(amountTextField) != nil) else {
            showError(title: "Uncorrect value", message: "Enter valid number")
            return
        }
        
//        print(imageView.image?.accessibilityHint!)
//        guard let imageText = imageView.image?.accessibilityIdentifier else {return }
        
        let cellInfo = CellItems(titleLabel: titleTextField,
                                 category: textWithPicker.text!,
                                 categoryImage: imageView.description,
                                 date: constants.dateView.date,
                                 value: Float(amountTextField)!,
                                 type: Int32(constants.typePick.selectedSegmentIndex))
        RealmManager.shared.saveCellModel(model: cellInfo)
        
        reloadInputViews()
        pushEffect(sender)
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func editingModel(cellModel: CellItems) {
        navigationController?.pushViewController(main, animated: true)
    }
    
    private func showError(title:String, message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension AddingNewCellVC: Category {
    func selectedCategory(categoryName: String, categoryImage: UIImage) {
        textWithPicker.text = categoryName
        imageView.image = categoryImage
    }
}
