//
//  UICollectionView.swift
//  Money check
//
//  Created by Roman on 28.09.2021.
import UIKit
import EasyPeasy
import Lottie

extension UIViewController {
    
    //MARK: Appearing view animation
    
    func moveIn() {
        self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
        self.view.alpha = 0.0
        
        UIView.animate(withDuration: 0.24) {
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.view.alpha = 1.0
        }
    }
    //MARK: Desappearing view animation

    func moveOut() {
        UIView.animate(withDuration: 0.24, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
            self.view.alpha = 0.0
        }) { _ in
            self.view.removeFromSuperview()
        }
    }
    
    // separate numbers by 3 like 1 000 000
    
    func separatedNumber(_ number: Any) -> String {
        guard let itIsANumber = number as? NSNumber else { return "Not a number" }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = ","
        return formatter.string(from: itIsANumber)!
    }
    
    
    //imageViewFunc
    func shortImageName(name: String) -> UIImage{
        let image = UIImage(named: name)
        return  image!
    }
    
    
    //MARK:- animation for button
    func pushEffect(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(0.5),
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: {
                        sender.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
                       }) { (_) in
            UIView.animate(withDuration: 0.15,
                           delay: 0,
                           usingSpringWithDamping: 0.4,
                           initialSpringVelocity: 2,
                           options: .curveEaseIn,
                           animations: {
                            sender.transform = CGAffineTransform(scaleX: 1, y: 1)
                           }, completion: nil)
        }
    }
    
    //MARK:- animation f
    func animateTableView(tableView: UITableView) {
        tableView.reloadData()
        
        let lastCell = tableView.visibleCells.last
        let tableViewWidth = tableView.bounds.width
        
        lastCell?.transform = CGAffineTransform(translationX: tableViewWidth, y: 0)
        UIView.animate(withDuration: 1.5,
                       delay: 1,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveLinear,
                       animations: {
                        lastCell?.transform = CGAffineTransform.identity
                       })
    }
    
    
    
    
    func animateEmptyData() -> UIView {
        let animationView = AnimationView()
        let viewBG = UIView()
        let label = UILabel(text: "No Transaction Yet!", font: .avenirNextDemiBold20(), alignment: .center)
        let bottomLabel = UILabel(text: "Add a transaction ", font: .avenirNextDemiBold20(), alignment: .center) // and it will show up here
        let animation = Animation.named("empty-face")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.loopMode = .loop
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        viewBG.addSubview(animationView)
        viewBG.addSubview(label)
        viewBG.addSubview(bottomLabel)
        animationView.easy.layout(Width().like(viewBG), Height().like(viewBG), Center())
        label.easy.layout(CenterX(), Top(20))
        bottomLabel.easy.layout(Bottom().to(viewBG), CenterX(), Width().like(viewBG, .width))
        viewBG.easy.layout(Height(400), Width(400), CenterY(0), CenterX(0))
    
        return viewBG
    }
    
    func dateFormatter(path: Date, format: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .full
        dateFormatter.dateFormat = format
        let pickerDateString = dateFormatter.string(from: path)
        let dateString = " \(pickerDateString)"
        
        // make sure the following are the same as that used in the API
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale.current
        
        return dateString
    }
}
