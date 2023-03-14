//
//  ViewController.swift
//  TabBar
//
//  Created by 정의찬 on 2023/03/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        
        title.text = "fist tab"
        title.textColor = .red
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 14)
        
        title.sizeToFit()
        title.center.x = self.view.frame.width / 2
        
        self.view.addSubview(title)
    
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = self.tabBarController?.tabBar
      //  tabBar?.isHidden = (tabBar?.isHidden == true) ? false : true
      
        UIView.animate(withDuration: TimeInterval(0.15)){
            // alph 값이 0이면 1로, 1이면 0으로 바꾸어 준다.
            // 호출을 할때마다 점점 투명해졌다가 점점 진해질 것이다.
            tabBar?.alpha = (tabBar?.alpha == 0 ? 1 : 0)
        }
    }


}

