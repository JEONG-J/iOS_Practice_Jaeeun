//
//  CSTabBarController.swift
//  CSTabBar
//
//  Created by 정의찬 on 2023/03/24.
//

import UIKit

class CSTabBarController: UITabBarController {
    
    let csView = UIView()
    let tabItem01 = UIButton(type: .system)
    let tabItem02 = UIButton(type: .system)
    let tabItem03 = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 처음에 첫 번째 태비 선택되어 있도록 초기 상태를 정의
        self.onTabBarItemClick(self.tabItem01)
        
        // 기존 탭 바 숨긴다
        self.tabBar.isHidden = true
        
        // 새로운 탭 바 역할을 할 뷰를 위해 기준 좌표와 크기를 정의한다
        let width = self.view.frame.width
        let height:CGFloat = 50
        let x:CGFloat = 0
        let y = self.view.frame.height - height
        
        // 정의된 값을 이용하여 새로운 뷰의 속성을 설정한다
        self.csView.frame = CGRect(x: x, y: y, width: width, height: height)
        self.csView.backgroundColor = UIColor.brown
        
        self.view.addSubview(self.csView)
        
        // 버튼의 너비와 높이를 설정한다
        let tabBtnWidth = self.csView.frame.size.width / 3
        let tabBtnHeight = self.csView.frame.height
        
        // 버튼의 영역 설정
        self.tabItem01.frame = CGRect(x: 0, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem02.frame = CGRect(x: tabBtnWidth, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem03.frame = CGRect(x: tabBtnWidth*2, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        
        self .addTabBarBtn(btn: self.tabItem01, title: "first", tag: 0)
        self .addTabBarBtn(btn: self.tabItem02, title: "second", tag: 1)
        self .addTabBarBtn(btn: self.tabItem03, title: "third", tag: 2)
        
        
    }
        // 버튼의 공통 속성 정의
    func addTabBarBtn(btn: UIButton, title:String, tag:Int){
        // 버튼의 타이틀과 태그값 입력
        btn.setTitle(title, for: .normal)
        btn.tag = tag
        
        // 버튼의 텍스트  크상을 일반 상태와 선택된 상태로 나누어 설정
        btn.setTitleColor(UIColor.white, for: .normal) // 일반 상태
        btn.setTitleColor(UIColor.yellow, for: .selected) // 선택 상태
        
        // 버튼에 액션 메소드 연결
        btn.addTarget(self, action: #selector(onTabBarItemClick(_:)), for: .touchUpInside)
        
        self.csView.addSubview(btn)
    }
    
    @objc func onTabBarItemClick(_ sender: UIButton){
        // 모든 버튼 선택되지 않은 상태로 초기화
        self.tabItem01.isSelected = false
        self.tabItem02.isSelected = false
        self.tabItem03.isSelected = false
        
        // 인자갑으로 입력된 버튼만 선택된 상태로 변경
        sender.isSelected = true
        
        // 버튼에 설정된 태그값 입력했을 떄 화면 전환
        self.selectedIndex = sender.tag
        
    }
    

}
