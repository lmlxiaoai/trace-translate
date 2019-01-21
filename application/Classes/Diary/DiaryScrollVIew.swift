//
//  DiaryScrollVIew1.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/21.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit

class DiaryScrollView : UIScrollView , UIScrollViewDelegate{
    
    let diaryviewcontroller1 = DiaryViewController1()
    let diaryviewcontroller2 = DiaryViewController2()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.backgroundColor = UIColor.white
        self.addSubview(diaryviewcontroller1.view)
        self.addSubview(diaryviewcontroller2.view)
        self.contentSize = CGSize(width: UIScreen.main.bounds.size.width*2, height: UIScreen.main.bounds.size.height*2)
        
        //self.alwaysBounceVertical = true
        self.isPagingEnabled = true //每次翻动一页
        self.showsVerticalScrollIndicator = true //还有水平的
        self.showsHorizontalScrollIndicator = true;
        
        self.bounces = false
        self.indicatorStyle = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews[0]
    }
    func function(){
        //滚动条突然显现一下
        self.flashScrollIndicators()
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
}
