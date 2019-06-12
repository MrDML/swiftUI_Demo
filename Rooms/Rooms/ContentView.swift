//
//  ContentView.swift
//  Rooms
//
//  Created by mac on 2019/6/12.
//  Copyright © 2019 mac. All rights reserved.
//

import SwiftUI


// 在使用时，语句之间不能打存在注释，否则无法通过.联想提示代码
struct ContentView : View {
    
    //var rooms:[Room] = [];
    
    /*
     动态视图属性，自动订阅可绑定对象，在视图发生更改时使视图无效。
     */
    // @ObjectBinding var store = RoomStore()
   @ObjectBinding var store = RoomStore()
    
    var body: some View {
        // 设置 Navigation 视图
        NavigationView {
        
               /*
                     List(store.rooms) { room in
                             // Navigation 跳转设置,设置后右侧有跳转箭头
                             RoomCell(room: room)
             
                     }
                */
            
                List {
                        Section {
                            Button(action: addRoom) {
                                Text("Add Room")
                            }
                            
                        }
                    
                        Section {
                            
                            ForEach.init(store.rooms) { room in
                                RoomCell(room: room)
                            }
                            .onDelete(perform: delete)
                            .onMove(perform: move)
                        
                        }
                
                
                    }
                    .navigationBarItems(trailing: EditButton.init())
                    .listStyle(.grouped)
                    // 设置Navigation标题
                    /**
                     // 设置Navigation标题 (水平正常布局)
                     //               .navigationBarTitle(Text("Rooms"), displayMode: NavigationBarItem.TitleDisplayMode.inline)
                     */
                    
                    .navigationBarTitle(Text("Rooms"))
            
            
  
        }
       
    }
    
    func addRoom() {
        store.rooms.append(Room(name: "umbagog", capacity: 200, hasVideo: false))
        
    }
    
//    func delete(at offsets: IndexSet) {
//        store.rooms.remove(atOffsets: offsets) //Error: Incorrect argument label in call (have 'atOffsets:', expected 'at:')
//    }
//    func move(from source: IndexSet, to destination: Int) {
//        store.rooms.move(fromOffsets: source, toOffset: destination) //Error: Value of type '[Room]' has no member 'move'; did you mean 'remove'?
//    }
    
    // 这个移除存在问题
    func delete(at offsets: IndexSet) {
        offsets.sorted { $0 > $1 }.forEach { store.rooms.remove(at: $0) }
    
    }
    
    func move(from source: IndexSet, to destination: Int) {
        
    
        // 排序之后->遍历元素->在遍历元素时，插入要移除的元素
        source.sorted { $0 > $1 }.forEach { store.rooms.insert(store.rooms.remove(at: $0), at: destination) }
    }
    
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        // 假数据源传入视图
        //ContentView(rooms: testData)
        Group {
            ContentView(store:RoomStore(rooms:testData))
             ContentView(store:RoomStore(rooms:testData))
             .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(store:RoomStore(rooms:testData))
                .environment(\.colorScheme, .dark)
        }
    }
}
#endif

struct RoomCell : View {
    var room:Room
    var body: some View {
        return NavigationButton.init(destination: RoomDetail(room: room)) {
            
            Image.init(room.thumbailName)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            
            //Image.init(systemName: "photo")
            
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capacity) people")
                    //.font(.some(.system(size: 30))) 自定义修改
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                
            }
        }
    }
}
