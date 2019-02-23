//
//  LoginView.swift
//  application
//
//  Created by lmlxiaoai on 2019/2/18.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class LoginView: UIView {
    
    var Username = UITextField()
    var Password = UITextField()
    var LoginButton = UIButton()
    var LoginLabel = UILabel()
    var RegisterChoiceButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let BackImage = UIImageView()
        BackImage.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        BackImage.image = UIImage(named: "reback")
        self.addSubview(BackImage)
        BackImage.contentMode = UIView.ContentMode.scaleAspectFill
        
        RegisterChoiceButton.setTitle("注册", for: .normal)
        RegisterChoiceButton.setTitleColor(UIColor.gray, for: .normal)
        RegisterChoiceButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        self.addSubview(RegisterChoiceButton)
        RegisterChoiceButton.backgroundColor = UIColor.white
        RegisterChoiceButton.layer.backgroundColor = UIColor.white.cgColor
        //style.layer.shadowColor = UIColor.lightGray.cgColor
        RegisterChoiceButton.layer.shadowRadius = 5
        RegisterChoiceButton.layer.shadowOpacity = 0.2
        RegisterChoiceButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        LoginLabel.text = "登录"
        LoginLabel.font = UIFont.systemFont(ofSize: 24)
        LoginLabel.textColor = UIColor.gray
        LoginLabel.textAlignment = .center
        self.addSubview(LoginLabel)
        LoginLabel.backgroundColor = UIColor.white
        LoginLabel.layer.backgroundColor = UIColor.white.cgColor
        //style.layer.shadowColor = UIColor.lightGray.cgColor
        LoginLabel.layer.shadowRadius = 5
        LoginLabel.layer.shadowOpacity = 0.2
        LoginLabel.layer.shadowOffset = CGSize(width: 0, height: 3)
        

        
        self.backgroundColor = UIColor.white
        let back = UIView()
        back.backgroundColor = UIColor.white
        self.addSubview(back)
        back.snp.makeConstraints { (make) in
            make.top.equalTo(200)
            make.size.equalTo(CGSize(width: 332, height: 400))
            make.centerX.equalToSuperview()
        }
        
        back.layer.backgroundColor = UIColor.white.cgColor
        //style.layer.shadowColor = UIColor.lightGray.cgColor
        back.layer.shadowRadius = 5
        back.layer.shadowOpacity = 0.2
        back.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        LoginLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(back.snp.top).offset(8)
            make.size.equalTo(CGSize(width: 88, height: 52))
            make.left.equalTo(back.snp.left).offset(10)
        }
        
        RegisterChoiceButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(back.snp.top).offset(14)
            make.size.equalTo(CGSize(width: 88, height: 52))
            make.left.equalTo(back.snp.left).offset(80)
        }
        
        //相对于背景的位置没写
        self.addSubview(Username)
        Username.frame = CGRect(x: 78, y: 290, width: 260, height: 30)
        Username.placeholder = "请输入邮箱"
        Username.backgroundColor = UIColor.white
        
        let line1 = UIView()
        self.addSubview(line1)
        line1.backgroundColor = UIColor.gray
        line1.snp.makeConstraints { (make) in
            make.top.equalTo(320)
            make.size.equalTo(CGSize(width: 300, height: 1))
            make.centerX.equalToSuperview()
        }
        
        let UserImage = UIImageView()
        UserImage.image = UIImage(named: "user")
        UserImage.contentMode = UIView.ContentMode.scaleAspectFit
        back.addSubview(UserImage)
        UserImage.snp.makeConstraints { (make) in
            make.left.equalTo(line1.snp.left).offset(8)
            make.bottom.equalTo(line1.snp.top).offset(-6)
            make.size.equalTo(CGSize(width: 24, height: 24))
            
        }
        
        
        
        self.addSubview(Password)
        Password.frame = CGRect(x: 78, y: 364, width: 260, height: 30)
        Password.placeholder = "请输入登录密码"
        Password.backgroundColor = UIColor.white
        Password.isSecureTextEntry = true
        
        let line2 = UIView()
        self.addSubview(line2)
        line2.backgroundColor = UIColor.gray
        line2.snp.makeConstraints { (make) in
            make.top.equalTo(394)
            make.size.equalTo(CGSize(width: 300, height: 1))
            make.centerX.equalToSuperview()
        }
        
        let PasswordImage = UIImageView()
        PasswordImage.image = UIImage(named: "lock")
        PasswordImage.contentMode = UIView.ContentMode.scaleAspectFill
        back.addSubview(PasswordImage)
        PasswordImage.snp.makeConstraints { (make) in
            make.left.equalTo(line2.snp.left).offset(8)
            make.bottom.equalTo(line2.snp.top).offset(-6)
            make.size.equalTo(CGSize(width: 24, height: 24))
            
        }
        
        self.addSubview(LoginButton)
        LoginButton.backgroundColor = UIColor(red: 157.0 / 255.0, green: 200.0 / 255.0, blue: 200.0 / 255.0, alpha: 1.0)
        LoginButton.layer.cornerRadius = 20
        LoginButton.snp.makeConstraints { (make) in
            make.top.equalTo(450)
            make.size.equalTo(CGSize(width: 160, height: 42))
            make.centerX.equalToSuperview()
        }
        LoginButton.setTitle("登录", for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

