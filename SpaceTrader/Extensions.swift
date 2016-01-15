//
//  Workaround.swift
//  DataPersist
//
//  Created by Marc Auger on 1/11/16.
//  Copyright © 2016 Marc Auger. All rights reserved.
//

import Foundation

extension String {
    
    var lastPathComponent: String {
        
        get {
            return (self as NSString).lastPathComponent
        }
    }
    var pathExtension: String {
        
        get {
            
            return (self as NSString).pathExtension
        }
    }
    var stringByDeletingLastPathComponent: String {
        
        get {
            
            return (self as NSString).stringByDeletingLastPathComponent
        }
    }
    var stringByDeletingPathExtension: String {
        
        get {
            
            return (self as NSString).stringByDeletingPathExtension
        }
    }
    var pathComponents: [String] {
        
        get {
            
            return (self as NSString).pathComponents
        }
    }
    
    func stringByAppendingPathComponent(path: String) -> String {
        
        let nsSt = self as NSString
        
        return nsSt.stringByAppendingPathComponent(path)
    }
    
    func stringByAppendingPathExtension(ext: String) -> String? {
        
        let nsSt = self as NSString
        
        return nsSt.stringByAppendingPathExtension(ext)
    }
}

// patch for NSCoding enums
protocol NSCodableEnum {
    func int() -> Int;
    init?(rawValue:Int);
    init(defaultValue:Any)
}
extension NSCoder {
    func encodeEnum(e:T, forKey:String) {
        self.encodeInteger(e.int(), forKey: forKey)
    };
    func decodeEnum(forKey:String) -> T {
        if let t = T(rawValue:self.decodeIntegerForKey(forKey)) {
            return t
        } else {
            return T(defaultValue:0)
        }
    }
}