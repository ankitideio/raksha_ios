//
//  Store.swift
//  Raksha
//
//  Created by Ideio Soft on 04/12/24.
//

import Foundation
import UIKit

class Store {
    class var authKey: String?{
        set{
            Store.saveValue(newValue, .authKey)
        }get{
            return Store.getValue(.authKey) as? String
        }
    }
  
    class var selectTabItem: Int?{
        set{
            Store.saveValue(newValue, .selectTabItem)
        }get{
            return Store.getValue(.selectTabItem) as? Int
        }
    }
    
    static var remove: DefaultKeys!{
        didSet{
            Store.removeKey(remove)
        }
    }
    
    //MARK:-  Private Functions
    
    private class func removeKey(_ key: DefaultKeys){
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        if key == .userDetails{
            UserDefaults.standard.removeObject(forKey: DefaultKeys.authKey.rawValue)
        }
        UserDefaults.standard.synchronize()
    }
    
    private class func saveValue(_ value: Any? ,_ key:DefaultKeys){
        var data: Data?
        if let value = value{
//            data = NSKeyedArchiver.archivedData(withRootObject: value)
            data = try? NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: true)
        }
        UserDefaults.standard.set(data, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    
 
    //For model
    private class func saveUserDetails<T: Codable>(_ value: T?, _ key: DefaultKeys){
        var data: Data?
        if let value = value{
            data = try? PropertyListEncoder().encode(value)
        }
        Store.saveValue(data, key)
    }
    
    private class func getUserDetails<T: Codable>(_ key: DefaultKeys) -> T?{
        if let data = self.getValue(key) as? Data{
            let loginModel = try? PropertyListDecoder().decode(T.self, from: data)
            return loginModel
        }
        return nil
    }
    
    private class func getValue(_ key: DefaultKeys) -> Any{
        if let data = UserDefaults.standard.value(forKey: key.rawValue) as? Data{
            if let value = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
            {
                return value
            }
            else{
                return ""
            }
        }else{
            return ""
        }
    }
}
