//
//  ResetPasswordView.swift
//  InstagramSwiftUITutorial
//
//  Created by Stephen Dowless on 12/27/20.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var presentAlert = false
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding private var email: String

    
    init(email: Binding<String>) {
        self._email = email
    }

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(hex: 0x363534), Color(hex: 0x282b30)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            Spacer()
            VStack {
                Spacer().frame(height: 100)
                Text("Let's get you a new password")
                    .foregroundLinearGradient(
                        colors: [.orange, .pink],
                        startPoint: .leading,
                        endPoint: .trailing)
                    .font(.largeTitle.bold())
                    .hAlign(.leading)
                    .padding(.horizontal, 32)
                    .underline()
                                    
                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                }
                
                
                Button(action: {
                    viewModel.resetPassword(withEmail: email)
                    presentAlert.toggle()
                    
                })
                {
                    Text("Send Reset Password Link")
                        .bold()
                        .frame(width: UIScreen.screenWidth-64 , height: 50, alignment: .center)
                }
                .background(.linearGradient(colors: [.orange, .orange, .pink], startPoint: .leading, endPoint: .trailing))
                 .foregroundColor(Color.white)
                 .cornerRadius(10)
                
                
                Spacer()
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }.foregroundColor(.white)
                })
            }
            .padding(.top, -44)
        }
        .alert("A Link has been sent to your email to reset your password.", isPresented: $presentAlert,
               actions: {}) // 4
    }
}
