//
//  MyView.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/19.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit

class MyView: UIView {
    
    //let myView = UIView()
    let MyIcon = UIButton()
    let MyLikeButton = UIButton()
    let MyStorageButton = UIButton()
    let MyFriendButton = UIButton()
    var MyName = UILabel()
    let EditButton = UIButton()
    var mytravelview = MyTravelView()
    var Followlabel = UILabel()
    var FollowButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        let back = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 236))
        back.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        self.addSubview(back)
        
        MyIcon.frame = CGRect(x: 28, y: 48, width: 82, height: 82)
        MyIcon.backgroundColor = UIColor.white
        MyIcon.layer.cornerRadius = MyIcon.frame.size.width/2;
        MyIcon.clipsToBounds = true;
        self.addSubview(MyIcon)
        
        //
        MyLikeButton.frame = CGRect(x: 152, y: 136, width: 44, height: 44)
        self.addSubview(MyLikeButton)
        MyLikeButton.setImage(UIImage(named: "Like"), for: .normal)
        
        //
        MyStorageButton.frame = CGRect(x: 200, y: 136, width: 44, height: 44)
        self.addSubview(MyStorageButton)
        MyStorageButton.setImage(UIImage(named: "Storage"), for: .normal)
        
        //
        MyFriendButton.frame = CGRect(x: 248, y: 136, width: 44, height: 44)
        self.addSubview(MyFriendButton)
        MyFriendButton.setImage(UIImage(named: "Friend"), for: .normal)
        
        //
        MyName.frame = CGRect(x: 160, y: 60, width: 160, height: 20)
        MyName.textColor = UIColor.white
        self.addSubview(MyName)
        MyName.font = UIFont.systemFont(ofSize: 18)
        
        //
        EditButton.frame = CGRect(x: 300, y: 50, width: 44, height: 44)
        self.addSubview(EditButton)
        EditButton.setImage(UIImage(named: "Edit"), for: .normal)
        
        //
        FollowButton.frame = CGRect()
        self.addSubview(FollowButton)
        FollowButton.setTitle("关注", for: .normal)
        FollowButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -46, bottom: -50, right: 10)

        
        //
        self.addSubview(mytravelview)
        mytravelview.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(216)
            make.size.equalTo(CGSize(width: 350, height: 250))
        }
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
