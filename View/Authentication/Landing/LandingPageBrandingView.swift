//
//  LandingPageBrandingView.swift
//  FanFitApp
//
//  Created by Drew on 6/12/23.
//

import SwiftUI


struct LandingPageBrandingView: View {
    var body: some View {
        VStack{
            //logo
            Image(systemName: "star.fill")
                .font(.system(size: 60))
                .foregroundStyle(.linearGradient(colors: [  .orange, .pink,], startPoint: .leading, endPoint: .trailing))
            
            //branding
            Text("FanFit")
                .font(.system(size: 45))
                .bold()
                .foregroundStyle(.linearGradient(colors: [ .orange, .pink, ], startPoint: .leading, endPoint: .trailing))
            
            //description
            Text("Get exclusive content from your favorite creators. ")
                .font(.system(size: 20))
                .bold()
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .offset(y: 20)
        }
    }
}

struct LandingPageBrandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageBrandingView()
    }
}
