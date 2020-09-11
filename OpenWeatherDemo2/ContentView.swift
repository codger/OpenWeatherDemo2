//
//  ContentView.swift
//  OpenWeatherDemo2
//
//  Created by John James Retina on 9/7/20.
//

import SwiftUI


struct ContentView: View {
  
  @StateObject var viewModel = WeatherViewModel()
  var hours = ["one", "two", "three"]
  var body: some View {
    ZStack{
      Color.blue
        .ignoresSafeArea()
      VStack{
        if let weather = viewModel.weather?.timezone {
          Text(String(describing: weather))
            .font(.title)
            .padding()
        } else {
          Text("Loading...")
        }
        if let description = viewModel.weather?.current?.weather?.first?.weatherDescription {
          Text( String(describing: description))
        } else {
          Text("No Description")
        }
        if let temperature = viewModel.weather?.current?.temp {
          let f = temperature.KtoF()
          Text(String(format: "%.0f ℉", f ))
            .font(.largeTitle)
            .scaleEffect(3)
            .padding()
        }
        if let hourly = viewModel.weather?.hourly {
          HStack{
            HourlyView(hourly: hourly)
          }
        }
        if let daily = viewModel.weather?.daily {
            DailyView(daily: daily)
        }
        Spacer()
      }.foregroundColor(.white)
    }
  }
  
  func signIn() {
    print("Pressed")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
