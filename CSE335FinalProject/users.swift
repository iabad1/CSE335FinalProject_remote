//
//  users.swift
//  CSE335FinalProject
//
//  Created by  on 4/22/22.
//

import Foundation
import UIKit

class Users{
    var username:String!
    var dateIdeas:[DateIdea]
    init(username: String, dateIdeas: [DateIdea]){
        self.username = username
        self.dateIdeas = dateIdeas
    }
    
}

class DateIdea{
    var title:String!
    var description:String!
    var location:String!
    var thumbnail:UIImage
    
    init(title:String, description:String, location:String, thumbnail:UIImage){
        self.title = title
        self.description = description
        self.location = location
        self.thumbnail = thumbnail
    }
}
