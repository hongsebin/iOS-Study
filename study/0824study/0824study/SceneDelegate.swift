//
//  SceneDelegate.swift
//  0824study
//
//  Created by yeoboya3 on 2023/08/24.
//  ios 13이상부터 appdelegate의 역활을 넘겨주었음. 어떤 화면을 보여줄지 관리하는 역활

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    //  willconnectto : 앱 실행시 scenedelegate에서 가장 먼저 실행되는 메서드
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    //  포그라운드에서 백그라운드 상태로 갔을때. 앱이 완전히 종료되진않았지만 백그라운드 상태로만 간.
    //  uiscene이 백그라운드 상태로 들어갔을때 이 메소드에서 감지를 하는.
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    //  백그라운드에서 다시 포그라운드 상태로.
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    //  사용 중 전화가 걸려왔을 때. 방해요소
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    // 푸시 / 딥링크를 타고 들어오는 경우. 푸시 알림을 누르면 해당 앱으로 들어가지는 것
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    // 포그라운드에서 백그라운드로.
    // 데이터를 저장하거나 레소스를 공유하거나 특별한 정보를 저장할때 이 메소드를 사용
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

