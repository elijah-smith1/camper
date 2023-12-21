//
//  User Post View.swift
//  OnCampApp
//
//  Created by Michael Washington on 10/14/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore


struct UserPostsView: View {
    @StateObject var viewmodel = ProfileViewModel()
    @State var userPosts = [Post]()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(viewmodel.userPosts, id: \.id) { post in
                        PostCell(post: post)
                    
                    }
                }
            }
        }




        }

    }

struct UserPostsViewPreviews: PreviewProvider {
    static var previews: some View {
        UserPostsView()
          
    }
}
