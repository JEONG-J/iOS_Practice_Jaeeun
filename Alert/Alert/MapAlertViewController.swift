//
//  MapAlertViewController.swift
//  Alert
//
//  Created by 정의찬 on 2023/03/22.
//

import UIKit
import MapKit


class MapAlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이미지 알림창 버튼
        let imageBtn = UIButton(type: .system)
        
        // 이미지 알림창 버트 속성 설정
        imageBtn.frame = CGRect(x: 0, y: 200, width: 100, height: 30)
        imageBtn.center.x = self.view.frame.width / 2
        imageBtn.setTitle("Image Alter", for: .normal)
        imageBtn.addTarget(self, action: #selector(imageAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(imageBtn)

        // 버튼 생성
        let alterBtn = UIButton(type: .system)
        
        // 버튼 속성 설정
        alterBtn.frame = CGRect(x: 0, y: 150, width: 100, height: 30)
        alterBtn.center.x = self.view.frame.width / 2
        alterBtn.setTitle("Map Alter", for: .normal)
        alterBtn.addTarget(self, action: #selector(mapAlter(_:)), for: .touchUpInside)
        
        self.view.addSubview(alterBtn)
        
    }
    
    @objc func imageAlert(_ sender: Any){
        let alert = UIAlertController(title: nil, message: "평점", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okAction)
        
        // 컨텐츠 뷰에 들어갈 뷰 컨트롤러 생성하고, 알림창에 등록
        let contenVC = ImageViewController()
        alert.setValue(contenVC, forKeyPath: "contentViewController")
        
        self.present(alert, animated: false)
    }
    
    @objc func mapAlter(_ sender: UIButton){
        let alter = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        let okAction = UIAlertAction(title: "ok", style: .default)
        
        alter.addAction(cancelAction)
        alter.addAction(okAction)
        
        let contentVC = MapKitController()
        
        alter.setValue(contentVC, forKeyPath: "contentViewController")
        
       
        self.present(alter, animated: false)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
