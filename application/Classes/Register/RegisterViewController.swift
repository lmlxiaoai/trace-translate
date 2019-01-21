//
//  RegisterViewController.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/19.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//
import UIKit
import Foundation


class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        self.title = " "
        
        let Username = UITextField.init(frame: CGRect(x: 30, y: 145, width: 300, height: 30))
        self.view.addSubview(Username)
        Username.delegate = self
        Username.becomeFirstResponder()
        Username.borderStyle = UITextField.BorderStyle.roundedRect
        Username.placeholder = "输入用户名"
 
        
        let Password = UITextField.init(frame: CGRect(x: 30, y: 245, width: 300, height: 30))
        self.view.addSubview(Password)
        Password.delegate = self
        Password.borderStyle = UITextField.BorderStyle.roundedRect
        Password.placeholder = "输入密码"
        
        
        // Do any additional setup after loading the view.
    }
    // 输入框结束编辑状态
    func textFieldDidEndEditing(_ textField: UITextField) {
        //print("我已经结束编辑状态...")
        print(textField.text!)
    } // 文本框是否可以清除内容
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    // 输入框按下键盘 return 收回键盘
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
