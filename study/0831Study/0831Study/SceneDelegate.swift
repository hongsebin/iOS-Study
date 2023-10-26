//
//  SceneDelegate.swift
//  0831Study
//
//  Created by yeoboya3 on 2023/08/31.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // 해당 스토리보드 및 ViewController 생성
        let tabBarVC = UITabBarController()
        tabBarVC.view.backgroundColor = .white

        
        let storyboard1 = UIStoryboard(name: "FirstViewController", bundle: nil)
        guard let vc1  = storyboard1.instantiateViewController(withIdentifier: "FirstViewController") as?
                FirstViewController else { return }
        
        let storyboard2 = UIStoryboard(name: "SecondViewController", bundle: nil)
        guard let vc2  = storyboard2.instantiateViewController(withIdentifier: "SecondViewController") as?
                SecondViewController else { return }
        
        let storyboard3 = UIStoryboard(name: "ThirdViewController", bundle: nil)
        guard let vc3  = storyboard3.instantiateViewController(withIdentifier: "ThirdViewController") as?
                ThirdViewController else { return }
        
        // 현재 윈도우의 루트뷰를 Tab Bar Controller로 지정
        self.window?.rootViewController = tabBarVC
        
        tabBarVC.setViewControllers([vc1, vc2, vc3], animated: false)
        vc1.tabBarItem = UITabBarItem(title: "firstVC", image: UIImage(systemName: "house"), tag: 0)
        vc2.tabBarItem = UITabBarItem(title: "secondVC", image: UIImage(systemName: "folder"), tag: 1)
        vc3.tabBarItem = UITabBarItem(title: "thirdVC", image: UIImage(systemName: "gear"), tag: 2)
        
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

