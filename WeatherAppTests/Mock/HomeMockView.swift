//
//  HomeMockView.swift
//  WeatherApp
//
//  Created by Systems on 17/03/2024.
//

import Foundation

class HomeMockView: HomeViewProtocol {

    var presenter: HomePresenterProtocol!

    var isHomeDataCalled = false

    func showActivityIndicator() {
        isHomeDataCalled = true
    }

    func hideActivityIndicator() {
        isHomeDataCalled = true
    }

    func reloadTableView() {
        isHomeDataCalled = true
    }

    var error: String?
    func showError(withMsg: String) {
        error = withMsg
    }
}

