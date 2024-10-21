//
//  MainTabView.swift
//  MyApp-Map
//
//  Created by 임채성 on 2024/10/06.
//

import SwiftUI

struct MainTabView: View {
    @State var tabIndex = 2
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        TabView(selection: $tabIndex) {
            Text("Feed")
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            ProfileView()
                .environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "person.circle")
                }
                .tag(2)
        }
    }
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}
