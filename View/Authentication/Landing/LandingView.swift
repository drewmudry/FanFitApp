//
//  LandingView.swift
//  FanFitApp
//
//  Created by Drew on 6/23/23.
//

import SwiftUI
//import SwiftUIMasonry

struct LandingView: View {
    
    @State var showSignIn : Bool = false
    @State var showRegister : Bool = false
    
    var body: some View {
        
        ZStack{
            //background color
            LinearGradient(gradient: Gradient(colors: [.black, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            //image columns
            LandingImageColumnsView()
            
            //added shadow effect
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]),startPoint: .top,endPoint: .bottom))
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height,
                       alignment: .center)
                .offset(y:-100)
            
            VStack{
                //branding
                LandingPageBrandingView()
                    .padding()
                
                //buttons
                VStack{
                    
                    //sign in button
                    Button(action: {
                        showSignIn.toggle()
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
                        showRegister.toggle()
                    }) {
                        GradientText(title: "Register")
                     
                    }
                    .background(Color(hex: 0xFFFFFF))
                    .cornerRadius(15)
                    
                }//end zstack
                .ignoresSafeArea()
                
                //toggle sign in view
                .fullScreenCover(isPresented: $showSignIn) {
                    LoginView()
                }
                
                //toggle register view
                .fullScreenCover(isPresented: $showRegister) {
                    RegistrationView()
                }
            }
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
