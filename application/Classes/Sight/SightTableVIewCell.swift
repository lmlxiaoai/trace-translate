//
//  SightTableVIewCell.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/26.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit

class SightTableViewCell: UITableViewCell{
    
    let width:CGFloat = UIScreen.main.bounds.width
    var name:UILabel!
    var score:UILabel!
    var level:UILabel!
    var time:UILabel!
    var price:UILabel!
    var address:UILabel!
    var addbutton:UIButton!
    var starbutton:UIButton!
    var iconImv:UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 头像
        iconImv = UIImageView(frame: CGRect(x: 13, y: 48, width: 106, height: 80))
        iconImv.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        iconImv.layer.masksToBounds = true
        iconImv.layer.cornerRadius = 5
        iconImv.contentMode = UIView.ContentMode.scaleAspectFit
        
        // 名字
        name = UILabel(frame: CGRect(x: 40, y: 12, width: 260, height: 18))
        name.textColor = UIColor.black
        name.font = UIFont.boldSystemFont(ofSize: 18)
        name.textAlignment = .left
        
        //绿色小方块
        let view1 = UIView(frame: CGRect(x: 12, y: 14, width: 12, height: 12))
        view1.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        
        //评分
        score = UILabel(frame: CGRect(x: 304, y: 10, width: 50, height: 24))
        score.textColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        score.font = UIFont.boldSystemFont(ofSize: 24)
        score.textAlignment = .left
        
        //景点级别
        let level0 = UILabel(frame: CGRect(x: 144, y: 52, width: 120, height: 13))
        level0.textColor = UIColor.black
        level0.text = "景点级别："
        level0.font = UIFont.systemFont(ofSize: 13)
        level0.textAlignment = .left
        
        
        level = UILabel(frame: CGRect(x: 210, y: 52, width: 140, height: 13))
        level.textColor = UIColor.black
        level.font = UIFont.systemFont(ofSize: 13)
        level.textAlignment = .left
        level.numberOfLines = 1;
        level.lineBreakMode = NSLineBreakMode.byTruncatingTail
        
        
        //开放时间
        let time0 = UILabel(frame: CGRect(x: 144, y: 70, width: 100, height: 13))
        time0.textColor = UIColor.black
        time0.text = "开放时间："
        time0.font = UIFont.systemFont(ofSize: 13)
        time0.textAlignment = .left
        
        time = UILabel(frame: CGRect(x: 210, y: 70, width: 140, height: 13))
        time.textColor = UIColor.black
        time.font = UIFont.systemFont(ofSize: 13)
        time.textAlignment = .left
        time.numberOfLines = 1;
        time.lineBreakMode = NSLineBreakMode.byTruncatingTail
        
        //门票
        let price0 = UILabel(frame: CGRect(x: 144, y: 88, width: 140, height: 13))
        price0.textColor = UIColor.black
        price0.text = "门票价格："
        price0.font = UIFont.systemFont(ofSize: 13)
        price0.textAlignment = .left
        
        price = UILabel(frame: CGRect(x: 210, y: 88, width: 140, height: 13))
        price.textColor = UIColor.black
        price.font = UIFont.systemFont(ofSize: 13)
        price.textAlignment = .left
        
        //地址
        let address0 = UILabel(frame: CGRect(x: 144, y: 106, width: 140, height: 13))
        address0.textColor = UIColor.black
        address0.text = "地址："
        address0.font = UIFont.systemFont(ofSize: 13)
        address0.textAlignment = .left
        
        address = UILabel(frame: CGRect(x: 184, y: 106, width: 164, height: 13))
        address.textColor = UIColor.black
        address.font = UIFont.systemFont(ofSize: 13)
        address.textAlignment = .left
        address.numberOfLines = 2
        
        let style = UIView(frame: CGRect(x: 10, y: 0, width: 352, height: 143))
        style.layer.cornerRadius = 8
        style.layer.backgroundColor = UIColor.white.cgColor
        //style.layer.shadowColor = UIColor.lightGray.cgColor
        style.layer.shadowRadius = 5
        style.layer.shadowOpacity = 0.2
        style.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        
        contentView.addSubview(style)
        style.addSubview(view1)
        style.addSubview(iconImv)
        style.addSubview(name)
        style.addSubview(score)
        style.addSubview(level0)
        style.addSubview(level)
        style.addSubview(time0)
        style.addSubview(time)
        style.addSubview(address0)
        style.addSubview(address)
        style.addSubview(price0)
        style.addSubview(price)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
