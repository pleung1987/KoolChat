//
//  User.swift
//  KoolChat
//
//  Created by Patrick Leung on 30/3/2017.
//  Copyright © 2017 Patrick Leung. All rights reserved.
//

import UIKit

struct User {
    private var _firstName: String
    private var _uid: String
    
    var uid: String{
        return _uid
    }
    
    var firstName: String {
        return _firstName
    }
    
    init(uid: String, firstName: String) {
        _uid = uid
        _firstName = firstName
    }
    
}
