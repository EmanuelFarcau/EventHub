//
//  TextButton.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 23.11.2022.
//

import SwiftUI

struct TextButton: View {
    @State private var title: String
    var action:  () -> Void
   
    
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    
    }
    
    var body: some View {
        Button(action: {
              action()
        }) {
            Text(title)
                .foregroundColor(Color.accentColor)
                .font(.system(size: 16))
                
        }
    }
}

struct TextButton_Previews: PreviewProvider {
    static var previews: some View {
        TextButton(title: "Inregistreaza-te") {
            
        }
    }
}
