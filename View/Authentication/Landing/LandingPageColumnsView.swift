//
//  LandingImageColumnsView.swift
//  FanFitApp
//
//  Created by Drew on 6/12/23.
//

import SwiftUI

struct LandingImageColumnsView: View {
    var body: some View {
        HStack{
            //column 1
            VStack{
                Image("loadingscreenimg10_v")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width/3-12)
                    .frame(height: 150)
                    .cornerRadius(10)
                
                Image("loadingscreenimg1_h")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width/3-12)
                    .frame(height: 75)
                    .cornerRadius(10)
                
                Image("loadingscreenimg14_v")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width/3-12)
                    .frame(height: 150)
                    .cornerRadius(10)
                
                Image("loadingscreenimg8_v")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width/3-12)
                    .frame(height: 150)
                    .cornerRadius(10)
                
                //end column 1
            }
            .offset(y:-20)
            
            VStack{
                //column 2
                Image("loadingscreenimg2_h")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width/3-12)
                    .frame(height: 75)
                    .cornerRadius(10)
                
                Image("loadingscreenimg3_h")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width/3-12)
                    .frame(height: 75)
                    .cornerRadius(10)
                
                Image("loadingscreenimg11_v")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width/3-12)
                    .frame(height: 150)
                    .cornerRadius(10)
                
                Image("loadingscreenimg4_h")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width/3-12)
                    .frame(height: 75)
                    .cornerRadius(10)
                
                Image("loadingscreenimg5_h")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width/3-12)
                    .frame(height: 75)
                    .cornerRadius(10)
                
                Image("loadingscreenimg6_h")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width/3-12)
                    .frame(height: 75)
                    .cornerRadius(10)
                //end column 2
            }
            
            //column 3
            VStack{
                Image("loadingscreenimg12_v")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width/3-12)
                    .frame(height: 150)
                    .cornerRadius(10)
                
                Image("loadingscreenimg1_h")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width/3-12)
                    .frame(height: 75)
                    .cornerRadius(10)
                
                Image("loadingscreenimg13_v")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width/3-12)
                    .frame(height: 150)
                    .cornerRadius(10)
                
                Image("loadingscreenimg9_v")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width/3-12)
                    .frame(height: 150)
                    .cornerRadius(10)
                //end column 3
            }
            .offset(y:-20)
        }.offset(y:-100)
    }
}

struct LandingImageColumnsView_Previews: PreviewProvider {
    static var previews: some View {
        LandingImageColumnsView()
    }
}
