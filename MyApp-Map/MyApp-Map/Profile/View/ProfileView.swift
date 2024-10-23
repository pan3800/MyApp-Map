//
//  MainView.swift
//  MyApp-Map
//
//  Created by 임채성 on 2024/10/04.
//

import SwiftUI
import GoogleSignIn
import Kingfisher

struct ProfileView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                if let imageUrl = viewModel.userProfileImage {
                        KFImage(imageUrl)
                            .resizable()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .padding(.bottom, 10)
                                  
                } else {
                    Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .foregroundStyle(Color(.systemGray3))
                            .clipShape(Circle())
                            .padding(.bottom, 10)
                }
                
                VStack{
                    Text("\(viewModel.userName)")
                    Text("\(viewModel.userEmail)")
                }
            }
            
            Spacer()
            
            VStack {
                AccountView()
            }
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
