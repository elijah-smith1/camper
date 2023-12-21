//
//  ProfileViewModel.swift
//  OnCampApp
//
//  Created by Elijah Smith on 11/7/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var userPosts: [Post] = []
    @Published var userReposts: [Post] = []
    @Published var userLikes: [Post] = []
    var uid = Auth.auth().currentUser!.uid
    
    
    init() {
        Task{
           try await fetchUserPostData()
            print("Debug:: REPOSTS \(self.userReposts)")
            print("Debug:: Likes \(self.userLikes)")
            print("Debug:: POSTS \(self.userPosts)")
        }
    }
  

    func fetchUserPostData() async throws {
        do {
           
            let userPostIDs = try await PostData.fetchPostsforUID(Uid: uid )
            self.userPosts = try await PostData.fetchPostData(for: userPostIDs)
        } catch {
            
            
            print("Error fetching user posts: \(error)")
        }
        
        do {
      
            let userRepostIDs = try await PostData.fetchRepostsforUID(Uid: uid )
            self.userReposts = try await PostData.fetchPostData(for: userRepostIDs)
        } catch {
            
            
            print("Error fetching user reposts: \(error)")
        }
        
        do {
            
            let userLikesIDs = try await PostData.fetchRepostsforUID(Uid: uid )
            self.userLikes = try await PostData.fetchPostData(for: userLikesIDs)
        } catch {
            
            
            print("Error fetching user likes: \(error)")
        }
        
        
        
        
    }
}

