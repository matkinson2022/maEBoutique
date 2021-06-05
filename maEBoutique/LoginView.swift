//
//  LoginView.swift
//  maEBoutique
//
//  Created by Michael Atkinson on 2021-05-31.
//
enum AlertSwitch {
    case alertLI1, alertLI2 , alertLI3 , alertLI4 , alertLI5 , alertLI6 , alertLI7 , alertLI8 , alertLI9
}
import SwiftUI
struct LoginView: View {
    @State var showingSignup = false // pour alterner entre sign in et sign up
    @State var email = ""
    @State var password = ""
    @State var repeatPassword = ""
    @State var showingFinishReg = false
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlertLI = false
 
    
    @State private var activeAlert:AlertSwitch = .alertLI1
    
    
    
    var body: some View {
        VStack {
            if  showingSignup {
                Text("Sign Up")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .padding([.bottom, .top], 20)
            }else {
                Text("Sign In")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .padding([.bottom, .top], 20)
            }
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                    TextField("Enter your email", text: $email)
                    Divider()
                    Text("Password")
                        .font(.headline)
                        .fontWeight(.light)
                        .foregroundColor(Color.init(.label))
                        .opacity(0.75)
                    
                    SecureField("Enter your password", text: $password)
                    Divider()
                    
                    if showingSignup {
                        Text("Repeat Password")
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color.init(.label))
                            .opacity(0.75)
                        
                        SecureField("Repeat password", text: $repeatPassword)
                        Divider()
                    }
                }
                .padding(.bottom, 15)
                .animation(.easeOut(duration: 0.1))
                //Fin du VStack
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        self.resetPassword()
                    }, label: {
                        Text("Forgot Password?")
                            .foregroundColor(Color.gray.opacity(0.5))
                    })
                }//Fin du HStack
                
            } .padding(.horizontal, 6)
            //Fin du VStack
            Button(action: {

                self.showingSignup ? self.signUpUser() : self.loginUser()
            }, label: {
                Text(showingSignup ? "Sign Up" : "Sign In")
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 120)
                    .padding()
            }) //Fin du  Button
                .background(Color.blue)
                .clipShape(Capsule())
                .padding(.top, 45)
            
            SignUpView(showingSignup: $showingSignup)
    
        }//Fin du VStack
        .sheet(isPresented: $showingFinishReg)
        {
            FinishRegistrationView()
        }
        .alert(isPresented: $showingAlertLI) { () -> Alert in
            switch activeAlert {
 
            case .alertLI1:
                return Alert(title: Text("error loging in the user, verify your username and password are correct and belong to an existing account. "),
                              dismissButton:  .destructive(Text("Ok")){
                                self.showingAlertLI = false
                              })
            case .alertLI2:
                return Alert(title: Text("error registering in the user, make sure your password is of sufficient length. "),
                      dismissButton:  .destructive(Text("Ok")){
                        self.showingAlertLI = false
                      })
            case .alertLI3:
                return  Alert(title: Text("User has been created. and verify your account, and then log into your account via the login menu. "),
                      dismissButton:  .destructive(Text("Ok")){
                        
                        self.showingAlertLI = false
                      })
            case .alertLI4:
                return  Alert(title: Text("passwords dont match"),
                              dismissButton:  .destructive(Text("Ok")){
                                self.showingAlertLI = false
                              })
            case .alertLI5:
                return  Alert(title: Text("Email and password must be set"),
                      dismissButton:  .destructive(Text("Ok")){
                        self.showingAlertLI = false
                      })
            case .alertLI6:
                return  Alert(title: Text("error sending reset password"),
                        dismissButton:  .destructive(Text("Ok")){
                            self.showingAlertLI = false
                          })
            case .alertLI7:
                return  Alert(title: Text("Please check your email"),
                        dismissButton:  .destructive(Text("Ok")){
                            self.showingAlertLI = false
                          })
            case .alertLI8:
                return Alert(title: Text("email is empty"),
                        dismissButton:  .destructive(Text("Ok")){
                            self.showingAlertLI = false
                          })
            case .alertLI9:
                return  Alert(title: Text("Login succesfull, you may now proceed."),
                      dismissButton:  .destructive(Text("Ok")){
                        self.showingAlertLI = false
                       
                      })
            }
        }
        
       
    }//Fin du body

    private func loginUser()
    {// à compléter
        if email != "" && password != "" {
                    FUser.loginUserWith(email: email, password: password) { (error, isEmailVerified) in
                        
                        if error != nil {
                            
                           // print("error loging in the user: ", error!.localizedDescription)
                            activeAlert = .alertLI1
                            showingAlertLI = true

                            return
                        }
                        if FUser.currentUser() != nil && FUser.currentUser()!.onBoarding {
                            self.presentationMode.wrappedValue.dismiss() // fermer la fenêtre qui est en mode présentation
                            activeAlert = .alertLI9
                            showingAlertLI = true

                        } else {
                            
                            activeAlert = .alertLI9
                            showingAlertLI = true

                        }
                    }
                }
    }
    private func signUpUser()
    {
        if email != "" && password != "" && repeatPassword != "" {
            if password == repeatPassword {
              
                FUser.registerUserWith(email: email, password: password) { (error) in
                    
                    if error != nil {
                        print("Error registering user: ", error!.localizedDescription)
                      
                            activeAlert = .alertLI2
                            showingAlertLI = true
                        return
                    }
                    if error == nil {
                        print("user has been created")
                        //retourner à l'application
                        //vérifier si onBoard a été fait
                        activeAlert = .alertLI3
                        showingAlertLI = true
                    }
                   
                }

                
            } else {
                print("passwords dont match")
                activeAlert = .alertLI4
                showingAlertLI = true

            }
            
            
        } else {
            print("Email and password must be set")
            activeAlert = .alertLI5
            showingAlertLI = true

        }
        
        
    }
    private func resetPassword()
    {
        if email != ""
        {
            FUser.resetPassword(email: email)
            {(error) in
                if error != nil
                {
                    print("error sending reset password,",error!.localizedDescription)
                    activeAlert = .alertLI6
                    showingAlertLI = true

                    return
                }
                print ("Please check your email")
                activeAlert = .alertLI7
                showingAlertLI = true

            }
        }
        else
        {
            print("email is empty")
            activeAlert = .alertLI8
            showingAlertLI = true

        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct SignUpView : View {
    @Binding var showingSignup: Bool
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 8) {
                if  showingSignup {
                    Text("Do have an Account?")
                        .foregroundColor(Color.gray.opacity(0.5))
                }else {
                    Text("Don't have an Account?")
                        .foregroundColor(Color.gray.opacity(0.5))
                }
                Button(action: {
                    self.showingSignup.toggle()
                }, label: {
                    if  showingSignup {
                        Text("Sign In")
                    }else {
                        Text("Sign Up")
                    }
                    
                })
                    .foregroundColor(.blue)
            }//Fin de HStack
                .padding(.top, 25)
        } //Fin de VStack
    }
}
