//
//  MyTravelTableViewCell.swift
//  application
//
//  Created by lmlxiaoai on 2019/2/19.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import UIKit
import SnapKit

class TimeLineCell: UITableViewCell {
    //时间轴线上的图标
    var timeLineIcon: UIView!
    //费用显示文本标签
    var costLabel: UILabel!
    //消费时间文本标签
    var dateTimeLabel: UILabel!
    //消费条目文本标签
    var titleLabel: UILabel!
    //位置
    var locationLabel: UILabel!
    //备注标签容器
    var containView: UIView!
    //备注显示文本标签
    var appendixLabel: UILabel!
    //图标上半部分的时间线
    var forepartTimeLineLabel: UIView!
    //图标下半部分的时间线
    var backpartTimeLineLabel: UIView!
    //备注标签容器的高度约束（将高度设为0）
    var heightContraint: Constraint?
    //时间线离左右的横向间距
    let horizontalGap: CGFloat = 25
    
    var imagenumber: Int = 0
    var imageview = [UIImageView]()
    //是否有备注
    var hasAppendix:Bool = false {
        didSet
        {
            if hasAppendix {
                //有备注则高度约束实效，备注容器高度更具内容自适应
                self.heightContraint?.deactivate()
            }else{
                //没有备注高度约束生效，高度变成0
                self.heightContraint?.activate()
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubviews(){
        //图标上半部分的时间线初始化。并设置相关约束。 不改
        forepartTimeLineLabel = UIView()
        forepartTimeLineLabel.backgroundColor = UIColor.lightGray
        contentView.addSubview(forepartTimeLineLabel)
        forepartTimeLineLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(contentView).offset(horizontalGap)
            make.height.equalTo(35)
            make.width.equalTo(1)
            make.top.equalTo(contentView)
        }
        
        //时间线上图标初始化。并设置相关约束。 不改
        timeLineIcon = UIView()
        timeLineIcon.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        timeLineIcon.layer.cornerRadius = 5
        contentView.addSubview(timeLineIcon)
        timeLineIcon.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(forepartTimeLineLabel.snp.bottom)
            make.centerX.equalTo(forepartTimeLineLabel.snp.centerX)
            make.width.height.equalTo(10)
        }
        
        //费用显示文本标签初始化。并设置相关约束。 日期
        costLabel = UILabel()
        costLabel.font = UIFont.systemFont(ofSize: 24)
        costLabel.sizeToFit()
        contentView.addSubview(costLabel)
        costLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(timeLineIcon).offset(-20)
            make.left.equalTo(forepartTimeLineLabel.snp.right).offset(horizontalGap)
        }
        

        
        //消费条目文本标签初始化。并设置相关约束。 写的内容
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        //appendixLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        //appendixLabel.numberOfLines = 4
        titleLabel.sizeToFit()
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(costLabel)
            make.top.equalTo(costLabel.snp.bottom).offset(10)
        }
        
        //备注便签容器初始化。并设置相关约束。 图片
        /*
        containView = UIView()
        containView.backgroundColor = UIColor(red: 200/255, green: 200/255,blue: 200/255, alpha: 0.3)
        containView.layer.cornerRadius = 3
        contentView.addSubview(containView)
        containView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(forepartTimeLineLabel.snp.right).offset(10)
            make.right.equalTo(contentView).offset(-10)
        }
 */
        
        let length:CGFloat = (UIScreen.main.bounds.size.width - 100) / 3
        let a = Int(length)
        var row:Int
        var colum:Int
        
        for i in 0...imagenumber{
            
            row = i / 3
            colum = i % 3
            
            imageview[i] = UIImageView()
            contentView.addSubview(imageview[i])
            imageview[i].snp.makeConstraints { (make) -> Void in
                make.size.equalTo(CGSize(width:length, height:length))
                make.top.equalTo(titleLabel.snp.bottom).offset(row * (a + 5))
                make.left.equalTo(titleLabel.snp.left).offset(colum * (a + 5))
            }

        }
        
        
        //定位
        locationLabel = UILabel()
        locationLabel.font = UIFont.systemFont(ofSize: 12)
        locationLabel.textColor = UIColor.lightGray
        locationLabel.sizeToFit()
        contentView.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { (make) -> Void in
            //make.top.equalTo(containView.snp.bottom).offset(5)
            make.left.equalTo(contentView).offset(10)
            make.centerY.equalTo(costLabel)
        }
        
        //时间
        //消费时间文本标签初始化。并设置相关约束。
        dateTimeLabel = UILabel()
        dateTimeLabel.font = UIFont.systemFont(ofSize: 12)
        dateTimeLabel.textColor = UIColor.lightGray
        dateTimeLabel.sizeToFit()
        contentView.addSubview(dateTimeLabel)
        dateTimeLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(containView.snp.bottom).offset(5)
            make.left.equalTo(forepartTimeLineLabel.snp.right).offset(horizontalGap)
            //make.centerY.equalTo(costLabel)
        }
        
        //备注文本标签初始化。并设置相关约束。
        appendixLabel = UILabel()
        appendixLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        appendixLabel.font = UIFont.systemFont(ofSize: 16)
        appendixLabel.numberOfLines = 4
        appendixLabel.sizeToFit()
        containView.addSubview(appendixLabel)
        appendixLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(containView).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
        
        containView.snp.makeConstraints { (make) -> Void in
            self.heightContraint = make.height.equalTo(0).constraint
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
        
        //图标下半部分的时间线初始化。并设置相关约束。 不改
        backpartTimeLineLabel = UIView()
        backpartTimeLineLabel.backgroundColor = UIColor.lightGray
        contentView.addSubview(backpartTimeLineLabel)
        backpartTimeLineLabel.snp.makeConstraints { (make) -> Void in
            make.left.width.equalTo(forepartTimeLineLabel)
            make.top.equalTo(timeLineIcon.snp.bottom)
            make.bottom.equalTo(contentView)
        }
    }
}
