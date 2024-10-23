//
//  ContentView.swift
//  MyApp-Map
//
//  Created by 임채성 on 2024/10/02.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        VStack {
            if authManager.currentAuthUser != nil{
                MainTabView()
            } else {
                LoginView()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
