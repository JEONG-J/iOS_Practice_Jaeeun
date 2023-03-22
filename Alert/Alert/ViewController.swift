//
//  ViewController.swift
//  Alert
//
//  Created by 정의찬 on 2023/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 기본 알림창 버튼
        let defaultAlterBtn = UIButton(type:  .system)
        defaultAlterBtn.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        defaultAlterBtn.center.x = self.view.frame.width / 2
        defaultAlterBtn.setTitle("기본 알림창", for: .normal)
        defaultAlterBtn.addTarget(self, action: #selector(defaultAlter(_:)), for: .touchUpInside)
        
        self.view.addSubview(defaultAlterBtn)
    }
    
    @objc func defaultAlter(_ sender: Any){
        
        
        
        // 알림창 정의
        let alter = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        // 버튼 정의
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        let v = UIViewController()
        v.view.backgroundColor = .red
        
        // 버튼을 알림창에 추가한다
        alter.addAction(cancelAction)
        alter.addAction(okAction)
        alter.setValue(v, forKey: "contentViewController")
        
        self.present(alter, animated: false)
        
        
    }


}

