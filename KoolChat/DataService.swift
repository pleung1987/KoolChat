//
//  DataService.swift
//  KoolChat
//
//  Created by Patrick Leung on 30/3/2017.
//  Copyright © 2017 Patrick Leung. All rights reserved.
//


let FIR_CHILD_USERS = "users"

import Foundation
import FirebaseDatabase
import FirebaseStorage

class DataService {
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    var usersRef: FIRDatabaseReference {
        return mainRef.child(FIR_CHILD_USERS)
    }
    
    var mainStorageRef: FIRStorageReference {
        return FIRStorage.storage().reference(forURL: "gs://koolchat-4d128.appspot.com")
    }
    
    var imagesStorageRef: FIRStorageReference {
        return mainStorageRef.child("images")
    }
    
    var videoStorageRef: FIRStorageReference {
        return mainStorageRef.child("videos")
    }
    
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, AnyObject> = ["firstName": "" as AnyObject, "lastName": "" as AnyObject]
        mainRef.child(FIR_CHILD_USERS).child(uid).child("profile").setValue(profile)
    }
    
    func sendMediaPullRequest(senderUID: String, sendingTo: Dictionary<String,User>,_: (), mediaURL: URL, textSnippet: String? = nil){
        
        var uids = [String]()
        for uid in sendingTo.keys{
            uids.append(uid)
        }
        
        var pr: Dictionary<String, AnyObject> = ["mediaURL":mediaURL.absoluteString as AnyObject, "userID":senderUID as AnyObject, "openCount":0 as AnyObject, "recipients": uids as AnyObject]
        
        mainRef.child("pullRequests").childByAutoId().setValue(pr)
    }
}
