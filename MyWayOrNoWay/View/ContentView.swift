//
//  ContentView.swift
//  MyWayOrNoWay
//
//  Created by Akshay Nandane on 04/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(
            selection: $selectedTab,
            content: {
                TableView()
                .tabItem({
                    Text("Tab no. 1")
                })
                .tag(0)
            
            Text("Tab2")
                .tabItem({
                    Text("Tab no. 2")
                })
                .tag(1)
                
            Text("Tab3")
                .tabItem({
                    Text("Tab no. 3")
                })
                .tag(2)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
