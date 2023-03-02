//
//  SceneDelegate.swift
//  Pre-Onboarding-HanHo
//
//  Created by 최한호 on 2023/03/01.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //Window  초기화
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        // ViewController 초기화
        let mainViewController = ViewController()
        
        // MARK: Window 구성
        window?.rootViewController = mainViewController
        // 화면에 띄울 Root 뷰 컨트롤러 지정
        
        window?.backgroundColor = .systemBackground
        // Window의 Background Color설정.
        // window 또는 ViewController의 backgroundColor중 하나는 설정되어야합니다.
        // 둘중 하나 미설정시 검은화면만 보입니다.
        
        window?.makeKeyAndVisible()
        // 구성된 창 띄우기
        // 이것도 미설정시 검은화면
        
        
        // 이 메소드를 사용하여 UIWindow `window`를 선택적으로 구성하고 제공된 UIWindowScene `scene`에 연결합니다.
        // 스토리보드를 사용하는 경우 `window` 속성이 자동으로 초기화되어 장면에 연결됩니다.
        // 이 델리게이트는 연결 장면이나 세션이 새롭다는 것을 의미하지 않습니다(대신 `application:configurationForConnectingSceneSession` 참조).
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

