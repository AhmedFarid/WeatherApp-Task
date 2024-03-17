//
//  HomeProtocols.swift
//  WeatherApp
//
//  Created by Systems on 16/03/2024.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol! {get set}
    func showActivityIndicator()
    func hideActivityIndicator()
    func reloadTableView()
    func showError(withMsg: String)
}

protocol HomePresenterProtocol {
    var view: HomeViewProtocol? {get set}
    func viewDidLoad()
    func getHomeData(lat: String, long: String)
    func numberOfRows() -> Int
    func configure(homeData cell: HomeCellView)
    func configureUpcomingWeatherCell(cell: UpcomingWeatherCellView, at indexPath: IndexPath)
}

protocol HomeInteractorInPutProtocol {
    var presenter: HomeInteractorOutPutProtocol? {get set}
    func getHomeData(body: [String:Any])
}

protocol HomeInteractorOutPutProtocol {
    func getHomeDataSuccessfully(home : HomeEntity)
    func failedToFetchHomeData(stringError error: String)
}

protocol HomeCellView {
    func configureHomeCell(data: HomeEntity)
}

protocol UpcomingWeatherCellView {
    func configureUpcomingWeatherCell(data: Forecastday)
}

protocol HomeRouterProtocol {
    func navigateToDetailsView(withHomeData: HomeData)
}
