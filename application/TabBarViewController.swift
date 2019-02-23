//
//  TabBarViewController.swift
//  NewsTabbar
//
//  Created by jiayuqiang on 2018/8/9.
//  Copyright © 2018年 jiayuqiang. All rights reserved.
//

import UIKit
import SnapKit

class TabBarViewController: UITabBarController {
    
    /**/
    
    var _backView:UIView? = nil
    var items:NSArray = []
    
    /*
    let NameArr = ["首页","我的"]
    let PicArr = ["main","grid","cart","me"]
    let PicSelectArr = ["main_blue","grid_blue","cart_blue","me_blue"]
    let VCArr = [FirstViewController(),FourViewController()]
 
    //初始化数组
    var NavVCArr:[NSObject] = [NSObject]()
    */
    var nav:UINavigationController = UINavigationController()
    var publishview = UIView()
    var ispublishview = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.CreatTabBar()
        
        let singTap = UITapGestureRecognizer(target: self, action:#selector(handleSingleTapGesture))
        
        publishview.isUserInteractionEnabled = true
        //let publishbutton = PublishButtonView()
        //publishview.addSubview(publishbutton)
        //singTap.numberOfTapsRequired = 1
        publishview.addGestureRecognizer(singTap)
        publishview = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
        publishview.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        publishview.alpha = 0.5
        
    }
    
    //创建tabBar
    func CreatTabBar()  {
        
        //_backView = UIView(frame:CGRect(x:0,y:0,width:self.view.frame.size.width,height:49))
        
        
        let  MainVC  = HomeViewController()
        //MainVC.title = "首页"
        let MainNav = UINavigationController(rootViewController:MainVC)
        MainNav.tabBarItem.title = "首页"
        MainNav.tabBarItem.image = UIImage(named:"Home_0")
        MainNav.tabBarItem.selectedImage = UIImage(named:"Home_1")

        //!!!!
        /*
        let  PublishVC  = PublishViewController()
        PublishVC.title = " "
        let PublishNav = UINavigationController(rootViewController:PublishVC)
        PublishNav.tabBarItem.title = " "
        PublishNav.tabBarItem.image = UIImage(named:"Publish")
        //PublishNav.tabBarItem.selectedImage = UIImage(named:"Publish")
 */
        
        
        let  MyVC  = MyViewController()
        MyVC.title = "我的"
        let MyNav = UINavigationController(rootViewController:MyVC)
        MyNav.tabBarItem.title = "我的"
        MyNav.tabBarItem.image = UIImage(named:"My_0")
        MyNav.tabBarItem.selectedImage = UIImage(named:"My_1")
        
        // 添加工具栏
        //items = [MainNav,PublishNav,MyNav]
        items = [MainNav,MyNav]
        self.viewControllers = items as? [UIViewController]
        self.tabBar.tintColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.isTranslucent = false //解决了从二级页面返回后tabbar的偏移问题!
        
        let PublishButton = UIButton()
        PublishButton.setImage(UIImage(named:"Publish"), for: .normal)
        PublishButton.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        //PublishButton.sizeToFit()
        PublishButton.center.x = self.tabBar.center.x;
        PublishButton.center.y = self.tabBar.bounds.size.height * 0.5 - 10  ;
        //PublishButton.center.y = 0
        //self.view.addSubview(PublishButton)
        self.tabBar.addSubview(PublishButton)
 
        /*
        PublishButton.snp.makeConstraints { (make) in
            // 距离父视图顶部
            make.top.equalTo(UIScreen.main.bounds.size.height - self.tabBar.bounds.size.height-26)
            // 设置视图大小
            make.size.equalTo(CGSize(width: 80, height: 80))
            // x轴方向上居中
            //make.centerX.equalToSuperview()
            
        }
 */
        PublishButton.addTarget(self, action: #selector(PublishAction), for: .touchUpInside)
       // PublishButton.addTarget(self, action: #selector(PublishDisappear), for: .touchUpOutside)
        
//        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object:UIColor.white, forKey:NSForegroundColorAttributeName as NSCopying) as? [String : AnyObject], for:UIControlState.normal);
//        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object:UIColor.red, forKey:NSForegroundColorAttributeName as NSCopying) as? [String : AnyObject], for:UIControlState.selected);
       
        
    }
    
    /*
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let PublishButton = UIButton()
        PublishButton.setImage(UIImage(named:"Publish"), for: .normal)
        //PublishButton.frame = CGSize()
        PublishButton.center.x = self.tabBar.center.x;
        //PublishButton.center.y = self.tabBar.bounds.size.height * 0.5  ;
        PublishButton.center.y = 500
        //self.view.addSubview(PublishButton)
        self.tabBar.addSubview(PublishButton)
        PublishButton.snp.makeConstraints { (make) in
            // 距离父视图顶部
            make.top.equalTo(UIScreen.main.bounds.size.height - self.tabBar.bounds.size.height-26)
            // 设置视图大小
            make.size.equalTo(CGSize(width: 80, height: 80))
            // x轴方向上居中
            make.centerX.equalToSuperview()
            
        }
        PublishButton.addTarget(self, action: #selector(PublishAction), for: .touchUpInside)
        PublishButton.addTarget(self, action: #selector(PublishDisappear), for: .touchUpOutside)
        
    }
    */
    @objc func PublishAction(){
        
        
        
        //publishview = PublishView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        self.view.addSubview(publishview)
        print("a")
       
        //publishview.becomeFirstResponder()
        /*
        let view0 = PublishButtonView()
        view0.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.view.addSubview(view0)
 */
       
        ispublishview = true
    }
    /*
    @objc func PublishDisappear(){
        if(ispublishview){
            ispublishview = false
            //publishview.removeFromSuperview()
            
        }
    }
    */
    
    @objc func handleSingleTapGesture() {
        
        print("ss")
        //publishview.removeFromSuperview() // 点击移除半透明的View
        
    }
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
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
