//
//  SightViewController.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/18.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import UIKit
import Foundation

class SightViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    var dataSource = [[String:String]()]
    var cityimg = CityView()
    var cityname : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView(frame:CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height-60), style: .grouped)
        tableView.backgroundColor = UIColor.white;
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableHeaderView = cityimg
        
        cityname = "成都"
        cityimg.city.text = cityname
        
        
        dataSource = [["name":"大熊猫繁育研究基地","score":"4.5","level":"国家AAAA级旅游景区","time":"07:30-18:00","price":"58元","address":"四川省北外熊猫大道1375号","icon":"sight"],["name":"大熊猫繁育研究基地","score":"4.5","level":"国家AAAA级旅游景区","time":"07:30-18:00","price":"58元","address":"四川省北外熊猫大道1375号","icon":"sight"],["name":"大熊猫繁育研究基地","score":"4.5","level":"国家AAAA级旅游景区","time":"07:30-18:00","price":"58元","address":"四川省北外熊猫大道1375号","icon":"sight"],["name":"大熊猫繁育研究基地","score":"4.5","level":"国家AAAA级旅游景区","time":"07:30-18:00","price":"58元","address":"四川省北外熊猫大道1375号","icon":"sight"],["name":"大熊猫繁育研究基地","score":"4.5","level":"国家AAAA级旅游景区","time":"07:30-18:00","price":"58元","address":"四川省北外熊猫大道1375号","icon":"sight"]]
        tableView.reloadData()
        
        tableView.showsVerticalScrollIndicator = true
        tableView.separatorStyle = .none
        
        //导航栏把返回键挤小了
        let MapSearchBar = UISearchBar.init(frame: CGRect(x: 0, y: 20, width: 300, height: 26))
        MapSearchBar.placeholder = "搜索"
        MapSearchBar.barTintColor = UIColor.gray
        let rightNavBarButton = UIBarButtonItem(customView:MapSearchBar)
        self.navigationItem.rightBarButtonItem = rightNavBarButton
        
    }
    //设置cell的个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    //初始化和复用指定索引位置的UITableViewCell，必须实现
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell:SightTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? SightTableViewCell
        if cell==nil {
            cell = SightTableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        let dict:Dictionary = dataSource[indexPath.row]
        cell?.iconImv.image = UIImage(named: dict["icon"]!)
        cell?.name.text = dict["name"]
        cell?.score.text = dict["score"]
        cell?.level.text = dict["level"]
        cell?.time.text = dict["time"]
        cell?.price.text = dict["price"]
        cell?.address.text = dict["address"]
        return cell!
    }
    
    // 设置cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 163
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 700
    }
    
    // 选中cell后执行此方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: false)
        self.navigationController?.pushViewController(SightViewController2(), animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
