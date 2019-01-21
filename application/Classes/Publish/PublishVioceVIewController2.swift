//
//  PublishVoiceViewController.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/19.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit
import Speech

class PublishVoiceViewController2: BaseViewController {
    
    let textview = UITextView()
    /// 语音识别操作类对象
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "zh_CN"))!
    
    /// 处理语音识别请求，给语音识别提供语音输入
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    
    /// 告诉用户语音识别对象的结果。拥有这个对象很方便因为你可以 用它删除或中断任务
    private var recognitionTask: SFSpeechRecognitionTask?
    
    /// 语音引擎。负责提供语音输入
    //private let audioEngine = AVAudioEngine()
    private var audioEngine: AVAudioEngine?
    
    let PublishVoice = PublishVoiceView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioEngine = AVAudioEngine()
        
        PublishVoice.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.backgroundColor = UIColor.white
        self.title = ""
        self.view.addSubview(PublishVoice)
        //textview.clearsOnInsertion = true
        
        
        PublishVoice.VoiceButton.isEnabled = true

        PublishVoice.VoiceButton.addTarget(self, action: #selector(startRecording1), for: .touchDown)
        PublishVoice.VoiceButton.addTarget(self, action: #selector(stopRecording1), for: .touchUpInside)

        speechRecognizer.delegate = self
        /// 申请用户语音识别权限
        
         SFSpeechRecognizer.requestAuthorization { (authStatus) in
         
         var isButtonEnabled = false
         
         switch authStatus {
         case .authorized: // 用户授权语音识别
         isButtonEnabled = true
         
         case .denied: // 用户拒绝授权语音识别
         isButtonEnabled = false
         print("User denied access to speech recognition")
         
         case .restricted: // 设备不支持语音识别功能
         isButtonEnabled = false
         print("Speech recognition restricted on this device")
         
         case .notDetermined: // 结果未知 用户尚未进行选择
         isButtonEnabled = false
         print("Speech recognition not yet authorized")
         }
         
         OperationQueue.main.addOperation {
         self.PublishVoice.VoiceButton.isEnabled = isButtonEnabled
         }
         
         // Do any additional setup after loading the view.
         }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func startRecording1(){
        startRecording()
        PublishVoice.VoiceButton.setTitle("ing", for: .normal)
    }
    @objc func stopRecording1(){
        audioEngine!.stop()
        recognitionRequest?.endAudio()
        PublishVoice.VoiceButton.setTitle("stop", for: .normal)
    }
    
    func startRecording() {
        if recognitionTask != nil { /// 检查recognitionTask是否在运行，如果在就取消任务和识别
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance() /// 记录语音做准备
        do {
            
            try audioSession.setCategory(.playback, mode: .default, options: [])
            try audioSession.setMode(AVAudioSession.Mode.measurement)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't set because of an error.")
        }
        
        /// 实例化recognitionRequest 利用它把语音数据传到苹果后台
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        /// 检查audioEngine(你的设备)是否有做录音功能作为语音输入
        guard let inputNode = audioEngine?.inputNode else {
            fatalError("Audio engine has no input node")
        }
        
        
        /// 检查recognitionRequest对象是否被实例化或不是nil
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecongitionRequest object")
        }
        
        /// 当用户说话的时候让recognitionRequest报告语音识别的部分结果
        recognitionRequest.shouldReportPartialResults = true
        /// 向recognitionRequest增加一个语音输入。注意在开始了recognitionTask之后增加语音输入是OK的。SpeechFramework会在语音输入被加入的同时就开始进行解析识别
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        /// 准备并且开始audioEngine
        audioEngine!.prepare()
        
        do {
            try audioEngine!.start()
        } catch {
            print("audioEngine couldn't start because of an error")
        }
        
        /// 开启语音识别, 回调每次都会在识别引擎收到输入的时候，完善了当前识别的信息时候，或者被删除或者停止的时候被调用，最后会返回一个最终的文本
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
            var isFinal = false // 定义一个布尔值决定识别是否已经结束
            
            /// 如果结果result不是nil，把textView.text的值设置为我们的最优文本。如果结果是最终结果，设置isFinal为true
            if result != nil {
                //self.textview.text = result?.bestTranscription.formattedString
                self.PublishVoice.VoiceResult.text = result?.bestTranscription.formattedString
                isFinal = (result?.isFinal)!
            }
            /// 如果没有错误或者结果是最终结果，停止audioEngine(语音输入)并且停止recognitionRequest和recognitionTask
            if error != nil || isFinal {
                self.audioEngine!.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                
                self.PublishVoice.VoiceButton.isEnabled = true
            }
        })
        
        //self.textview.text = "Say something, I'm listening!"
        self.PublishVoice.VoiceResult.text = "Say something, I'm listening!"
    }
    
}



extension PublishVoiceViewController2: SFSpeechRecognizerDelegate {
    /// 可用性状态改变时被调用
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            self.PublishVoice.VoiceButton.isEnabled = true
        } else {
            self.PublishVoice.VoiceButton.isEnabled = false
        }
    }
}
