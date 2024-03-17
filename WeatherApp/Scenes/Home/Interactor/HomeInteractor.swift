//
//  HomeInteractor.swift
//  WeatherApp
//
//  Created by Systems on 16/03/2024.
//

import Foundation

class HomeInteractor: BaseAPI<AuthNetworks> {
    var presenter: HomeInteractorOutPutProtocol?
}

extension HomeInteractor: HomeInteractorInPutProtocol {
    func getHomeData(body: [String:Any]) {
        self.fetchData(target: .getHomeData(body: body), responseType: HomeEntity.self) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                if let data = data {
                    presenter?.getHomeDataSuccessfully(home: data)
                }
            case .failure(let error):
                presenter?.failedToFetchHomeData(stringError: error.localizedDescription)
            }

        }
    }
}
 
