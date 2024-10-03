//
//  AuthManager.swift
//  MyApp-Map
//
//  Created by 임채성 on 2024/10/03.
//

import Foundation
import Firebase
import GoogleSignIn

class AuthManager: ObservableObject {
    
    @Published var signState: signState = .signOut
       
       enum signState {
           case signIn
           case signOut
       }
       
       func googleSignIn () {
           
           // 코드는 사용자가 이전에 Google 계정으로 성공적으로 로그인한 적이 있는지 확인하는 메서드
           if GIDSignIn.sharedInstance.hasPreviousSignIn() {
               GIDSignIn.sharedInstance.restorePreviousSignIn() { [unowned self] user, error in
                   authenticateUser(for: user, with: error)
               }
           } else {
               guard let clientID = FirebaseApp.app()?.options.clientID else { return }
               let configuration = GIDConfiguration(clientID: clientID)
               
               // Google 로그인과 관련된 설정 정보를 담고 있는 속성
               GIDSignIn.sharedInstance.configuration = configuration
               
               guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
               guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
               
               GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [unowned self] result, error in
                   guard let result = result else { return }
                   authenticateUser(for: result.user, with: error)
               }
               
           }
       }
       
       func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
           
           if let error = error {
               print(error.localizedDescription)
               return
           }
           
           guard let accessToken = user?.accessToken.tokenString, let idToken = user?.idToken?.tokenString else { return }
           
           print("accessToken:", accessToken)
           print("idToken:", idToken)
           
           let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
           
           Auth.auth().signIn(with: credential) { (_, error) in
               if let error = error {
                   print(error.localizedDescription)
               } else {
                   self.signState = .signIn
                   print("로그인 성공")
               }
           }
       }
       
       func signOut() {
           GIDSignIn.sharedInstance.signOut()
           
           do {
               try Auth.auth().signOut()
               self.signState = .signOut
           } catch {
               print(error.localizedDescription)
           }
       }
    
    
}
