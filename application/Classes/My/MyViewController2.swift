//
//  MyViewController2.swift
//  application
//
//  Created by lmlxiaoai on 2019/2/19.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit

class MyViewController: BaseViewController, UITableViewDataSource,UITableViewDelegate {
    

    
    let Scrollview = UIScrollView()
    var scroll:UIScrollView!
    var username: String?
    
    //所有消费记录
    var consumptions:[Consumption]?
    
    //使用时间轴形式的表格
    var tableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        username = "初学者"
        
        self.navigationController?.navigationBar.tintColor = UIColor.purple
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "Setting"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(SettingClick))
        
        let myView = MyView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: UIScreen.main.bounds.height * 3 / 4))
        self.view.addSubview(myView)
        myView.MyName.text = username
        
        consumptions = [
            Consumption(title:"充了手机话费", cost:"2月22日", datetime:"2016.10.10 12:10",
                        appendix:""),
            Consumption(title:"超市购物", cost:"2月22日", datetime:"2016.10.11 12:10",
                        appendix:"买了台豆浆机，一袋大米，一桶油，两斤苹果，一包饼干，两只牙刷。"),
            Consumption(title:"同事结婚随礼", cost:"2月22日", datetime:"2016.10.11 17:10",
                        appendix:""),
            Consumption(title:"办健身卡", cost:"2月22日", datetime:"2016.10.15 11:00",
                        appendix:"有效期至2016年10月")]
        
        //创建表视图
        self.tableView = UITableView(frame: self.view.frame, style:UITableView.Style.plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(TimeLineCell.self,
                                 forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
        self.tableView?.tableHeaderView = myView
        
        //让单元格自适应
        tableView!.rowHeight = UITableView.automaticDimension
        tableView!.estimatedRowHeight = 120
        tableView!.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView!.tableFooterView = UIView()
        
        
        myView.MyIcon.addTarget(self, action: #selector(MyIconAction), for: .touchUpInside)
        myView.MyLikeButton.addTarget(self, action: #selector(MyLikeButtonAction), for: .touchUpInside)
        myView.MyStorageButton.addTarget(self, action: #selector(MyStorageButtonAction), for: .touchUpInside)
        myView.MyFriendButton.addTarget(self, action: #selector(MyFriendButtonAction), for: .touchUpInside)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.consumptions!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "SwiftCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            as? TimeLineCell
        if cell == nil{
            cell = TimeLineCell(style: .default, reuseIdentifier: identifier)
            cell?.selectionStyle = .none
        }
        
        //获取记录
        let consumption = self.consumptions![indexPath.row]
        //设置时间轴上的图标
        //cell!.timeLineIcon.image = UIImage(named: "money")
        //设置消费金额
        cell!.costLabel.text = consumption.cost
        //设置消费时间
        cell?.dateTimeLabel.text = consumption.datetime
        //设置消费内容
        cell?.titleLabel.text = consumption.title
        //设置备注信息
        cell?.appendixLabel.text = consumption.appendix
        //设置是否有备注（自动更新备注标签容器相关约束）
        cell?.hasAppendix = (cell?.appendixLabel.text != "")
        return cell!
    }
    
    @objc func MyIconAction(){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(MyIconViewController(), animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    @objc func MyLikeButtonAction(){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(MyLikeViewController(), animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    @objc func MyStorageButtonAction(){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(MyStorageViewController(), animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    @objc func MyFriendButtonAction(){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(MyFriendViewController(), animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func SettingClick(){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(SettingViewController(), animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    
    struct Consumption {
        var title:String //消费条目
        var cost:String //费用
        var datetime:String //时间
        var appendix:String //备注
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
