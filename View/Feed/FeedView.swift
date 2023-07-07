//
//  FeedView.swift
//  InstagramSwiftUITutorial
//
//  Created by Stephen Dowless on 12/26/20.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ScrollView {
            ZStack{
                //Color(hex: 0x363534)
                Color(hex: 0x282b30)
                //Color.purple
                    .ignoresSafeArea()
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(viewModel: FeedCellViewModel(post: post))
                    }
                }.padding(.top)
            }

        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
