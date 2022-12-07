//
//  BackButton.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 07.12.2022.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        Button(action: {
              // action()
        }) {
            Image("back")
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
