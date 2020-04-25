//
//  ContentView.swift
//  Bonus_whocanhelp
//
//  Created by 王瑋 on 2020/4/21.
//  Copyright © 2020 王瑋. All rights reserved.
//

import SwiftUI
struct pic {
    var img: String
    var name: String
    var description: String
}
struct ContentView: View {
    let roles: [pic] = [
        pic(img: "1", name: "1", description: "SpiderCat"),
        pic(img: "2", name: "2", description: "DeadPoolCat"),
        pic(img: "3", name: "3", description: "VenomCat"),
        pic(img: "4", name: "4", description: "ThanosCat"),
        pic(img: "5", name: "5", description: "MarvelCat")
    ]
    
    @State private var pickindex = 0
    
    var body: some View {
        ZStack{
            
            Image("background")
                .resizable()
                .scaledToFill()
            
            HStack{
                Button(action:{
                    let randNum = 0 ..< self.roles.count
                    self.pickindex = randNum.randomElement()!
                }){
                    Image(systemName:"questionmark.square.fill")
                        .font(.system(size: 40))
                        .padding()
                }
                
                Picker(selection: $pickindex, label: Text("")) {
                    ForEach(0 ..< roles.count) { i in
                        Text(self.roles[i].name).tag(i)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.gray)
                .border(Color.white)
                .frame(width:250)
            }.offset(y:70)
            
            Image("\(roles[pickindex].img)")
                .resizable()
                .scaledToFit()
                .frame(width:300)
                .offset(x:-50,y:280)
            
            Text("\(roles[pickindex].description)")
                .offset(x:0,y:-60)
                .font(.system(size: 38))
                .foregroundColor(Color.white)
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
