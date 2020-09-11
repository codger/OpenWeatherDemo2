//
//  DailyView.swift
//  OpenWeatherDemo2
//
//  Created by John James Retina on 9/11/20.
//

import SwiftUI

struct DailyView: View {
  
  @State var daily : [Daily]
  
  
  var body: some View {
    ScrollView(){
        ForEach(daily, id: \.self) { day in
          HStack {
            if let time = day.dt{
               Text (dayOfWeekFrom(date: time))
            }
            Spacer()
            Image(systemName: "cloud.sun")
            Spacer()
            if let temperature = day.temp?.max {
              Text(String(format: "%.0f ℉", temperature.KtoF() ))
            }
            Text("  ")
            if let temperature = day.temp?.min {
              Text(String(format: "%.0f ℉", temperature.KtoF() ))
            }
          }.padding([.leading,.trailing])
          .font(.title)
      }
    }
  }
  func dayOfWeekFrom(date : Int) -> String {
    let formatter = DateFormatter()
    formatter.setLocalizedDateFormatFromTemplate("EEEE")
    let dateString = formatter.string(from: date.dateFromUTC())
    return dateString
  }
}


