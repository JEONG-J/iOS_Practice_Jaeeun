//
//  ViewController.swift
//  customButton
//
//  Created by 정의찬 on 2023/03/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 버튼 객체 생성하고, 속성을 설정한다.
        
        let btn = UIButton(type: .system) // 1
        btn.frame = CGRect( x: 50, y: 100, width: 150, height: 30)
        btn.setTitle("TestBtn", for: .normal) // 3
        
        btn.center = CGPoint(x: self.view.frame.size.width / 2, y: 100)
        
       // 루트 뷰에 버튼을 추가한다.(화면에 보이게 됨)
        self.view.addSubview(btn)
        
        btn.addTarget(self, action: #selector(btnOnclick(_:)), for: .touchUpInside)
    }
    
    @objc func btnOnclick(_ sender: Any){
        // 호출한 객체가 버튼이라면
        if let btn = sender as? UIButton{
            btn.setTitle("click", for: .normal)
        }
    }


}

