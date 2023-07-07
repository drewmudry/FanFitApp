//
//  FeedCell.swift
//  InstagramSwiftUITutorial
//
//  Created by Stephen Dowless on 12/26/20.
//

import SwiftUI
import KingfisherSwiftUI

struct FeedCell: View {
    @ObservedObject var viewModel: FeedCellViewModel
    
    
    var didLike: Bool { return viewModel.post.didLike ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                HStack {
                    NavigationLink(destination: UserListView(viewModel: SearchViewModel(config: .likes(viewModel.post.id ?? "")), searchText: .constant(""))) {
                        KFImage(URL(string: viewModel.post.ownerImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 36, height: 36)
                            .clipped()
                            .cornerRadius(18)
                        
                        Text(viewModel.post.ownerUsername)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    
                }
                .padding([.leading, .bottom], 8)
                
                //MARK: if post is premium
                if (viewModel.post.isPremium || viewModel.post.isPaid){
                    KFImage(URL(string: viewModel.post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width:UIScreen.screenWidth-10)
                        .clipped()
                        .blur(radius: 15)
                        .cornerRadius(10)
                        .padding(5)
                }
                
                //MARK: Post is free
                else{
                    KFImage(URL(string: viewModel.post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width:UIScreen.screenWidth-10)
                        .clipped()
                        .cornerRadius(10)
                        .padding(5)
                }
                
                    
                HStack(spacing: 16) {
                    Button(action: {
                        didLike ? viewModel.unlike() : viewModel.like()
                    }, label: {
                        HStack{
                            Image(systemName: didLike ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFill()
                                .foregroundColor(didLike ? .red : .white)
                                .frame(width: 20, height: 20)
                                .font(.system(size: 20))
                                .padding(4)
                            
                            NavigationLink(destination: UserListView(viewModel: SearchViewModel(config: .likes(viewModel.post.id ?? "")), searchText: .constant(""))) {
                                Text(viewModel.likeString)
                                    .font(.system(size: 14, weight: .semibold))
                                    .padding(.leading, 2)
                                    .padding(.trailing, 0.5)
                                    .foregroundColor(.white)
                            }
                        }
                        
                    })
                        
                    NavigationLink(destination: CommentsView(post: viewModel.post)) {
                        Image(systemName: "bubble.right")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20))
                            .padding(4)
                            .foregroundColor(.white)
                    }
                        
                    Button(action: {}, label: {
                        Image(systemName: "paperplane")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20))
                            .padding(4)
                            .foregroundColor(.white)
                    })
                }
                .padding(.leading, 4)
                .foregroundColor(.black)
                    
                    
                HStack {
                    Text(viewModel.post.ownerUsername).font(.system(size: 14, weight: .semibold)).foregroundColor(.white) +
                        Text(" \(viewModel.post.caption)")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 8)
                    
                Text(viewModel.timestampString)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
                    .padding(.top, -2)

                }
            }
        }
    }

