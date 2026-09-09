//
//  ContentView.swift
//  weather
//
//  Created by Ali Abbas on 09/09/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .white],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
