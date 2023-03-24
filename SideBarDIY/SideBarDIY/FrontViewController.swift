//
//  FrontViewController.swift
//  SideBarDIY
//
//  Created by 정의찬 on 2023/03/24.
//

import UIKit

class FrontViewController: UIViewController {
    
    // 사이드 바 오픈 기능을 위임할 델리게이트
    
    var deligate: RevealViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 사이드 바 오픈용 버튼 정의
        
        let btnSideBar = UIBarButtonItem(image:UIImage(named: "sidemenu.png"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(moveSide))
        
        //버튼을 내비게이션 바의 왼쪽 영역에 추가
        self.navigationItem.leftBarButtonItem = btnSideBar

        
        // 제스처 정의
        let dragLeft = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(moveSide))
        dragLeft.edges = UIRectEdge.left // 시작 모서리는 왼쪽
        self.view.addGestureRecognizer(dragLeft) // 뷰에 제스터 등록
        
        // 닫기용 제스처
        let dragRight = UISwipeGestureRecognizer(target: self, action: #selector(moveSide))
        dragRight.direction = .left // 방향 왼쪽
        self.view.addGestureRecognizer(dragRight) // 뷰에 제스처 객체 등록
        
        // Do any additional setup after loading the view.
    }
    
    // 사용자의 액션에 따라 델리게이트 메소드를 호출한다.
    @objc func moveSide(_ sender: Any){
        
        if sender is UIScreenEdgePanGestureRecognizer{
            self.deligate?.openSideBar(nil)
        } else if sender is UISwipeGestureRecognizer{
            self.deligate?.closeideBar(nil)
        } else if sender is UIBarButtonItem{
            if self.deligate?.isSideBarShowing == false{
                self.deligate?.openSideBar(nil) // 사이드 바 오픈
            } else{
                self.deligate?.closeideBar(nil) // 사이드 바 닫는다.
            }
        }
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
