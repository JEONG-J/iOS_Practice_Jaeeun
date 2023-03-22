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
        self.initTitileImage()
        self.initTitleInput()
    }
    
    func initTitleInput(){
        
        let back = UIImage(named: "arrow-back@2x")
        let leftItem = UIBarButtonItem(image: back, style: .plain, target: self, action: nil)
        
        self.navigationItem.leftBarButtonItem = leftItem
        
        let rv = UIView()
        rv.frame = CGRect(x: 0, y: 0, width: 70, height: 37)
        
        let rItem = UIBarButtonItem(customView: rv)
        self.navigationItem.rightBarButtonItem = rItem
        
        // 카운트 값 표시 레이블
        let cnt = UILabel()
        cnt.frame = CGRect(x: 10, y: 8, width: 20, height: 20)
        cnt.font = UIFont.boldSystemFont(ofSize: 10)
        cnt.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        cnt.text = "12"
        cnt.textAlignment = .center
        
        
        // 외곽선
        cnt.layer.cornerRadius = 3 // 모서리 둥글게
        cnt.layer.borderWidth = 2
        cnt.layer.borderColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0).cgColor
        
        
        // 레이블을 서브 뷰로 추가
        rv.addSubview(cnt)
        
        
        let more = UIButton(type: .system)
        more.frame = CGRect(x: 50, y: 10, width: 16, height: 16)
        more.setImage(UIImage(named: "more@2x"), for: .normal)
        
        rv.addSubview(more)
        
        
        let tf = UITextField()
        tf.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
        tf.backgroundColor = .white // 배경색상
        tf.font = UIFont.systemFont(ofSize: 13) // 립력할 글씨 크기 13
        tf.autocapitalizationType = .none // 자동 대문자 변환 끄기
        tf.autocorrectionType = .no // 자동 입력 기능 해제
        tf.spellCheckingType = .no // 스펠링 체크 기ㅡㄴㅇ 해제
        tf.keyboardType = .URL // url 입력 전용 키보드
        tf.keyboardAppearance = .dark
        tf.layer.borderWidth = 0.3 // 테두리 경계선 두께
        tf.layer.borderColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0).cgColor
        
        self.navigationItem.titleView = tf
    }
  
        
    func initTitileImage(){
        let image = UIImage(named: "swift_logo@3x")
        let imageV = UIImageView(image: image)
        
        self.navigationItem.titleView = imageV
    }
    
    
   
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

