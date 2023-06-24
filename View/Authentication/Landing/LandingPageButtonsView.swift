//
//  LandingViewButtons.swift
//  FanFitApp
//
//  Created by Drew on 6/12/23.
//

import SwiftUI

struct GradientText: View {
    let title: String
    let colors = Gradient(colors: [.orange, .pink])
    
    var body: some View {
        LinearGradient(gradient: colors, startPoint: .leading, endPoint: .trailing)
            .frame(width: 200 , height: 50, alignment: .center)
            .mask(Text("Register")
                .bold()
                .font(.system(size: 18))
        )
    }
}

struct LandingPageButtonsView: View {
    var body: some View {
        VStack{
            
            //sign in button
            Button(action: {
                   //toggle sign in view
            }) {
                Text("SIGN IN")
                    .bold()
                    .frame(width: 200 , height: 50, alignment: .center)
            }
            .background(.linearGradient(colors: [.orange, .orange, .pink], startPoint: .leading, endPoint: .trailing))
             .foregroundColor(Color.white)
             .cornerRadius(15)
            
            
            //register view
            Button(action: {
                   //toggle register view
            }) {
                GradientText(title: "Register")
             
            }
            .background(Color(hex: 0x363534))
            .cornerRadius(15)
            
        }
    }
}

struct LandingPageButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageButtonsView()
    }
}
