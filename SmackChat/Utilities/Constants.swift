//
//  Constants.swift
//  SmackChat
//
//  Created by Samiul Haque on 8/8/19.
//  Copyright © 2019 Samiul Haque. All rights reserved.
//

import Foundation

//Authentication
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//URLs
let BASE_URL = "https://realtimechittychat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"

//ALAMOFIRE
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]



//Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks
typealias CompletionHandler = (_ Success:Bool) -> () //Lambda Expression


