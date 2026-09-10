//
//  ContentView.swift
//  weather
//
//  Created by Ali Abbas on 09/09/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false

    var body: some View {
        ZStack {
            backgroundView(isNight: isNight)
            VStack {
                cityName(name: "Cupertino, CA")
                mainStatusSymbol(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                HStack(spacing: 20) {
                    WeatherDayView(dayofWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    WeatherDayView(dayofWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    WeatherDayView(dayofWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    WeatherDayView(dayofWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 60)
                    WeatherDayView(dayofWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 25)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .white,
                                  backgroundColor: .purple.opacity(0.8))
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    let dayofWeek: String
    let imageName: String
    let temperature: Int

    var body: some View {
        VStack {
            Text(dayofWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .symbolRenderingMode(.multicolor)
                .foregroundStyle(.white)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct backgroundView: View {
    var isNight: Bool

    var body: some View {
//        LinearGradient(
//            colors: [
//                isNight ? .black : .blue,
//                isNight ? .black.opacity(0.75) : .blue.opacity(0.75),
//                isNight ? .black.opacity(0.5) : .blue.opacity(0.5),
//                isNight ? .gray : Color("lightBlue")
//            ],
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing
//        )
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill((isNight ? Color.black : Color.blue).gradient)
            .ignoresSafeArea()
    }
}

struct cityName: View {
    let name: String
    var body: some View {
        Text(name)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct mainStatusSymbol: View {
    let imageName: String
    let temperature: Int

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}
