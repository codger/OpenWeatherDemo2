//
//  WeatherModel.swift
//  OpenWeatherDemo2
//
//  Created by John James Retina on 9/9/20.
//

import SwiftUI
import Combine

final class WeatherViewModel: ObservableObject {
  @Published var weather: Weather?
  private var subscriptions = Set<AnyCancellable>()
  init() {
    guard let url = makeURL() else {
      return
    }
    print(url)
    URLSession
      .shared
      .dataTaskPublisher(for: url)
      .map(\.data)
      .decode(type: Optional<Weather>.self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .catch { error -> AnyPublisher<Weather?, Never> in
        print(error)
        return Just(nil).eraseToAnyPublisher()
      }
      .replaceError(with: nil)
      .assign(to: \.weather, on: self)
      .store(in: &subscriptions)
  }
  private func makeURL(
    lat : Double = 33.8366,
    lon : Double = -117.9143,
    appID : String = "99d60904ebf668c25c960096c8a6c2a2"
  ) -> URL? {
    var components = URLComponents(string: "https://api.openweathermap.org/data/2.5/onecall")
    components?.queryItems = [
      URLQueryItem(name: "lat", value: String(describing: lat)),
      URLQueryItem(name: "lon", value: String(describing: lon)),
      URLQueryItem(name: "appid", value: appID),
    ]
    return components?.url
  }
}

public extension Int {
    func dateFromUTC() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(self))
    }
}
public extension Double {
    func CtoF() -> Double {
      return (self * 9 / 5 + 32)
      //  return Date(timeIntervalSince1970: TimeInterval(self))
    }
  func KtoF() -> Double{
    return (((self - 273.15) * 9 / 5) + 32)
  }
}

extension Current : Equatable, Hashable {
  static func == (lhs: Current, rhs: Current) -> Bool {
        return lhs.dt == rhs.dt
    }

    func hash(into hasher: inout Hasher) {
       var hashValue: Int {
           var hasher = Hasher()
           self.hash(into: &hasher)
           return hasher.finalize()
       }
    }
 }
extension Daily : Equatable, Hashable {
  static func == (lhs: Daily, rhs: Daily) -> Bool {
        return lhs.dt == rhs.dt
    }

    func hash(into hasher: inout Hasher) {
       var hashValue: Int {
           var hasher = Hasher()
           self.hash(into: &hasher)
           return hasher.finalize()
       }
    }
 }
