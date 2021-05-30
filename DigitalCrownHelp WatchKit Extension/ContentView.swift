//
//  ContentView.swift
//  DigitalCrownHelp WatchKit Extension
//
//  Created by Michael S. Muegel on 5/30/21.
//

import SwiftUI

struct ContentView: View {
    @State var crownValue = 0.0
    @Namespace private var namespace

    // My goal is to disable scroll by digital crown and user has to swipe
    // to scoll. So the digital crown will be used exclusively for
    // another feature.
    //
    // This works on program start with below, but once you scroll with
    // vertical drag gesture, the digital crown goes back to scrolling
    // the ScrollView until you touch on text or button to give it focus
    var body: some View {
        ScrollView {
            VStack {
                Button("click me", action: {
                    print("clicked")
                })
                .focusable()
                .prefersDefaultFocus(true, in: namespace)
                Text("The quick brown fox jumps over the lazy dog")
                    .font(.title)
                    .focusable()
            }
            .digitalCrownRotation($crownValue)
            .onChange(of: crownValue) { newValue in
                print("crownValue now \(newValue)!")
            }
        }
        .focusScope(namespace)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
