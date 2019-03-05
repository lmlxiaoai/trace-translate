//
//  RegisterViewController.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/19.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//
import UIKit
import Foundation


class RegisterViewController: BaseViewController, UITextFieldDelegate {
    
    var registerview = RegisterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = " "
        
       self.navigationController?.navigationBar.isTranslucent = true
        registerview.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.view.addSubview(registerview)
       
        registerview.Username.delegate = self
        registerview.Username.becomeFirstResponder()
        registerview.Username.borderStyle = UITextField.BorderStyle.none
      
        registerview.Password.delegate = self
        registerview.Password.borderStyle = UITextField.BorderStyle.none

        registerview.RegisterButton.addTarget(self, action: #selector(RegisterAction), for: .touchUpInside)
        registerview.LoginChoiceButton.addTarget(self, action: #selector(Change), for: .touchUpInside)
        
        
        // Do any additional setup after loading the view.
    }
    @objc func Change(){
        
        self.navigationController?.pushViewController(LoginViewController(), animated: false)
    }
    @objc func RegisterAction(){
        
        let Client = Register(name: registerview.Username.text!, password: registerview.Password.text!)
        print(Client.name0)
        Client.GET1()
        /*
        let test:Int = Client.dict!["success"] as! Int
        if test == 1 {
            print("OK")
        }
 */
        
    }
    
    // 输入框结束编辑状态
    func textFieldDidEndEditing(_ textField: UITextField) {
        //print("我已经结束编辑状态...")
        print(textField.text!)
        textField.resignFirstResponder()
    } // 文本框是否可以清除内容
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    // 输入框按下键盘 return 收回键盘
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?, _ textField: UITextField) {
        textField.resignFirstResponder()
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
