//
//  RoomDetail.swift
//  Rooms
//
//  Created by mac on 2019/6/12.
//  Copyright © 2019 mac. All rights reserved.
//

import SwiftUI

struct RoomDetail : View {
    
    let room:Room
    /*
     摘要
     
     给定类型的持久值，视图通过该值读取和监视值。
     宣言
     
     struct State <Value>
     讨论
     
     SwiftUI管理您声明为状态的任何属性的存储。 当状态值更改时，视图使其外观无效并重新计算正文。 使用状态作为给定视图的单一事实来源。
     状态实例不是价值本身; 它是一种阅读和改变价值的手段。 要访问状态的基础值，请使用其value属性。
     仅从视图主体内部（或从其调用的函数）访问状态属性。 因此，您应该将州属性声明为私有，以防止视图的客户端访问它。
     您可以从具有`binding`属性的状态获取绑定，或者使用`$`前缀运算符。
     */
    @State private var zoomed = false // 当该属性值发生变化时，视图会被重新加载
    
    
    /**@Binding
     摘要
     
     一个值的管理器，提供一种改变它的方法。
     宣言
     
     struct Binding <Value>
     讨论
     
     使用绑定在视图及其基础模型之间创建双向连接。 例如，您可以在State的Toggle和Bool属性之间创建绑定。 与切换控件交互会更改Bool的值，并且改变Bool的值会导致切换更新其呈现状态。
     您可以通过访问其绑定属性从状态获取绑定。 您还可以将$ prefix运算符与State的任何属性一起使用来创建绑定。
     
     */
    
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Image.init(room.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill: .fit)
                .navigationBarTitle(Text(room.name),displayMode: .inline)
                .tapAction {
                    // toggle()该函数 可以将 self.zoomed 点击一次设置为true zai
                    withAnimation(.basic(duration: 1, curve: BasicAnimationTimingCurve.easeInOut)) {self.zoomed.toggle()}
                }
                .frame(minWidth:0,maxWidth:.infinity,minHeight:0,maxHeight:.infinity)
            
                if room.hasVideo && !zoomed{
                    Image.init(systemName: "video.fill")
                        .font(.title)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .transition(.move(edge: .leading))
                }
        }
    }
}

#if DEBUG
struct RoomDetail_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {RoomDetail(room:testData[0])}
            NavigationView {RoomDetail(room:testData[1])}
        }
        
        
    }
}
#endif
