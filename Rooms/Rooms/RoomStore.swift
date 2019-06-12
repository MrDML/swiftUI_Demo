//
//  RoomStore.swift
//  Rooms
//
//  Created by mac on 2019/6/12.
//  Copyright © 2019 mac. All rights reserved.
//

import SwiftUI
import Combine

// 绑定数据源
class RoomStore: BindableObject {
   
    var rooms: [Room]{
        didSet{
            /*
             摘要
             
             向订户发送完成信号。
             宣言
             
             func send（完成：Subscribers.Completion <Self.Failure>）
             参数
             
             完成
             一个Completion实例，指示发布是正常完成还是失败并显示错误。
             */
            didChange.send(completion: Subscribers.Completion<Never>.finished)
            print("=didChange=")
        }
    }
    init(rooms:[Room] = []) {
        self.rooms = rooms
    }
    
    /*
     摘要
     
     传递价值和完成的主题。
     宣言
     
     final class PassthroughSubject <输出，失败>其中失败：错误
     讨论
     
     如果您希望发布者在测试期间按需发布特定值，请在单元测试中使用PassthroughSubject。
     
     */
    var didChange = PassthroughSubject<Void,Never>()
    
}
