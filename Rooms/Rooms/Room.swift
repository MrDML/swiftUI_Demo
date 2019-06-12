//
//  Room.swift
//  Rooms
//
//  Created by mac on 2019/6/12.
//  Copyright © 2019 mac. All rights reserved.
//

import SwiftUI

// Identifiable 继承这个协议可以进行j比较操作
struct Room:Identifiable {
    
    var id = UUID.init()
    var name: String
    var capacity: Int
    var hasVideo: Bool
    // 计算型属性
    var imageName:String{
        return  name;
    }
    var thumbailName:String{
        return name + "_Thumb"
    }
    
}

#if DEBUG
let testData = [
    
    
    Room.init(name: "chilkoottrail", capacity: 6,hasVideo:true),
    Room.init(name: "chincoteague", capacity: 8,hasVideo:false),
    Room.init(name: "hiddenlake", capacity: 16,hasVideo:true),
    Room.init(name: "icybay", capacity: 10,hasVideo:true),
    Room.init(name: "turtlerock", capacity: 12,hasVideo:false),
    Room.init(name: "lakemcdonald", capacity: 8,hasVideo:false),
    Room.init(name: "rainbowlake", capacity: 10,hasVideo:true),
    Room.init(name: "silversalmoncreek", capacity: 7,hasVideo:false),
    Room.init(name: "stmarylake", capacity: 1,hasVideo:false),
   
]
#endif
