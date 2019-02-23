//
//  RegisterView.swift
//  application
//
//  Created by lmlxiaoai on 2019/2/17.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class RegisterView: UIView {
    
    var Username = UITextField()
    var Password = UITextField()
    var RegisterButton = UIButton()
    var RegisterLabel = UILabel()
    var LoginChoiceButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let BackImage = UIImageView()
        BackImage.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        BackImage.image = UIImage(named: "reback")
        self.addSubview(BackImage)
        BackImage.contentMode = UIView.ContentMode.scaleAspectFill
        
        LoginChoiceButton.setTitle("登录", for: .normal)
        LoginChoiceButton.setTitleColor(UIColor.gray, for: .normal)
        LoginChoiceButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        self.addSubview(LoginChoiceButton)
        LoginChoiceButton.backgroundColor = UIColor.white
        LoginChoiceButton.layer.backgroundColor = UIColor.white.cgColor
        //style.layer.shadowColor = UIColor.lightGray.cgColor
        LoginChoiceButton.layer.shadowRadius = 5
        LoginChoiceButton.layer.shadowOpacity = 0.2
        LoginChoiceButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        RegisterLabel.text = "注册"
        RegisterLabel.font = UIFont.systemFont(ofSize: 24)
        RegisterLabel.textColor = UIColor.gray
        RegisterLabel.textAlignment = .center
        self.addSubview(RegisterLabel)
        RegisterLabel.backgroundColor = UIColor.white
        RegisterLabel.layer.backgroundColor = UIColor.white.cgColor
        //style.layer.shadowColor = UIColor.lightGray.cgColor
        RegisterLabel.layer.shadowRadius = 5
        RegisterLabel.layer.shadowOpacity = 0.2
        RegisterLabel.layer.shadowOffset = CGSize(width: 0, height: 3)
        

        
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

        RegisterLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(back.snp.top).offset(8)
            make.size.equalTo(CGSize(width: 88, height: 52))
            make.left.equalTo(back.snp.left).offset(80)
        }
        
        LoginChoiceButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(back.snp.top).offset(14)
            make.size.equalTo(CGSize(width: 88, height: 52))
            make.left.equalTo(back.snp.left).offset(10)
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
        Password.placeholder = "请输入密码，至少6位"
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
        
        self.addSubview(RegisterButton)
        RegisterButton.backgroundColor = UIColor(red: 157.0 / 255.0, green: 200.0 / 255.0, blue: 200.0 / 255.0, alpha: 1.0)
        RegisterButton.layer.cornerRadius = 20
        RegisterButton.snp.makeConstraints { (make) in
            make.top.equalTo(450)
            make.size.equalTo(CGSize(width: 160, height: 42))
            make.centerX.equalToSuperview()
        }
        RegisterButton.setTitle("注册", for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
