//
//  ContentView.swift
//  OpenWeatherDemo2
//
//  Created by John James Retina on 9/7/20.
//

import SwiftUI
struct TaskEntry: Codable  {
  let id: Int
  let title: String
}
struct ContentView: View {
  
  @State var weather : Weather?
  init() {
    loadData()
  }
  
  var body: some View {
    VStack{
      Button(action: signIn) {
        Text("Sign In")
      }
      
      if weather?.timezone != nil {
        Text(weather!.timezone)
      } else {
        Text("Nil")
      }
    }
  }
  
  func signIn() {
    print("Pressed")
  }
  
  func loadData(lat : Double = 33.8366,
                lon : Double = -117.9143,
                appID : String = "99d60904ebf668c25c960096c8a6c2a2") {
    let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&appid=\(appID)"
    print(urlString)
    guard let url = URL(string: urlString) else {
      print("Your API end point is Invalid")
      return
    }
    print(url)
    let request = url
    URLSession.shared.dataTask(with: request) { data, response, error in
      if let jsonData = data {
        if let response = try? JSONDecoder().decode(Weather.self, from: jsonData) {
          DispatchQueue.main.async {
            self.weather = response
          }
          return
        }
      }
    }.resume()
  }
}
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
