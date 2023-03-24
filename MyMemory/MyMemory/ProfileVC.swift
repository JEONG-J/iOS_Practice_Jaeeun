//
//  ProfileVC.swift
//  MyMemory
//
//  Created by 정의찬 on 2023/03/24.
//

import UIKit

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.accessoryType = .disclosureIndicator
        
        switch indexPath.row{
        case 0:
            cell.textLabel?.text = "name"
            cell.detailTextLabel?.text = "jj"
        case 1:
            cell.textLabel?.text = "account"
            cell.detailTextLabel?.text = "aan@naver.com"
        default:
            ()
        }
        return cell
    }
    
    let profileImage = UIImageView() // 프로필 사진 이미지
    let tv = UITableView() // 프로필 목록

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "프로필"
        let backBtn = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(close(_:)))
        self.navigationItem.leftBarButtonItem = backBtn
        
        let bg = UIImage(named: "profile-bg")
        let bgImg = UIImageView(image: bg)
        
        bgImg.frame.size = CGSize(width: bgImg.frame.size.width, height: bgImg.frame.size.height)
        bgImg.center = CGPoint(x: self.view.frame.width / 2, y: 40)
        
        bgImg.layer.cornerRadius = bgImg.frame.size.width / 2
        bgImg.layer.borderWidth = 0
        bgImg.layer.masksToBounds = true
        self.view.addSubview(bgImg)
        
        self.view.bringSubviewToFront(self.tv)
        self.view.bringSubviewToFront(self.profileImage)
        
        //ㅊ
        // Do any additional setup after loading the view.
        
        let image = UIImage(named: "account@2x.jpg")
        
        // 프로필 이미지 처리
        self.profileImage.image = image
        self.profileImage.frame.size = CGSize(width: 100, height: 100)
        self.profileImage.center = CGPoint(x: self.view.frame.width / 2, y:270)
        
        // 프로필 이미지 둥글게 처리
        self.profileImage.layer.cornerRadius = self.profileImage.frame.width / 2
        self.profileImage.layer.borderWidth = 0
        self.profileImage.layer.masksToBounds = true
        
        // 루트 뷰에 묶기
        self.view.addSubview(profileImage)
        
        self.tv.frame = CGRect(x: 0, y: self.profileImage.frame.origin.y + self.profileImage.frame.size.height + 20, width: self.view.frame.width, height: 100)
        self.tv.dataSource = self
        self.tv.delegate = self
        
        self.view.addSubview(self.tv)
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    @objc func close(_ sender: Any){
        self.presentingViewController?.dismiss(animated: true)
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
