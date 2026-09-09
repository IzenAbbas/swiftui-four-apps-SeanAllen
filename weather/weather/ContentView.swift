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
            VStack {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                    .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
