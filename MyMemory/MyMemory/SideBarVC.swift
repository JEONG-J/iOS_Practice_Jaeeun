//
//  SideBarVC.swift
//  MyMemory
//
//  Created by 정의찬 on 2023/03/24.
//

import UIKit

class SideBarVC: UITableViewController {
    
    let titles = ["새글 작성", "친구 새글", "달력", "공지사항", "통계", "계정 관리"]
    
    //아이콘 데이터 배열
    let icons = [
    UIImage(named: "icon01.png"),
    UIImage(named: "icon02.png"),
    UIImage(named: "icon03.png"),
    UIImage(named: "icon04.png"),
    UIImage(named: "icon05.png"),
    UIImage(named: "icon06.png")]
    
    
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let profileImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블 뷰의 헤더 역할을 할 뷰를 정한다
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
        
        headerView.backgroundColor = .brown
        
        // 테이블 뷰의 헤더 뷰로 지정한다
        self.tableView.tableHeaderView = headerView
        
        self.nameLabel.frame = CGRect(x: 70, y: 15, width: 100, height: 30)
        self.nameLabel.text = "jj"
        self.nameLabel.textColor = .white
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        self.nameLabel.backgroundColor = .clear // 배경색상
        
        headerView.addSubview(self.nameLabel) //헤더 뷰에 추가한다.
        
        self.emailLabel.frame = CGRect(x: 70, y: 30, width: 100, height: 30)
        self.emailLabel.text = "ssw@naver.con"
        self.emailLabel.textColor = .white
        self.emailLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.emailLabel.backgroundColor = .clear
        
        headerView.addSubview(emailLabel)
        
        let defaultProfile = UIImage(named: "account@2x.jpg")
        self.profileImage.image = defaultProfile // 이미지등록
        self.profileImage.frame = CGRect(x: 10, y: 10, width: 50, height: 50) // 위치와 크기를 정의
        
        // 이미지 둥글게
        self.profileImage.layer.cornerRadius = (self.profileImage.frame.width / 2)
        self.profileImage.layer.borderWidth = 0 // 두께 0
        self.profileImage.layer.masksToBounds = true
        
        view.addSubview(profileImage)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.titles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "menucell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id)
        
        // 타이틀과 이미지 대입
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]
        
        cell.textLabel?.font = UIFont.systemFont(ofSize:14)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 { // 선택된 행이새글 작성 메뉴일 때
            let uv = self.storyboard?.instantiateViewController(withIdentifier: "MemoForm")
            let target = self.revealViewController().frontViewController as! UINavigationController
            target.pushViewController(uv!, animated: true)
            self.revealViewController().revealToggle(self)
        } else if indexPath.row == 5 { // 계정 관리
            let uv = self.storyboard?.instantiateViewController(withIdentifier: "_Profile")
            uv?.modalPresentationStyle = .fullScreen
            self.present(uv!, animated: true){
                self.revealViewController().revealToggle(self)
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
