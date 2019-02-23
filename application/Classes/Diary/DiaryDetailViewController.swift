//
//  DiaryDetialViewController.swift
//  application
//
//  Created by lmlxiaoai on 2019/2/22.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit

class DiaryDetailViewController: BaseViewController, UIScrollViewDelegate {
    
    var scroll:UIScrollView!
    var contentview:UIView!
    
    var Textlabel:UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll = UIScrollView(frame: view.bounds)
        self.view.addSubview(scroll)
        scroll.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        contentview = DiaryDetailView()
        
        scroll.addSubview(contentview)
        
        contentview.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(scroll).inset(10)
            make.left.right.equalTo(view).inset(20)
        }
        
        Textlabel = UILabel()
        contentview.addSubview(Textlabel)
        Textlabel.numberOfLines = 0
        Textlabel.backgroundColor = UIColor.yellow
        
        Textlabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(contentview).inset(20)
            make.top.equalTo(contentview).offset(2000)
            make.bottom.equalTo(scroll.snp.bottom).inset(10)
            //在controller里约束最下面
        }
        Textlabel.text = "88888888899990123891283091839021830198302918309138012938901238901238901238901238019283019283901283109238190240822370948751904856cn979my9x8r,3rmy398y938ry98cmry9832yr8m9x3ry98 y2mr9832ym98c23y4,984y38204y784x7803x"



 
        //scroll.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height*2)
        //但是可以设定，内容就算小于它，也能拖：
        scroll.alwaysBounceVertical = true //还有水平的
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
    }
}
