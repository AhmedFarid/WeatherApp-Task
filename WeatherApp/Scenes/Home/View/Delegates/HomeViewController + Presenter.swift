//
//  HomeViewController + Presenter.swift
//  WeatherApp
//
//  Created by Systems on 16/03/2024.
//

import UIKit

extension HomeViewController: HomeViewProtocol{
    func showActivityIndicator() {
        print("showActivityIndicator")
    }

    func hideActivityIndicator() {
        print("hideActivityIndicator")
    }

    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.tableView.reloadData()
        }
    }

    func showError(withMsg: String) {
        print(withMsg)
    }
}
