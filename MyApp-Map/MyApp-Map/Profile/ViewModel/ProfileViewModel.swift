//
//  ProfileViewModel.swift
//  MyApp-Map
//
//  Created by 임채성 on 2024/10/07.
//

import Foundation
import Firebase
import GoogleSignIn

class ProfileViewModel: ObservableObject {
    
    static let shared = ProfileViewModel()
    
    @Published var userName: String = ""
    @Published var userEmail: String = ""
    @Published var userProfileImage: URL?
    
    
    init() {
        fetchGoogleUserInfo()
        
    }
    
    func fetchGoogleUserInfo() {
        if let user = GIDSignIn.sharedInstance.currentUser {
            self.userName = user.profile?.name ?? "No Name"
            self.userEmail = user.profile?.email ?? "No Email"
            if user.profile?.hasImage == true {
                self.userProfileImage = user.profile?.imageURL(withDimension: 100)
            }
        } else {
            print("User not signed in")
        }
    }
}
