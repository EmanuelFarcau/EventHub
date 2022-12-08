//
//  OrganiseEventButton.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 06.12.2022.
//

import SwiftUI

struct OrganiseEventButton: View {
    
    var action:  () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Button(action: {
               action()
        }) {
            VStack(alignment: .leading){
                HStack{
                    VStack{
                        
                        VStack{
                            Text("Nu ai găsit ceva pe placul tău?")
                        }
                        .frame(width: 200)
                        .font(.system(size: 16).bold())
                        .padding(.bottom, 2)
                        VStack{
                            Text("Organizează un eveniment!")
                        }.font(.system(size: 14))
                    }
                    
                    Image("Add")
                    
                }
                .frame(width: 366 , height: 108, alignment: .center)
                //You need to change height & width as per your requirement
            }
            .foregroundColor(Color.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("topGradient"), Color("bottomGradient")]), startPoint: .top, endPoint: .bottom)).cornerRadius(15)
        }
    }
    
}

struct OrganiseEventButton_Previews: PreviewProvider {
    static var previews: some View {
        OrganiseEventButton(){
            
        }
    }
}
