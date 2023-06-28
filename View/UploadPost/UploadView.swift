//
//  UploadView.swift
//  FanFitApp
//
//  Created by Drew on 6/27/23.
//

import SwiftUI

struct UploadView: View {
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
            VStack{
                Text("Upload a post")
                    .foregroundLinearGradient(
                        colors: [.orange, .pink],
                        startPoint: .leading,
                        endPoint: .trailing)
                    .font(.largeTitle.bold())
                    .hAlign(.leading)
                    .padding(.horizontal, 32)
                    .underline()
            }
            }
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
