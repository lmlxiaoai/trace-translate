//
//  CameraViewController.swift
//  NewsTabbar
//
//  Created by lmlxiaoai on 2019/1/18.
//  Copyright © 2019 jiayuqiang. All rights reserved.
//

import UIKit
import SwiftyJSON

class CameraViewController: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let imagePicker = UIImagePickerController()
    let session = URLSession.shared
    var cameraview = CameraView()
    /*
    @IBOutlet weak var imageView: UIImageView!
    //@IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var labelResults: UITextView!
    @IBOutlet weak var landmarkResults: UITextView!
    @IBOutlet weak var textResults: UITextView!
    */
    var googleAPIKey = "AIzaSyAz2cZ3vfAQY3yoNTaqxao7B_27O1p-Nvw"
    //var googleAPIKey = "YOUR_API_KEY"
    var googleURL: URL {
        return URL(string: "https://vision.googleapis.com/v1/images:annotate?key=\(googleAPIKey)")!
    }
    //https://vision.googleapis.com/v1/images:annotate?key=\("FC502-8AD82-08D4P-4FQEE-ZC8D0")
    /*
    @IBAction func loadImageButtonTapped(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraview.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        self.view.addSubview(cameraview)
        // Do any additional setup after loading the view, typically from a nib.
        imagePicker.delegate = self
        //view.labelResults.isHidden = true
        cameraview.ImageView.isHidden = true
        //cameraview.LandmarkResults.isHidden = true
        //cameraview.TextResults.isHidden = true
        //spinner.hidesWhenStopped = true
        
        cameraview.ChooseButton.addTarget(self, action: #selector(ChooseButtonAction), for: .touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func ChooseButtonAction() {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
}



/// Image processing

extension CameraViewController {
    
    func analyzeResults(_ dataToParse: Data) {
        
        // Update UI on the main thread
        DispatchQueue.main.async(execute: {
            
            
            // Use SwiftyJSON to parse results
            let json = JSON(data: dataToParse)
            let errorObj: JSON = json["error"]
            
            //self.spinner.stopAnimating()
            self.cameraview.ImageView.isHidden = false
            //self.labelResults.isHidden = false
            //self.cameraview.LandmarkResults.isHidden = false
            self.cameraview.LandmarkResults.text = ""
            //self.cameraview.TextResults.isHidden = false
            self.cameraview.TextResults.text = ""
            
            // Check for errors
            
            if (errorObj.dictionaryValue != [:]) {
                self.cameraview.LabelResults.text = "Error code \(errorObj["code"]): \(errorObj["message"])"
            } else {
                // Parse the response
                print(json)
                let responses: JSON = json["responses"][0]
                
                
                // Get lable annotations
                let labelAnnotations: JSON = responses["localizedObjectAnnotations"]
                //let labelAnnotations: JSON = responses["lableAnnotations"]
                let numLabels: Int = labelAnnotations.count
                var labels: Array<String> = []
                if numLabels > 0 {
                    var labelResultsText:String = "Labels found: "
                    for index in 0..<numLabels {
                        //let label = labelAnnotations[index]["description"].stringValue
                        let label = labelAnnotations[index]["name"].stringValue
                        labels.append(label)
                    }
                    for label in labels {
                        // if it's not the last item add a comma
                        if labels[labels.count - 1] != label {
                            labelResultsText += "\(label), "
                        } else {
                            labelResultsText += "\(label)"
                        }
                    }
                    //self.cameraview.LabelResults.text = labelResultsText
                } else {
                    //self.cameraview.LabelResults.text = "No labels found"
                }
 
                // Get landmark annotations
                let landmarkAnnotations: JSON = responses["landmarkAnnotations"]
                let numLandmarks: Int = landmarkAnnotations.count
                var landmarks: Array<String> = []
                if numLandmarks > 0 {
                    var landmarkResultsText:String = "景点坐标: \n"
                    for index in 0..<numLandmarks {
                        //let label = labelAnnotations[index]["description"].stringValue
                        let landmark = landmarkAnnotations[index]["location"]["latLng"]["longitude"].stringValue
                        landmarks.append(landmark)
                    }
                    for landmark in landmarks {
                        // if it's not the last item add a comma
                        if landmarks[landmarks.count - 1] != landmark {
                            landmarkResultsText += "\(landmark), "
                        } else {
                            landmarkResultsText += "\(landmark)"
                        }
                    }
                    self.cameraview.LandmarkResults.text = landmarkResultsText
                } else {
                    self.cameraview.LandmarkResults.isHidden = true
                    self.cameraview.LandmarkResults.text = ""
                }
                
                // Get text annotations
                let textAnnotations: JSON = responses["landmarkAnnotations"]
                let numTexts: Int = textAnnotations.count
                var texts: Array<String> = []
                if numTexts > 0 {
                    var textResultsText:String? = nil
                    for index in 1..<numTexts {
                        let text = landmarkAnnotations[index]["description"].stringValue
                        //texts.append(text)?
                        texts.append(text)
                    }
                    for text in texts {
                        // if it's not the last item add a comma
                        /*if texts[texts.count - 1] != text {
                         textResultsText += "\(text) "
                         } else {
                         labelResultsText += "\(label)"
                         }*/
                        textResultsText = "\(text)"
                    }
                    self.cameraview.TextResults.text = textResultsText
                } else {
                    self.cameraview.TextResults.text = "未识别"
                }
            }
        })
        
    }
    
    /*func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [/*String*/UIImagePickerController.InfoKey : Any]) {
     if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
     
     imageView.contentMode = .scaleAspectFit
     imageView.isHidden = true // You could optionally display the image here by setting imageView.image = pickedImage
     spinner.startAnimating()
     faceResults.isHidden = true
     labelResults.isHidden = true
     
     // Base64 encode the image and create the request
     let binaryImageData = base64EncodeImage(pickedImage)
     createRequest(with: binaryImageData)
     }
     
     dismiss(animated: true, completion: nil)
     }*/
    
    //正确的写法
    //MARK: - UIImagePickerControllerDelegate、UINavigationControllerDelegate
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //UIImagePickerControllerOriginalImage  原始图像
        //UIImagePickerControllerEditedImage    编辑后的图片(开启编辑该对象才存在)
        
        self.dismiss(animated: true, completion: {
            var img:UIImage? = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            if picker.allowsEditing {
                img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            }
            //
            self.cameraview.ChooseButton.isHidden = true
            self.cameraview.ImageView.isHidden = false
            self.cameraview.ImageView.image = img
            //
            let binaryImageData = self.base64EncodeImage(img!)
            //print(binaryImageData)
            self.createRequest(with: binaryImageData)
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func resizeImage(_ imageSize: CGSize, image: UIImage) -> Data {
        UIGraphicsBeginImageContext(imageSize)
        image.draw(in: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        let resizedImage = newImage!.pngData()
        UIGraphicsEndImageContext()
        return resizedImage!
    }
}


/// Networking

extension CameraViewController {
    func base64EncodeImage(_ image: UIImage) -> String {
        var imagedata = image.pngData()
        
        // Resize the image if it exceeds the 2MB API limit
        if (imagedata?.count > 2097152) {
            let oldSize: CGSize = image.size
            let newSize: CGSize = CGSize(width: 800, height: oldSize.height / oldSize.width * 800)
            imagedata = resizeImage(newSize, image: image)
        }
        
        return imagedata!.base64EncodedString(options: .endLineWithCarriageReturn)
    }
    
    func createRequest(with imageBase64: String) {
        // Create our request URL
        
        var request = URLRequest(url: googleURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(Bundle.main.bundleIdentifier ?? "", forHTTPHeaderField: "X-Ios-Bundle-Identifier")
        
        // Build our API request
        let jsonRequest = [
            "requests": [
                "image": [
                    "content": imageBase64
                ],
                "features": [
                    /*[
                     "type": "LABEL_DETECTION",
                     "maxResults": 10
                     ],*/
                    [
                        "type": "OBJECT_LOCALIZATION",
                        "maxResults": 10
                    ],
                    /*[
                     "type": "FACE_DETECTION",
                     "maxResults": 10
                     ]*/
                    [
                        "type": "LANDMARK_DETECTION",
                        "maxResults": 10
                    ],
                    [
                        "type": "TEXT_DETECTION",
                        "maxResults": 10
                    ]
                ]
            ]
        ]
        // let jsonObject = JSON(jsonDictionary: jsonRequest)
        let jsonObject = JSON(jsonRequest)
        // Serialize the JSONim
        guard let data = try? jsonObject.rawData() else {
            return
        }
        
        request.httpBody = data
        
        // Run the request on a background thread
        DispatchQueue.global().async { self.runRequestOnBackgroundThread(request) }
    }
    
    func runRequestOnBackgroundThread(_ request: URLRequest) {
        // run the request
        
        let task: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            self.analyzeResults(data)
        }
        
        task.resume()
    }
}


// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}
