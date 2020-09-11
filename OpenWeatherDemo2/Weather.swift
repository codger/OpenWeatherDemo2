// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(Weather.self, from: jsonData)

import Foundation

// MARK: - Weather
struct Weather: Codable {
    var lat, lon: Double?
    var timezone: String?
    var timezoneOffset: Int?
    var current: Current?
    var minutely: [Minutely]?
    var hourly: [Current]?
    var daily: [Daily]?

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, minutely, hourly, daily
    }
}

// MARK: - Current
struct Current: Codable {
    var dt, sunrise, sunset: Int?
    var temp, feelsLike: Double?
    var pressure, humidity: Int?
    var dewPoint, uvi: Double?
    var clouds, visibility: Int?
    var windSpeed: Double?
    var windDeg: Int?
    var weather: [WeatherElement]?
    var pop: Int?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather, pop
    }
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    var id: Int?
    var main: Main?
    var weatherDescription: Description?
    var icon: Icon?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum Icon: String, Codable {
    case the01D = "01d"
    case the01N = "01n"
    case the50D = "50d"
}

enum Main: String, Codable {
    case clear = "Clear"
    case haze = "Haze"
    case smoke = "Smoke"
}

enum Description: String, Codable {
    case clearSky = "clear sky"
    case haze = "haze"
    case smoke = "smoke"
}

// MARK: - Daily
struct Daily: Codable {
    var dt, sunrise, sunset: Int?
    var temp: Temp?
    var feelsLike: FeelsLike?
    var pressure, humidity: Int?
    var dewPoint, windSpeed: Double?
    var windDeg: Int?
    var weather: [WeatherElement]?
    var clouds, pop: Int?
    var uvi: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather, clouds, pop, uvi
    }
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    var day, night, eve, morn: Double?
}

// MARK: - Temp
struct Temp: Codable {
    var day, min, max, night: Double?
    var eve, morn: Double?
}

// MARK: - Minutely
struct Minutely: Codable {
    var dt, precipitation: Int?
}
