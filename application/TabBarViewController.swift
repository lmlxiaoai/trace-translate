//
//  TabBarViewController.swift
//  NewsTabbar
//
//  Created by jiayuqiang on 2018/8/9.
//  Copyright © 2018年 jiayuqiang. All rights reserved.
//

import UIKit

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.CreatTabBar()
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
        let  PublishVC  = PublishViewController()
        PublishVC.title = " "
        let PublishNav = UINavigationController(rootViewController:PublishVC)
        PublishNav.tabBarItem.title = " "
        PublishNav.tabBarItem.image = UIImage(named:"Publish")
        PublishNav.tabBarItem.selectedImage = UIImage(named:"Publish")
        
        let  MyVC  = MyViewController()
        MyVC.title = "我的"
        let MyNav = UINavigationController(rootViewController:MyVC)
        MyNav.tabBarItem.title = "我的"
        MyNav.tabBarItem.image = UIImage(named:"My_0")
        MyNav.tabBarItem.selectedImage = UIImage(named:"My_1")
        
        // 添加工具栏
        items = [MainNav,PublishNav,MyNav]
        self.viewControllers = items as? [UIViewController]
        self.tabBar.tintColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.isTranslucent = false //解决了从二级页面返回后tabbar的偏移问题!
        
        /**
         for循环控制器数组 写法
         
         for  M in 0 ..< VCArr.count {
         nav = UINavigationController(rootViewController:(VCArr[M] as AnyObject as! UIViewController))
         
         nav.tabBarItem.title = NameArr[M]
         nav.tabBarItem.image = UIImage(named:PicArr[M])
         nav.tabBarItem.selectedImage = UIImage(named:PicSelectArr[M])
         VCArr[M].title = NameArr[M]
         NavVCArr.append(nav)
         }
         // 添加工具栏
         // items = [MainNav,ClassNav,CartNav,MyNav]
         self.viewControllers = NavVCArr as? [UIViewController]
         for  i in 0 ..< NavVCArr.count {
         /*
         (items[i] as AnyObject) 相当于 self.navigationController?
         **/
         //设置导航栏的背景图片 （优先级高）
         (NavVCArr[i] as AnyObject).navigationBar.setBackgroundImage(UIImage(named:"NavigationBar"), for:.default)
         //设置导航栏的背景颜色 （优先级低）
         (NavVCArr[i] as AnyObject).navigationBar.barTintColor = UIColor.orange
         //设置导航栏的字体颜色
         (NavVCArr[i] as AnyObject).navigationBar.titleTextAttributes =
         [NSForegroundColorAttributeName: UIColor.red]
         
         }
         */
//        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object:UIColor.white, forKey:NSForegroundColorAttributeName as NSCopying) as? [String : AnyObject], for:UIControlState.normal);
//        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object:UIColor.red, forKey:NSForegroundColorAttributeName as NSCopying) as? [String : AnyObject], for:UIControlState.selected);
        

        
        
        
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
