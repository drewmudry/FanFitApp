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
        NavigationView {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house")
                    }.tag(0)
                
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }.tag(1)
                
                UploadPostView(tabIndex: $selectedIndex)
                //UploadPostView()
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.square")
                    }.tag(2)
                
                NotificationsView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "heart")
                    }.tag(3)
                
                ProfileView(user: user)
                    .onTapGesture {
                        selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "person")
                    }.tag(4)
            }
            .navigationTitle(tabTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: selectedIndex == 0 ? logoutButton : nil,
                trailing: selectedIndex == 0 ? messageLink : nil
            )
            .accentColor(.black)
        }
        
        /*
        ZStack {
            
            NavigationView {
            viewList[selectedIndex]
            }
            
            VStack {
                Spacer()
                ZStack {
                    BottomBar(selectedIndex: $selectedIndex, items: $items)
                        .cornerRadius(20)
                        .shadow(color: Color.darkTextColorMain.opacity(0.1), radius: 10,
                                x: 10,
                                y: 5)
                }.padding(EdgeInsets(top: 0,
                                     leading: 40,
                                     bottom: -10,
                                     trailing: 40))
                
            }
        }
        */
    }
    
    var logoutButton: some View {
        Button {
            AuthViewModel.shared.signout()
        } label: {
            Text("Logout").foregroundColor(.black)
        }
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
        case 2: return "New Post"
        case 3: return "Notifications"
        case 4: return "Profile"
        default: return ""
        }
    }
}

