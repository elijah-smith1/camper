//
//  Profile.swift
//  OnCampApp
//
//  Created by Michael Washington on 10/12/23.
//

import SwiftUI
import FirebaseFirestore
import Firebase

struct Profile: View {
    
    @EnvironmentObject var userData: UserData
   
    @State private var selectedFilter: ProfileTabFilter = .posts
    @Namespace var animation
    
    
    
    private let user : User
    
    
    init(user: User){
        self.user = user
    }
    
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileTabFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                            ProfileHeaderCell(user: user)
                Spacer()
               
                    VStack {
                        HStack {
                            ForEach(ProfileTabFilter.allCases) { filter in
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .foregroundColor(Color("LTBL"))
                                            .frame(width: filterBarWidth, height: 1)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                        
                                    } else {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: filterBarWidth, height: 1)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedFilter = filter
                                    }
                                }
                            }
                        }
                        LazyVStack {
                           // UserPostsView()
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .padding(.horizontal)
        }
    }
    
//    struct Profile_Previews: PreviewProvider {
//
//        static var previews: some View {
//            Profile()
//                .environmentObject(UserData())
//        }
//    }
