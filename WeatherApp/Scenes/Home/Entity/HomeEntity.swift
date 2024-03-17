//
//  HomeEntity.swift
//  WeatherApp
//
//  Created by Systems on 16/03/2024.
//

import Foundation

struct HomeEntity: Codable {
    var location: Location?
    var current: HomeData?
    var forecast: Forecast?
}

struct HomeData: Codable {
    var tempC: Double?
    var tempF: Double?
    var condition: Condition?

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case tempF = "temp_f"
        case condition
    }
}

struct Condition: Codable {
    var text, icon: String?
    var code: Int?
}

struct Location: Codable {
    var name, region, country: String?
    var localtime: String?

    enum CodingKeys: String, CodingKey {
        case name, region, country
        case localtime
    }
}

struct Forecast: Codable {
    var forecastday: [Forecastday]?
}


struct Forecastday: Codable {
    var date: String?
    var day: Day?

    enum CodingKeys: String, CodingKey {
        case date
        case day
    }
}

struct Day: Codable {
    var maxtempC, mintempC: Double?
    var avgtempC: Double?
    var condition: Condition?

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case avgtempC = "avgtemp_c"
        case condition
    }
}

