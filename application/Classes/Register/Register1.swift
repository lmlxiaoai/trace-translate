//
//  Register1.swift
//  application
//
//  Created by lmlxiaoai on 2019/2/17.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation


class Register{
    
    var name0: String
    var password0: String
    
    init(name: String , password :String){
        name0 = name
        password0 = password
    }

    func GET1()
        
    {
        
        var password = password0.md5String()
        
        //对请求路径的说明
        
        //http://hd215.api.okayapi.com/?service=App.User.GetList&page=1&perpage=20&app_key=41D23E2DD383BE92FB2A5023AAF00371
        
        //协议头+主机地址+接口名称+？+参数1&参数2&参数3
        
        //协议头(http://)+主机地址(120.25.226.186:32812)+接口名称(login)+？+参数1(username=520it)&参数2(pwd=520)&参数3(type=JSON)
        
        //GET请求，直接把请求参数跟在URL的后面以？隔开，多个参数之间以&符号拼接
        
        
        
        //1.确定请求路径
        
        
        
        var url: NSURL = NSURL(string: "http://hd215.api.okayapi.com/?service=App.User.Register&&username=\(name0)&password=\(password)&app_key=41D23E2DD383BE92FB2A5023AAF00371")!
        
        
        
        //2.创建请求对象
        
        //请求对象内部默认已经包含了请求头和请求方法（GET）
        
        var request: NSURLRequest = NSURLRequest(url: url as URL)
        
        
        
        //3.获得会话对象
        
        var session: URLSession = URLSession.shared
        
        
        
        //4.根据会话对象创建一个Task(发送请求）
        
        /*
         
         第一个参数：请求对象
         
         第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
         
         data：响应体信息（期望的数据）
         
         response：响应头信息，主要是对服务器端的描述
         
         error：错误信息，如果请求失败，则error有值
         
         */
        
        var dataTask: URLSessionDataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            
            
            if(error == nil){
                
                //6.解析服务器返回的数据
                
                //说明：（此处返回的数据是JSON格式的，因此使用NSJSONSerialization进行反序列化处理）
                
                var dict:NSDictionary? = nil
                
                do {
                    
                    dict  = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.init(rawValue: 0)) as! NSDictionary
                    
                } catch {
                    
                    
                    
                }
                
                print("%@",dict)
                
            }
            
        }
        
        //5.执行任务
        
        dataTask.resume()
        
    }
}
