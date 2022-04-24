//
//  users.swift
//  CSE335FinalProject
//
//  Created by  on 4/22/22.
//

import Foundation
import UIKit



class User{
    var username:String!
    var dateIdeas:[DateIdea]
    init(username: String, dateIdeas: [DateIdea]){
        self.username = username
        self.dateIdeas = dateIdeas
    }
    
}
class DateIdeas{
    
    var dateIdeas:[DateIdea] = []
    init(){
        let date1 = DateIdea(title: "Picnic at the Park", description: "Enjoy your time at the park with your loved one!", location: "Tempe", thumbnail: "heart_full.png")
        dateIdeas.append(date1)
    }
    
    func getCount() -> Int{
        return dateIdeas.count
    }
    
    func getDateObject(item:Int) -> DateIdea{
        return dateIdeas[item]
    }
    
    func addDateIdea(title:String, description:String, location:String, thumbnail:String)-> DateIdea{
        
        let oneDate = DateIdea(title: title, description: description, location: location, thumbnail: thumbnail)
        dateIdeas.append(oneDate)
        return oneDate
        
    }
    
    func removeDateObject(item:Int){
        dateIdeas.remove(at: item)
    }
    
    
}
class DateIdea{
    var title:String?
    var description:String?
    var location:String?
    var thumbnail:String?
    
    init(title:String, description:String, location:String, thumbnail:String){
        self.title = title
        self.description = description
        self.location = location
        self.thumbnail = thumbnail
    }
}


