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
            backgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            VStack {
                cityName(name: "Cupertino, CA")
                mainStatusSymbol(imageName: "cloud.sun.fill", temperature: 76)
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
                WeatherButton(title: "Change Day Time",
                              textColor: .blue,
                              backgroundColor: .white)
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
    let topColor: Color
    let bottomColor: Color

    var body: some View {
        LinearGradient(
            colors: [
                topColor,
                topColor.opacity(0.75),
                topColor.opacity(0.5),
                bottomColor
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
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
