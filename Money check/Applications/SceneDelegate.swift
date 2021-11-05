//
//  SceneDelegate.swift
//  Money check
//
//  Created by Roman on 01.08.2021.
//

import UIKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        UINavigationBar.appearance().tintColor = .black

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        window?.rootViewController = IntroductionView(collectionViewLayout: layout)
        //window?.rootViewController = AdditingNewCellVC()
        window?.makeKeyAndVisible()
        //window?.overrideUserInterfaceStyle = .light
    }

}
       
