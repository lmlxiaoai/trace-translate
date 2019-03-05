//
//  SightViewController2.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/27.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit

class SightDetailViewController: BaseViewController, UIScrollViewDelegate {
    
    var scroll:UIScrollView!
    var contentview:SightDetailView!
    
    var Textlabel:UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll = UIScrollView(frame: view.bounds)
        self.view.addSubview(scroll)
        scroll.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        contentview = SightDetailView()
        
        scroll.addSubview(contentview)
        
        contentview.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(scroll).inset(10)
            make.left.right.equalTo(view).inset(20)
        }

        contentview.BackImageView.image = UIImage(named: "Image-1")
        contentview.Title.text = "打卡成都那些不可错过的风景与美食"
    
        let paraph = NSMutableParagraphStyle()
        paraph.lineSpacing = 14
        let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15),
                          NSAttributedString.Key.paragraphStyle: paraph]
        
        contentview.textstring.append("首先要理解一点核心思想：UIScrollView是依靠与其子视图（subview）之间的约束来确定ContentSize的大小。为什么这么说呢？这是因为UIScrollView是个非常特殊的UIView, 对于UIScrollView的subview来说，")
        contentview.textstring.append("\n")
        let myMutableString = NSMutableAttributedString(
            string: contentview.textstring,attributes: attributes)
        myMutableString.addAttribute(NSAttributedString.Key.font,value: UIFont.boldSystemFont(ofSize: 20),range: NSRange(location: 6,length: 4))
        contentview.Textlabel.attributedText = myMutableString
        
        contentview.Ticketstring.append("它的leading/trailing/top/bottom的space是相对于UIScrollView的contentSize而不是bounds来确定的，换句话说：UIScrollView与其subview之间相对位置的约束并不会直接用于frame的计算,而是会转化为对ContentSize的计算。当UIScrollView知道了上下左右的约束分别指向subview的什么位置之后,只要subview的位置固定下来了,那么UIScrollView的ContentSize的大小就确定下来了。")
        contentview.Ticketstring.append("\n")
        let myMutableString2 = NSMutableAttributedString(
            string: contentview.Ticketstring,attributes: attributes)
        myMutableString2.addAttribute(NSAttributedString.Key.font,value: UIFont.boldSystemFont(ofSize: 20),range: NSRange(location: 6,length: 4))
        contentview.Ticketlabel.attributedText = myMutableString2
        
        contentview.trafficlstring.append("但是当我们尝试使用UIScrollView和它subview的leading/trailing/top/bottom来互相决定大小的时候，会出现Has ambiguous scrollable content width/height」的 warning。所以我们习惯的做法是在UIScrollView和它原来的subviews之间增加一个contentView,依靠contentView来确定contentSize。")
        contentview.trafficlstring.append("\n")
        let myMutableString3 = NSMutableAttributedString(
            string: contentview.trafficlstring,attributes: attributes)
        myMutableString3.addAttribute(NSAttributedString.Key.font,value: UIFont.boldSystemFont(ofSize: 20),range: NSRange(location: 6,length: 4))
        contentview.Trafficlabel.attributedText = myMutableString3
        
        contentview.Trafficlabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(scroll.snp.bottom).inset(30)
            //在controller里约束最下面
        }
        
        
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
