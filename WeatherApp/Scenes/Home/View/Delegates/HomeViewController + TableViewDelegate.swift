//
//  HomeViewController + TableViewDelegate.swift
//  WeatherApp
//
//  Created by Systems on 16/03/2024.
//

import UIKit

extension HomeViewController {

    func registerTableViewCells() {
        self.tableView.register(HomeCell.self, forCellReuseIdentifier: NSStringFromClass(HomeCell.self))
        self.tableView.register(UpcomingWeatherCell.self, forCellReuseIdentifier: NSStringFromClass(UpcomingWeatherCell.self))
        self.tableView.rowHeight = UITableView.automaticDimension
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return presenter.numberOfRows()
        }

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HomeCell.self), for: indexPath) as? HomeCell {
                presenter.configure(homeData: cell)
                return cell
            } else {
                return HomeCell()
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UpcomingWeatherCell.self), for: indexPath) as? UpcomingWeatherCell {
                presenter.configureUpcomingWeatherCell(cell: cell, at: indexPath)
                return cell
            } else {
                return UpcomingWeatherCell()
            }
        }
    }
}

