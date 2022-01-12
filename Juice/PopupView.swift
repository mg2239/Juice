//
//  PopupView.swift
//  Juice
//
//  Created by Matthew Guo on 1/11/22.
//

import SwiftUI

struct HeaderView: View {
    func handleSettings() {
        print("Hello")
    }
    
    func handleQuit() {
        AppDelegate.quit()
    }
    
    var body: some View {
        HStack {
            Text("Juice 🧃").fontWeight(.bold)
            Spacer().frame(maxWidth: .infinity)
            Button("Settings", action: handleSettings).buttonStyle(PlainButtonStyle())
            Button("Quit", action: handleQuit).buttonStyle(PlainButtonStyle())
        }
    }
}

struct PopupView: View {
    var body: some View {
        VStack {
            HeaderView()
            Divider()
        }.padding().frame(width: 250, height: 400, alignment: .topLeading)
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView()
    }
}
