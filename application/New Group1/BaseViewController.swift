//
//  BaseViewController.swift
//  NewsTabbar
//
//  Created by jiayuqiang on 2018/8/8.
//  Copyright © 2018年 jiayuqiang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        self.navigationController?.navigationBar.tintColor = UIColor.clear
        self.navigationController?.navigationBar.isTranslucent = false //视图会下移

        //self.navigationController?.navigationBar.backgroundColor = UIColor.white
        
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_background_white"), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "image"), for: .default)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "Back"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(leftClick1))
        
      //  let leftItemButton = self.titleButton(rect: CGRect.init(x: 0, y: 0, width: 40, height: 44), backgroundColor: UIColor.clear, title: "返回", font: 17.0, titleColor: UIColor.gray)
       // leftItemButton .addTarget(self, action: #selector(leftClick1), for: UIControl.Event.touchUpInside)
     //   self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftItemButton)
        
        self.view.backgroundColor = UIColor.white
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func titleButton(rect:CGRect,backgroundColor:UIColor,title:NSString,font:Float,titleColor:UIColor) -> UIButton {
        
        let leftBtn                     = UIButton(frame: rect)
        leftBtn.backgroundColor         = backgroundColor
        leftBtn.setTitle(title as String, for: UIControl.State.normal)
        leftBtn.setTitleColor(titleColor, for: UIControl.State.normal)
        leftBtn.titleLabel?.font        = UIFont.systemFont(ofSize: CGFloat(font))
        return leftBtn
    }
    
    func hiddenleftButton() {
        self.navigationItem.leftBarButtonItem = nil
    }
    
    
    @objc private func leftClick1() {
        print("did click left")
        
        self.navigationController?.popViewController(animated: true)
        
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
