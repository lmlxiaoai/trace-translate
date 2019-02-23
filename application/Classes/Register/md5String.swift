//
//  1.swift
//  application
//
//  Created by lmlxiaoai on 2019/2/18.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import CommonCrypto


extension String {
    /*func md5() -> String {
     let str = self.cString(using: String.Encoding.utf8)
     let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
     let digestLen = Int(CC_MD5_DIGEST_LENGTH)
     let result = UnsafeMutablePointer<Any>.allocate(capacity: digestLen)
     CC_MD5(str!, strLen, result)
     let hash = NSMutableString()
     for i in 0 ..< digestLen {hash.appendFormat("%02x", result[i] as! CVarArg)}
     result.deinitialize()
     return String(format: hash as String)
     
     }*/
    
    func md5String() -> String{
        let cStr = self.cString(using: String.Encoding.utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
}

