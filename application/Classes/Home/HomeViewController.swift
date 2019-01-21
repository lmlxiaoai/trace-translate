//
//  CameraViewController.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/18.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = UIColor.white
        //self.title = "主页"
        
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "按钮", style: UIBarButtonItemStyle.plain, target: self, action: #selector(leftClick1))
        /*
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "Home_0"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(leftClick2))
        */
        
        let MapSearchBar = UISearchBar.init(frame: CGRect(x: 0, y: 20, width: 300, height: 26))
        MapSearchBar.placeholder = "搜索"
        MapSearchBar.barTintColor = UIColor.gray
        //MapSearchBar.backgroundColor = UIColor.gray
        let rightNavBarButton = UIBarButtonItem(customView:MapSearchBar)
        self.navigationItem.rightBarButtonItem = rightNavBarButton
        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "Message"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(leftClick2))
        
        let CameraButton = UIButton()
        self.view.addSubview(CameraButton)
        //CameraButton.frame = CGRect(x: 20, y: 19, width: 333, height: 161)
        CameraButton.backgroundColor = UIColor(red: 180.0 / 255.0, green: 229.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0)
        CameraButton.layer.cornerRadius = 8
        CameraButton.alpha = 1
        CameraButton.setTitle("识别", for: .normal)
        //CameraButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment(rawValue: 0)!
        CameraButton.setImage(UIImage(named:"camera"), for: .normal)
        // 上左下右 根据自己图片和文字布局自行调整参数设置
        CameraButton.imageEdgeInsets = UIEdgeInsets(top: 36, left: 138, bottom: 62, right: 127)
        CameraButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -46, bottom: -50, right: 10)
        CameraButton.snp.makeConstraints { (make) in
            // 距离父视图顶部
            make.top.equalTo(19)
            // 设置视图大小
            make.size.equalTo(CGSize(width: 334, height: 162))
            // x轴方向上居中
            make.centerX.equalToSuperview()
        }

        
        let WordButton = UIButton()
        self.view.addSubview(WordButton)
        //WordButton.frame = CGRect(x: 20, y: 194, width: 333, height: 161)
        WordButton.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        WordButton.layer.cornerRadius = 8
        WordButton.alpha = 1
        WordButton.setTitle("翻译", for: .normal)
        WordButton.setImage(UIImage(named:"camera"), for: .normal)
        WordButton.imageEdgeInsets = UIEdgeInsets(top: 36, left: 138, bottom: 62, right: 127)
        WordButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -46, bottom: -50, right: 10)
        WordButton.snp.makeConstraints { (make) in
            // 距离父视图顶部
            make.top.equalTo(200)
            // 设置视图大小
            make.size.equalTo(CGSize(width: 334, height: 162))
            // x轴方向上居中
            make.centerX.equalToSuperview()
        }
        
        
        let SightButton = UIButton()
        self.view.addSubview(SightButton)
        SightButton.frame = CGRect(x: 19, y: 382, width: 160, height: 156)
        SightButton.backgroundColor = UIColor(red: 224.0 / 255.0, green: 237.0 / 255.0, blue: 233.0 / 255.0, alpha: 1.0)
        SightButton.layer.cornerRadius = 8
        SightButton.alpha = 1
        SightButton.setTitle("景点概览", for: .normal)
        SightButton.setImage(UIImage(named: "sight"), for: .normal)
        
        
        let DiaryButton = UIButton()
        self.view.addSubview(DiaryButton)
        DiaryButton.frame = CGRect(x: 192, y: 382, width: 160, height: 156)
        DiaryButton.backgroundColor = UIColor(red: 224.0 / 255.0, green: 237.0 / 255.0, blue: 233.0 / 255.0, alpha: 1.0)
        DiaryButton.layer.cornerRadius = 8
        DiaryButton.alpha = 1
        DiaryButton.setImage(UIImage(named:"diary"), for: .normal)
        DiaryButton.setTitle("游记", for: .normal)
    
        

        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "按钮", style: UIBarButtonItemStyle.plain, target: self, action: #selector(leftClick1))
        
        
//        self.setupNavigationBar()
        CameraButton.addTarget(self, action: #selector(CameraButtonAction), for: .touchUpInside)
        WordButton.addTarget(self, action: #selector(WordButtonAction), for: .touchUpInside)
        SightButton.addTarget(self, action: #selector(SightButtonAction), for: .touchUpInside)
        DiaryButton.addTarget(self, action: #selector(DiaryButtonAction), for: .touchUpInside)
    }
    
    @objc private func leftClick2() {
        print("did click right")
        
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(MessageViewController(), animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    
    @objc func CameraButtonAction(){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(CameraViewController(), animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    @objc func WordButtonAction(){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(WordViewController(), animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    @objc func SightButtonAction(){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(SightViewController(), animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    @objc func DiaryButtonAction(){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(DiaryViewController(), animated: true)
        self.hidesBottomBarWhenPushed = false
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
