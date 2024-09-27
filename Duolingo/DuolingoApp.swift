//
//  DuolingoApp.swift
//  Duolingo
//
//  Created by 辻孝弥 on 2024/09/22.
//

import SwiftUI

@main
struct DuolingoApp: App {
@State var isActive: Bool = false
var body: some Scene {
    WindowGroup {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color(UIColor(red: 88/255, green: 204/255, blue: 0/255, alpha: 1.0))
                    .ignoresSafeArea()
                Image("DuolingoIcon")
                    .resizable()
                    .frame(width: 140, height: 140, alignment: .center)
                VStack {
                    Spacer()
                    Text("duolingo")
                        .padding()
                        .font(Font.custom("Coiny-Regular", size: 50))
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
}
