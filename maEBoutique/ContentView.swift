//
//  ContentView.swift
//  maEBoutique
//
//  Created by Michael Atkinson on 2021-05-13.
//

import SwiftUI
enum AlertSwitchCV {
    case alertCV, alertCV2
}

struct ContentView: View {
    @ObservedObject var articleListener = ArticleListener()
    @State private var showingBasket = false

    @State private var showingAlertCV = false
    
    @State private var activeAlert:AlertSwitchCV = .alertCV
    var categories: [String : [Article]]
    {
        .init(grouping: articleListener.articles,
              by: {$0.category.rawValue})
    }
    var body: some View {
        NavigationView {
            List(categories.keys.sorted(),id: \String.self){
                key in
                ArticleRow(categoryName: "\(key)", articles: self.categories[key]!)
                    .frame(height:320)
                    
                
            }.navigationBarTitle(Text("Boutique"))
                .navigationBarItems(leading:
                                        Button(action: {
                                            activeAlert = .alertCV2
                                            showingAlertCV = true
                    }, label: {
                    Text("Log out")
                }), trailing: Button(action: {
                    //code
                   // print("basket")
                  //  self.showingBasket.toggle()
                    activeAlert = .alertCV
                    showingAlertCV = true
                }, label: {
                    Image("basket")
                }) .sheet(isPresented: $showingBasket)
                {
                   
                    if FUser.currentUser() != nil &&
                        FUser.currentUser()!.onBoarding
                    {
                    OrderBasketView()
                       // self.showingAlertCV2.toggle()
                    }else if FUser.currentUser() != nil
                    {
                        FinishRegistrationView()
                    }else
                    {
                        LoginView()
                    }
                }
                .alert(isPresented: $showingAlertCV){
                    switch activeAlert {
                    case .alertCV :
                    
                   return Alert(title: Text("Are you sure you want proceed to Basket? If you have not been logged in you will be rerouted to the login page, and if your regestration is incomplete you will have to complete it first."),
                          primaryButton:  .destructive(Text("Continue")){
                           self.showingBasket.toggle()
                        
                            showingAlertCV = false

                          },
                          secondaryButton: .destructive(Text("No, Cancel")))
                    case .alertCV2 :
                   return Alert(title: Text("Are you sure you want to log out?"),
                          primaryButton:  .destructive(Text("Continue")){
                            FUser.logOutCurrentUser{(error) in
                                print("error logging out user,",error?.localizedDescription)
                                }
                            showingAlertCV = false

                          },
                          secondaryButton: .destructive(Text("No, Cancel")))
                    }
                    

                }
                
                
              
            )
        }//Fin de navigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


