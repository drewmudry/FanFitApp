//
//  UploadView.swift
//  FanFitApp
//
//  Created by Drew on 6/27/23.
//

import SwiftUI

struct UploadView: View {
    @State var selectedIndex: Int = 0
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(hex: 0x363534), Color(hex: 0x282b30)]), startPoint: .top, endPoint: .bottom)
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

                HStack{
                    uploadImagelink
                    uploadVideolink
                }
                .padding()
                Spacer()
            }
        }
    }
    var uploadImagelink: some View {
        NavigationLink(
            destination: UploadPostView(tabIndex: $selectedIndex),
            label: {
                VStack{
                    Image("photo.badge.plus")
                        .resizable()
                        .symbolRenderingMode(.multicolor)
                        .font(.system(size: 1, weight: .light))
                        .scaledToFit()
                        .foregroundColor(.white)
                    Text("Upload Picture")
                        .bold()
                        .foregroundColor(.white)
                        .frame(alignment: .leading)
                }
            })
    }
    
    var uploadVideolink: some View {
        NavigationLink(
            destination: UploadPostView(tabIndex: $selectedIndex),
            label: {
                VStack{
                    ZStack{
                        Image("play.rectangle")
                            .resizable()
                            .symbolRenderingMode(.multicolor)
                            .font(.system(size: 1, weight: .light))
                            .scaledToFit()
                            .foregroundColor(.white)
                            .offset(y:-5)
                        
                        Image("plus.circle.fill")
                            .resizable()
                            .symbolRenderingMode(.multicolor)
                            .frame(width: 70, height:70)
                            .foregroundColor(.green)
                            .offset(x: 59,y:35)
                        
                    }
                    .scaledToFit()
                    
                    Text("Upload Video")
                        .bold()
                        .foregroundColor(.white)
                        .frame(alignment: .center)
                }
            })
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
