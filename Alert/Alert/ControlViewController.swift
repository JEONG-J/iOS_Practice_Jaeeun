//
//  ControlViewController.swift
//  Alert
//
//  Created by 정의찬 on 2023/03/24.
//

import UIKit

class ControlViewController: UIViewController {
    
    // 슬라이더 객체 정의
    let slider = UISlider()
    // 슬라이더 객체의 갑슬 읽어올 연산 프로퍼티
    var sliderValue: Float{
        return self.slider.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slider.minimumValue = 0
        self.slider .maximumValue = 100
        
        self.slider.frame = CGRect(x: 0, y: 0, width: 170, height: 30)
        self.view.addSubview(self.slider)
        
        // 뷰 컨트롤러의 콘텐츠 사이즈를 지정한다.
        self.preferredContentSize = CGSize(width: self.slider.frame.width, height: self.slider.frame.height)
        
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
