//
//  WordViewController.swift
//  NewsTabbar
//
//  Created by lmlxiaoai on 2019/1/18.
//  Copyright © 2019 jiayuqiang. All rights reserved.
//

import UIKit

class WordViewController: BaseViewController {
    
    var wordview = WordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "翻译"
        
        //wordview = WordView(frame: UIScreen.main.bounds)
        wordview = WordView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        self.view.addSubview(wordview)
        // Do any additional setup after loading the view.
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
