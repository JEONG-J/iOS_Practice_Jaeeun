//
//  SceneDelegate.swift
//  TabBar
//
//  Created by 정의찬 on 2023/03/14.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        
        // 루트 뷰 컨트롤러를 UITabBarController로 캐스팅
        if let tbC = self.window?.rootViewController as? UITabBarController{
            // 탭 바에서 탭 바 아이템 배열을 가진다
            if let tbItems = tbC.tabBar.items{
                //탭 바 아이템에 커스텀 이미지를 등록한다.
                tbItems[0].image = UIImage(named: "designbump@2x")?.withRenderingMode(.alwaysOriginal)
                tbItems[1].image = UIImage(named: "rss@2x")?.withRenderingMode(.alwaysOriginal)
                tbItems[2].image = UIImage(named: "facebook@2x")?.withRenderingMode(.alwaysOriginal)
                // 탭 바 아이템 타이틀 설정
                tbItems[0].title = "calendar"
                tbItems[1].title = "file"
                tbItems[2].title = "photo"
                
                let tbProxy = UITabBar.appearance()
                tbProxy.tintColor = UIColor.white
                tbProxy.backgroundImage = UIImage(named: "menubar-bg-mini")
                
                for tbItem in tbItems {
                    let image = UIImage(named: "checkmark@2x")?.withRenderingMode(.alwaysOriginal)
                    tbItem.selectedImage = image
                }
                
                    // 외향 프록시 객체를 이용하여 아이템의 타이틀 색상과 폰트 설정
                let tbItemProxy = UITabBarItem.appearance()
                    // 탭 바 아이템별 텍스트 색상 속성 설정
                    tbItemProxy.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .disabled)
                    tbItemProxy.setTitleTextAttributes([.foregroundColor: UIColor.red], for: .selected)
                    
                    // 전테 아이템의 폰트 크기 설정
                    tbItemProxy.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 15)], for: .normal)
               
                
                // 탭 바 아이템 이미지 색상
              //  tbC.tabBar.tintColor = .orange // 선택된 탭 바 아이템 색상 변경
              //  tbC.tabBar.unselectedItemTintColor = .gray // 선택되지 않은 나머지 탭 바 아이템의 색상
                
              //  let img = UIImage(named: "menubar-bg-mini")!
              //  tbC.tabBar.barTintColor = UIColor(patternImage: img)
                
                
            }
           
            
        }
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

