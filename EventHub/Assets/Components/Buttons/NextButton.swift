//
//  NextButton.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 09.12.2022.
//

import SwiftUI

struct NextButton: View {
    var action:  () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Button(action: {
               action()
        }) {
            Image("Next")
        }
    }
}

struct NextButton_Previews: PreviewProvider {
    static var previews: some View {
        NextButton(){}
    }
}
