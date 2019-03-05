//
//  LoginViewController.swift
//  application
//
//  Created by lmlxiaoai on 2019/2/18.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class LoginViewController: BaseViewController, UITextFieldDelegate {
    
    var loginview = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = " "
    
        self.navigationController?.navigationBar.isTranslucent = true
        loginview.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.view.addSubview(loginview)
        
        loginview.Username.delegate = self
        loginview.Username.becomeFirstResponder()
        loginview.Username.borderStyle = UITextField.BorderStyle.none
        
        loginview.Password.delegate = self
        loginview.Password.borderStyle = UITextField.BorderStyle.none
        
        loginview.LoginButton.addTarget(self, action: #selector(LoginAction), for: .touchUpInside)
        loginview.RegisterChoiceButton.addTarget(self, action: #selector(Change), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func Change(){
        
       
        self.navigationController?.pushViewController(RegisterViewController(), animated: false)
    }
    
    @objc func LoginAction(){
        
        let password = loginview.Password.text!.md5String()
        Alamofire.request("http://137.116.134.155:80/loginGet.php/?ema=\(loginview.Username.text)&pas=\(password)").responseJSON { response  in
            print(response.request )  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                
                let  datajosn:NSDictionary  = JSON as! NSDictionary
                let test:String = datajosn["success"] as! String
                if test == "1"{
                    self.navigationController?.pushViewController(MyViewController(), animated: false)
                }
                
            }
            
        }
        
        
        /*
        let Client = Login(name: loginview.Username.text!, password: loginview.Password.text!)
        print(Client.name0)
        Client.GET1()
        if Client.test != nil{
            if Client.test == "0"{
                print("fail")
            }
            else{
                print("success")
            }
        }
 */
        /*
        if Client.GET1() == true {
            print("OK")
            self.navigationController?.pushViewController(MyViewController(), animated: false)
        }
        else{
            print("NO")
        }
        */
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
