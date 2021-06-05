//
//  FinishRegistrationView.swift
//  maEBoutique
//
//  Created by Michael Atkinson on 2021-05-31.
//

import SwiftUI
struct FinishRegistrationView: View {
    
    @State var name = ""
    @State var surname = ""
    @State var telephone = ""
    @State var address = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlertFR = false
    
    var body: some View {

        Form {
            Section() {
                
                Text("Finish Registration")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .padding([.top, .bottom], 20)
                
                TextField("Name", text: $name)
                TextField("Surname", text: $surname)
                TextField("Telephone", text: $telephone)
                TextField("Address", text: $address)
                
            } //Fin de Section
            Section() {
                Button(action: {
                    self.showingAlertFR.toggle()
                }, label: {
                    Text("Finish Registration")
                })
            }.disabled(!self.fieldsCompleted())
            //Fin de Section
            
        } //Fin de Form
        .alert(isPresented: $showingAlertFR) {
            Alert(title: Text("Is everything correct?"),
                   primaryButton:  .destructive(Text("Yes,continue.")){
                     FUser.logOutCurrentUser{(error) in
                        let fullName = name + " " + surname
                        updateCurrentUser(withValues: [kFIRSTNAME : name, kLASTNAME : surname, kFULLNAME : fullName, kFULLADDRESS : address, kPHONENUMBER : telephone, kONBOARD :true]) { (error) in
                            
                            if error != nil {
                                print("error updating user: ", error!.localizedDescription)
                                return
                            }
                            
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }
                     }

                   },
                   secondaryButton: .destructive(Text("No, Cancel")))
             }
    }//Fin de Body
    
    private func fieldsCompleted() -> Bool {
        
        return self.name != "" && self.surname != "" && self.telephone != "" && self.address != ""
    }
    private func finishRegistration()
    {
        
        self.showingAlertFR.toggle()
        let fullName = name + " " + surname
        updateCurrentUser(withValues: [kFIRSTNAME : name, kLASTNAME : surname, kFULLNAME : fullName, kFULLADDRESS : address, kPHONENUMBER : telephone, kONBOARD :true]) { (error) in
            
            if error != nil {
                print("error updating user: ", error!.localizedDescription)
                return
            }
            
            self.presentationMode.wrappedValue.dismiss()
            
        }
    }
}

struct FinishRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        FinishRegistrationView()
    }
}



