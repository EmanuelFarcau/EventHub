//
//  DetailedButton.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 09.12.2022.
//

import SwiftUI

struct DetailedButton: View {
    
    
    
    
    var body: some View {
        Section{
            HStack{
                Image ("PurpleCalendar")
                    .frame(width: 56, height: 56)
                    .padding(.bottom, 40)
                VStack(alignment: .leading){
                    Text("Data 6 Octombrie 2023")
                        .font(.system(size: 16).bold())
                    Text("Ora 17:00")
                        .font(.system(size: 16))
                        .padding(.bottom, 6)
                    ActionPurpleButton(icon: "calendar", title: "Adaugă în calendar", width: 200){
                        //
                    }
                }
                .padding(.leading)
            }
        }.padding(.leading)
    }
}

struct DetailedButton_Previews: PreviewProvider {
    static var previews: some View {
        DetailedButton()
    }
}
