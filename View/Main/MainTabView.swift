//
//  MainTabView.swift
//  FanFitApp
//
//  Created by Drew Mudry on 06/26/22.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    @Binding var selectedIndex: Int
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(hex: 0x363534), Color(hex: 0x282b30)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            NavigationView {
                TabView(selection: $selectedIndex) {
                    FeedView()
                        .onTapGesture {
                            selectedIndex = 0
                        }
                        .tabItem {
                            Image(systemName: "house")
                        }.tag(0)
                        .navigationTitle("hello")
                    
                    SearchView()
                        .onTapGesture {
                            selectedIndex = 1
                        }
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                        }.tag(1)
                    
                    
                    
                    NotificationsView()
                        .onTapGesture {
                            selectedIndex = 2
                        }
                        .tabItem {
                            Image(systemName: "heart")
                        }.tag(2)
                    
                    ProfileView(user: user)
                        .onTapGesture {
                            selectedIndex = 3
                        }
                        .tabItem {
                            Image(systemName: "person")
                        }.tag(3)
                }
                .navigationTitle(selectedIndex == 0 ? "" : tabTitle)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading:
                        HStack{
                            selectedIndex == 0 ? uploadPostButton : nil
                            selectedIndex == 0 ? fanfitlogo : nil
                        },
                    trailing: selectedIndex == 0 ? messageLink : nil
                  )
                  
                /*
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        uploadPostButton
                    }
                    ToolbarItem(placement: .principal) {
                        Text("FanFit")
                            .font(.custom("Ubuntu-Title", size: 30))
                            .bold()
                            .foregroundStyle(.linearGradient(colors: [ .orange, .pink, ], startPoint: .leading, endPoint: .trailing))

                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        messageLink
                    }
                    
                }
                */
                .accentColor(.black)
            }
        }
        
    }
    
    var logoutButton: some View {
        Button {
            AuthViewModel.shared.signout()
        } label: {
            Text("Logout").foregroundColor(.black)
        }
    }
    
    var fanfitlogo: some View{
        Text("FanFit")
            .font(.custom("Ubuntu-Title", size: 30))
            .bold()
            .foregroundStyle(.linearGradient(colors: [ .orange, .pink, ], startPoint: .leading, endPoint: .trailing))
    }
    
    var uploadPostButton: some View{
        NavigationLink(
            destination: UploadView(),
            label: {
                Image(systemName: "plus.square")
                    .resizable()
                    .font(.system(size: 20, weight: .light))
                    .scaledToFit()
                    .foregroundColor(.black)
            })
    }
    
    var messageLink: some View {
        NavigationLink(
            destination: ConversationsView(),
            label: {
                Image(systemName: "paperplane")
                    .resizable()
                    .font(.system(size: 20, weight: .light))
                    .scaledToFit()
                    .foregroundColor(.black)
            })
    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Explore"
        case 2: return "Notifications"
        case 3: return "Profile"
        default: return ""
        }
    }
}

