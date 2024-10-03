//
//  LoginView.swift
//  MyApp-Map
//
//  Created by 임채성 on 2024/10/03.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        VStack {
            
            Image("KakaoTalk_Photo_2024-09-19-15-14-53")
                .resizable()
                .frame(width: 75, height: 75)
                .clipShape(Circle())
            
            Text("Click in Login")
            
            Button {
                authManager.googleSignIn()
            } label: {
                Text("Google 버튼")
                    .frame(width: 250, height: 150)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
