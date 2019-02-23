//
//  DiaryViewController1.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/21.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit

class DiaryViewController1: BaseViewController,UITableViewDataSource,UITableViewDelegate  {
    
    var dataSource = [[String:String]()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        self.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        let tableView = UITableView(frame:CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height - 90), style: .grouped)
        tableView.backgroundColor = UIColor.white;
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
       
    
        dataSource = [["title":"打卡成都那些不可错过的美食与风景","image":"Image-1"],["title":"打卡成都那些不可错过的美食与风景","image":"Image-1"],["title":"打卡成都那些不可错过的美食与风景","image":"Image-1"],["title":"打卡成都那些不可错过的美食与风景","image":"Image-1"]]
 
        tableView.reloadData()
        
        tableView.showsVerticalScrollIndicator = true
        tableView.separatorStyle = .none
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellid = "testCellID"
        var cell:DiaryTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? DiaryTableViewCell
        if cell==nil {
            cell = DiaryTableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        let dict:Dictionary = dataSource[indexPath.row]
        
        cell?.BackImage.image = UIImage(named: dict["image"]!)
        cell?.Title.text = dict["title"]
        
 
        return cell!
    }
    
    // 设置cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 163
    }

    
    // 选中cell后执行此方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: false)
        self.navigationController?.pushViewController(DiaryDetailViewController(), animated: true)
        
    }
    
}
