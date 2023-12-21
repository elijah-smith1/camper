//
//  tabBar.swift
//  letsgetrich
//
//  Created by Michael Washington on 9/13/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
struct tabBar: View {
    
    @State private var selectedtab = 4
    @StateObject var Tabviewmodel = tabViewModel()
    @StateObject var feedviewmodel = feedViewModel()
   
    var body: some View {
        if let user = Tabviewmodel.userData.currentUser {
            TabView(selection: $selectedtab) {
                Feed()
                    .tabItem {
                        Image(systemName: selectedtab == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedtab == 0 ? .fill : .none)
                    }
                    .onAppear {selectedtab = 0}
                    .tag(0)
                
                Social()
                    .tabItem {
                        Image(systemName: selectedtab == 1 ? "trophy.fill" : "trophy")
                            .environment(\.symbolVariants, selectedtab == 1 ? .fill : .none)
                    }
                    .onAppear {selectedtab = 1}
                    .tag(1)
                Marketplace()
                    .tabItem {
                        Image(systemName: selectedtab == 2 ? "bag.fill" : "bag")
                            .environment(\.symbolVariants, selectedtab == 2 ? .fill : .none)
                    }
                    .onAppear {selectedtab = 2
                        
                    }
                    .tag(2)
                CreatePost()
                    .tabItem {
                        Image(systemName: selectedtab == 3 ? "plus.bubble.fill" : "plus.bubble")
                            .environment(\.symbolVariants, selectedtab == 3 ? .fill : .none)
                    }
                    .onAppear {selectedtab = 3}
                    .tag(3)
                Profile(user: user)
                    .tabItem {
                        Image(systemName: selectedtab == 4 ? "person.circle.fill" : "person.circle")
                            .environment(\.symbolVariants, selectedtab == 4 ? .fill : .none)
                    }
                    .onAppear {selectedtab = 4}
                    .tag(4)
            }.onAppear {
                if Tabviewmodel.userData.currentUser == nil {
                    Tabviewmodel.fetchCurrentUserIfNeeded()
                }
            }
            .navigationBarBackButtonHidden()
        }
        
        
    }
}
struct tabBar_Previews: PreviewProvider {
  
    static var previews: some View {
        tabBar()
            .environmentObject(UserData())

    }
}
