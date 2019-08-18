//
//  AuthService.swift
//  SmackChat
//
//  Created by Samiul Haque on 8/8/19.
//  Copyright © 2019 Samiul Haque. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService
{
    static let instance = AuthService() //Singleton
    
    //At runtime, you use UserDefaults objects to read the defaults that your app uses from a user’s default database. UserDefaults caches the information to avoid having to open the user’s defaults database each time you need a default value.
    //Most Simple way of saving Data in your app.
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
    
    
    //@escaping -> When passing a closure as the function argument, the @escaping-closure is being preserve to be execute later and function’s body gets executed.
    
    func registerUser(email: String, password: String , completion: @escaping CompletionHandler)
    {
       let lowercaseEmail = email.lowercased()
        
        
        let body : [String:Any] = [
            "email": lowercaseEmail ,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString {
            (response) in
            if response.result.error == nil{
                //We wait for the API response (@escaping keyword) and then finally we pass true in the closure if there's no error
                completion(true)
                
            }
            else {
                //Or else we debugPrint the type of error in the response from the API
                completion(false)
                debugPrint(response.result.error as Any)
                
            }
        }
    }
    func loginUser(email: String, password: String , completion: @escaping CompletionHandler)
    {
        let lowercaseEmail = email.lowercased()
        
        
        let body : [String:Any] = [
            "email": lowercaseEmail ,
            "password": password
        ]
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON {
            (response) in
            if response.result.error == nil
            { 
//                if let json = response.result.value as? Dictionary<String,Any>
//                {
//                    if let email = json["user"] as? String
//                    {
//                        self.userEmail = email
//                    }
//                    if let token = json["token"] as? String
//                    {
//                        self.authToken = token
//                    }
//                }
                
                //Using SwiftyJSON
                guard let data = response.data else{ return }
                let json = JSON(data: data)
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue
                
                self.isLoggedin = true
                completion(true)
            }
            else
            {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
