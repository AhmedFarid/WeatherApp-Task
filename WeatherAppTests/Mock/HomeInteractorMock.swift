//
//  HomeInteractorMock.swift
//  WeatherApp
//
//  Created by Systems on 17/03/2024.
//

import Foundation

class HomeInteractorMock: HomeInteractorInPutProtocol {
    var presenter: HomeInteractorOutPutProtocol?

    func getHomeData(body: [String:Any]) {
        let location = Location(name: "Talkha", region: "Ad Daqahliyah", country: "Egypt", localtime: "2024-03-17 15:13")
        let homeData = HomeData(tempC: 23.1, tempF: 73.5, condition: Condition(text: "Partly Cloudy", icon: "//cdn.weatherapi.com/weather/64x64/day/116.png", code: 1003))
        let day = Day(maxtempC: 23.1, mintempC: 12.4, avgtempC: 17.2, condition: Condition(text: "Partly Cloudy", icon: "//cdn.weatherapi.com/weather/64x64/day/116.png", code: 1003))
        let forecast = Forecast(forecastday: [Forecastday(date: "2024-03-17", day: day)])
        let homeEntity = HomeEntity(location: location, current: homeData, forecast: forecast)
        presenter?.getHomeDataSuccessfully(home: homeEntity)
    }
}
