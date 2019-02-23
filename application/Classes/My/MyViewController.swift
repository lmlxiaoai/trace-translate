//
//  CameraViewController.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/18.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//
import UIKit

class MyViewController0: BaseViewController, UIScrollViewDelegate {

    let Scrollview = UIScrollView()
    var scroll:UIScrollView!
    var username: String?
    
    override func viewDidLoad() {
           super.viewDidLoad()
        /*
        Scrollview.frame = CGRect(x: 0, y: 100, width : self.view.frame.size.width, height: 1000)
        Scrollview.backgroundColor = UIColor.gray
        self.view.addSubview(Scrollview)
        Scrollview.showsVerticalScrollIndicator = true
        Scrollview.isScrollEnabled = true
        Scrollview.indicatorStyle = UIScrollView.IndicatorStyle.black
 */
        username = "初学者"
        
        //导航栏
        self.navigationController?.navigationBar.tintColor = UIColor.purple
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "Setting"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(SettingClick))
        
        
        
        
        
        
        scroll = UIScrollView(frame: view.bounds)
        
        let myView = MyView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 236))
        scroll.addSubview(myView)
        myView.MyName.text = username
        //内容大小，小于scrollView的大小肯定不会scroll啊
        scroll.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height*2)
        //但是可以设定，内容就算小于它，也能拖：
        scroll.alwaysBounceVertical = true //还有水平的
        self.view.addSubview(scroll)
        //内容的初始位置偏移到指定point处
        //scroll.contentOffset = CGPoint(x: 20, y: 20)
        //拉到头时可否反弹 default为true
        scroll.bounces = true
        //拖时候不能改变方向。但往对角线方向开始拖，可以自由拖
        //scroll.isDirectionalLockEnabled = false //default false
        //翻页效果，true就是手滑动小了回到原位置，大了直接跳下一页
        scroll.isPagingEnabled = false
        //scroll.isScrollEnabled = false //false就不能滑了
        //点状态栏回到最上方
        scroll.scrollsToTop = true;
        //滚动条到屏幕边缘的距离 offset <-> inset ,offset偏移，inset内移
        scroll.scrollIndicatorInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 0)
        //add additional scroll area around content
        scroll.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //是否显示滚动条
        scroll.showsVerticalScrollIndicator = true //还有水平的
        scroll.indicatorStyle = .black //默认黑，黑白两色可选
        //实现两指缩放与扩大
        //scroll.minimumZoomScale = 0.5
        //scroll.maximumZoomScale = 1.6
        //超过放大范围再弹回来
        scroll.bouncesZoom = true
        //如果正显示着键盘，拖动，则键盘撤回
        scroll.keyboardDismissMode = .onDrag
        //scroll.refreshControl = UIRefreshControl(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
        //        open var decelerationRate: CGFloat
        //        open var indexDisplayMode: UIScrollViewIndexDisplayMode
        //现在实现ScrollViewDelegate,补充后面的协议方法
        scroll.delegate = self
        
        myView.MyIcon.addTarget(self, action: #selector(MyIconAction), for: .touchUpInside)
        myView.MyLikeButton.addTarget(self, action: #selector(MyLikeButtonAction), for: .touchUpInside)
        myView.MyStorageButton.addTarget(self, action: #selector(MyStorageButtonAction), for: .touchUpInside)
        myView.MyFriendButton.addTarget(self, action: #selector(MyFriendButtonAction), for: .touchUpInside)
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
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews[0]
    }
    func function(){
        //滚动条突然显现一下
        scroll.flashScrollIndicators()
    }
    //点击状态栏时触发，返回false则不能滑上去 相应的 didScrollToTop是已经回了调用的
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    //开始拖拽前：
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    }
    //手滑后，松手减速，结束时：
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    }
    
    //拖拽结束
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    }
    //滚动动画结束
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
    }
    
    @objc func SettingClick(){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(SettingViewController(), animated: true)
        self.hidesBottomBarWhenPushed = false
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
