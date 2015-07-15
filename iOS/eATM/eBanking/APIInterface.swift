//
//  APIInterface.swift
//  eBanking
//
//  Created by Tai Huu Ho on 7/15/15.
//  Copyright (c) 2015 Tai Huu Ho. All rights reserved.
//

import Foundation

typealias APICompletionHandler = (NSDictionary!, NSError!) -> ()

protocol APIInteface{

    func login(username: String!, password: String!, completionBlock : APICompletionHandler)
    
}