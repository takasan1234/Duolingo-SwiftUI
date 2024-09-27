//
//  ContentView.swift
//  Duolingo
//
//  Created by 辻孝弥 on 2024/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomTabView()
    }
}

#Preview {
    ContentView()
}

struct CustomTabView: View {
    @State private var selectedTab: Int = 0
    @State private var labelHeight = CGFloat.zero
    @State private var section_num = 1
    
    let tabs = ["Home", "Search", "Notifications", "Messages", "Profile", "Settings"]
    
    var body: some View {
        VStack {
            // タブに対応するビュー
            
            switch selectedTab {
            case 0:
                HomeView(section_num: section_num, unit_num: 1)
            case 1:
                SearchView()
            case 2:
                NotificationsView()
            case 3:
                MessagesView()
            case 4:
                ProfileView()
            case 5:
                SettingsView()
            default:
                HomeView(section_num: 1, unit_num: 1)
            }
            
            // カスタムタブバー
            HStack {
                ForEach(0..<tabs.count, id: \.self) { index in
                    Spacer()
                    Button(action: {
                        selectedTab = index
                    }) {
                        VStack {
                            Image(systemName: "circle.fill") // タブアイコン
                            Text(tabs[index])
                        }
                    }
                    Spacer()
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2)) // 背景色を設定
        }
    }
}

// 各タブに対応するビューの例
struct HomeView: View {
    var section_num: Int
    var unit_num: Int
    
    var body: some View {
        NavigationView {
            ScrollView  {
                VStack {
                    ForEach(1...8, id: \.self) { component_num in
                        NavigationLink {
                            QuizCorner(section_num: section_num, unit_num: unit_num, component_num: component_num)
                        } label: {
                            
                            HStack {
                                Spacer()
                                ComponentButton(buttonType: "star", isActive: false)
                                    .padding()
                                Spacer()
                            }
                        }
                    }
                    
                    .frame(minWidth: 0)
                }
            }
        }
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search View")
    }
}

struct NotificationsView: View {
    var body: some View {
        Text("Notifications View")
    }
}

struct MessagesView: View {
    var body: some View {
        Text("Messages View")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings View")
    }
}



