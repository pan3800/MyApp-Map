//
//  Account.swift
//  MyApp-Map
//
//  Created by 임채성 on 2024/10/07.
//

import SwiftUI
import GoogleSignIn

struct AccountView: View {
    @EnvironmentObject var authManager: AuthManager
    var body: some View {
        VStack {
            Text("Google 소셜 로그인 성공")

            Button {
                authManager.signOut()
                print("로그아웃 성공")
            } label: {
                Text("로그아웃하기")
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
