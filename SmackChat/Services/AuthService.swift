//
//  AuthService.swift
//  SmackChat
//
//  Created by Samiul Haque on 8/8/19.
//  Copyright © 2019 Samiul Haque. All rights reserved.
//

import Foundation
import Alamofire

class AuthService
{
    static let instance = AuthService() //Singleton
    //At runtime, you use UserDefaults objects to read the defaults that your app uses from a user’s defaults database. UserDefaults caches the information to avoid having to open the user’s defaults database each time you need a default value
    let defaults = UserDefaults.standard
    
    var isLoggedin : Bool{
        get{
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set{
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
            
        }
        
    }
    
    var authToken:String
    {
        get
        {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set
        {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    var userEmail : String
    {
        get
        {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set
        {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    
    //@escaping -> When passing a closure as the function argument, the closure is being preserve to be execute later and function’s body gets executed
    
    func registerUser(email: String, password: String , completion: @escaping CompletionHandler)
    {
       let lowercaseEmail = email.lowercased()
        let header = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        let body : [String:Any] = [
            "email": lowercaseEmail ,
            "password": password
        ]
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString {
            (response) in
            if response.result.error == nil{
                completion(true)
            }
            else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
