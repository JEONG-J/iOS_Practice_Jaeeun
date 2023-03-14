//
//  ViewController.swift
//  NavigationBar
//
//  Created by 정의찬 on 2023/03/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       self.initTitile()
       // self.inTitle()
    }
  /*
    func inTitle(){
        let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        nTitle.numberOfLines = 2
        nTitle.textAlignment = .center
        nTitle.font = UIFont.systemFont(ofSize: 15)
        nTitle.text = "59개 숙소 \n 1박(1월 10일 ~ 1월 11일)"
        
        self.navigationItem.titleView = nTitle
    }*/
   
    func initTitile(){
        
        // 복합적인 레이아웃을 구현할 컨테이너 뷰
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
        
        // 상단 레이블 정의
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = UIFont.systemFont(ofSize: 15)
        topTitle.textColor = .white
        topTitle.text = "58개 숙소"
        
        // 하단 레이블 정의
        let subTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        
        // 속성 설정
        subTitle.numberOfLines = 1 // 두줄까지 설정
        subTitle.textAlignment = .center
        subTitle.font = UIFont.systemFont(ofSize: 12)
        subTitle.textColor = .white
        subTitle.text = "1박(1월 10일 ~ 1월 11일)"
        
        // 상하단의 레이블을 컨테이너 뷰에 추가한다
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        
        // 내비게이션 타이틀을 컨테이너 뷰에 대입
        self.navigationItem.titleView = containerView
        
        // 추가된 구문) 배경 색상 설정
        
        let collor = UIColor(red: 0.86, green: 0.24, blue: 0.00, alpha: 1.00)
        self.navigationController?.navigationBar.backgroundColor = collor
    }
    
    }

