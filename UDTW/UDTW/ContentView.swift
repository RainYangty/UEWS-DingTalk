//
//  ContentView.swift
//  UDTW
//
//  Created by RainYang on 2023/8/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List() {
                ListView()
                    .environmentObject(Network())
                    .navigationTitle("")
                    .navigationBarHidden(true)
            }
        } detail: {
            WebView(url: URL(string: "https://bousai.cn/CEIV2-bousai/index.html")!)
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("")
                .navigationBarHidden(true)
        }.background(Color(.black))
            //ListView()
            //    .environmentObject(Network())
    }
}

#Preview {
    ContentView()
}
