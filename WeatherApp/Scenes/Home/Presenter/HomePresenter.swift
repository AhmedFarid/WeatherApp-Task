//
//  HomePresenter.swift
//  WeatherApp
//
//  Created by Systems on 16/03/2024.
//

import Foundation

class HomePresenter: HomePresenterProtocol {

    weak var view: HomeViewProtocol?
    private let interactor: HomeInteractorInPutProtocol
    private let router: HomeRouterProtocol

    private var homeData: HomeEntity?
    private var forecast: [Forecastday]?

    init(view: HomeViewProtocol, interactor: HomeInteractorInPutProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {

    }

    func getHomeData(lat: String, long: String) {
        let body: [String: Any] = [
            "key": "9a3fe760a6474cb3945125544241603",
            "q": "\(lat),\(long)",
            "days": "7"
        ]
        interactor.getHomeData(body: body)
    }

    func numberOfRows() -> Int {
        return forecast?.count ?? 0
    }

    func configure(homeData cell: HomeCellView) {
        guard let data = homeData else {return}
        cell.configureHomeCell(data: data)
    }

    func configureUpcomingWeatherCell(cell: UpcomingWeatherCellView, at indexPath: IndexPath) {
        guard let data = forecast else {return}
        cell.configureUpcomingWeatherCell(data: data[indexPath.row])
    }
}

extension HomePresenter: HomeInteractorOutPutProtocol {
    func getHomeDataSuccessfully(home: HomeEntity) {
        homeData = home
        forecast = home.forecast?.forecastday ?? []
        view?.reloadTableView()
    }

    func failedToFetchHomeData(stringError error: String) {
        view?.showError(withMsg: error)
    }
}
 
