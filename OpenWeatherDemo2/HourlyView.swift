//
//  HourlyView.swift
//  OpenWeatherDemo2
//
//  Created by John James Retina on 9/10/20.
//
//
import SwiftUI

struct HourlyView: View {
  
  @State var hourly : [Current]

  var body: some View {
    ScrollView(.horizontal){
      HStack{
        ForEach(hourly, id: \.self) { hour in
          VStack{
            if let time = hour.dt{
              Text (hourStringFrom(date: time))
            }
            Image(systemName: "cloud.sun")
//            if let icon = hour.weather{
//              printIcon(icon: icon)
//            }
            if let temperature = hour.temp?.KtoF() {
              Text(String(format: "%.0f ℉", temperature ))
            }
          }.padding()
        }
      }.font(.headline)
    }
  }
  func hourStringFrom(date : Int) -> String {
      let formatter = DateFormatter()
      formatter.setLocalizedDateFormatFromTemplate("hh")
      let dateString = formatter.string(from: date.dateFromUTC())
      return dateString
  }
}


