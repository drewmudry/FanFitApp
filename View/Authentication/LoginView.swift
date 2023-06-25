//
//  LoginView.swift
//  InstagramSwiftUITutorial
//
//  Created by Stephen Dowless on 12/27/20.
//

import SwiftUI

struct LoginView: View {
    @State var showResetPassword : Bool = false
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(hex: 0x363534), Color.black]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                        .frame(width: 0, height: 100)
                    Text("Let's sign you in")
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
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                    }
                                        
                    HStack {
                        Spacer()
                        
                        Button {
                            showResetPassword.toggle()
                        } label: {
                            Text("Forgot Password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.orange)
                                .padding(.top)
                                .padding(.trailing, 28)
                        }
                        /*
                        NavigationLink(
                            //destination: ResetPasswordView(email: $email)
                            showResetPassword.toggle(),
                            label: {
                                Text("Forgot Password?")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.orange)
                                    .padding(.top)
                                    .padding(.trailing, 28)
                            })*/
                    }

                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                    }) {
                        Text("SIGN IN")
                            .bold()
                            .frame(width: UIScreen.screenWidth-64 , height: 50, alignment: .center)
                    }
                    .background(.linearGradient(colors: [.orange, .orange, .pink], startPoint: .leading, endPoint: .trailing))
                     .foregroundColor(Color.white)
                     .cornerRadius(10)
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: RegistrationView().navigationBarHidden(true),
                        label: {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.pink)
                            }
                        }).padding(.bottom, 16)
                }
                .padding(.top, -44)
            }
            // MARK: Register View VIA Sheets
            .fullScreenCover(isPresented: $showResetPassword) {
                ResetPasswordView(email: $email)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
