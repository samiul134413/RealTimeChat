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

//Type Alias for bool returning Completion Handler
typealias CompletionHandler = (_ Success:Bool) -> ()


