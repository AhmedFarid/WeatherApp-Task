//
//  UpcomingWeatherCell.swift
//  WeatherApp
//
//  Created by Systems on 16/03/2024.
//

import UIKit

class UpcomingWeatherCell: UITableViewCell {

    lazy var upcomingImage: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .clear
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.kf.indicatorType = .activity
        iv.image = UIImage(named: "116")
        return iv
    }()

    lazy var currentDay: UILabel = {
        var titleLabel = UILabel()
        titleLabel.text = "Sat"
        titleLabel.numberOfLines = 1
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    lazy var minTemp: UILabel = {
        var titleLabel = UILabel()
        titleLabel.text = "10"
        titleLabel.numberOfLines = 1
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    lazy var maxTemp: UILabel = {
        var titleLabel = UILabel()
        titleLabel.text = "12"
        titleLabel.numberOfLines = 1
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    lazy var upcomingWeatherView: UIView = {
        var view = UIView()
        view.backgroundColor = .gray
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var stackHorizontalView: UIStackView = {
        var minMaxTemp = UIStackView()
        minMaxTemp.distribution = .fillProportionally
        minMaxTemp.axis = .horizontal
        minMaxTemp.alignment = .center
        minMaxTemp.spacing = 16
        minMaxTemp.translatesAutoresizingMaskIntoConstraints = false
        return minMaxTemp
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellBehaviors()
        layoutUserInterface()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCellBehaviors() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }

    private func layoutUserInterface() {
        addSubViews()
        setupUpcomingImage()
        setupStackHorizontalView()
        setupUpcomingWeatherView()
        addArrangedViews()
    }

    private func addSubViews() {
        addSubview(currentDay)
        addSubview(minTemp)
        addSubview(upcomingWeatherView)
        addSubview(maxTemp)
        addSubview(upcomingImage)
        addSubview(stackHorizontalView)
    }

    private func addArrangedViews() {
        stackHorizontalView.addArrangedSubview(currentDay)
        stackHorizontalView.addArrangedSubview(upcomingImage)
        stackHorizontalView.addArrangedSubview(maxTemp)
        stackHorizontalView.addArrangedSubview(upcomingWeatherView)
        stackHorizontalView.addArrangedSubview(minTemp)
    }

    private func setupUpcomingImage() {
        NSLayoutConstraint.activate([
            upcomingImage.widthAnchor.constraint(equalToConstant: 40),
            upcomingImage.heightAnchor.constraint(equalToConstant: 40),
            upcomingImage.centerYAnchor.constraint(equalTo: self.stackHorizontalView.centerYAnchor, constant: 0),
        ])
    }

    private func setupUpcomingWeatherView() {
        NSLayoutConstraint.activate([
            upcomingWeatherView.widthAnchor.constraint(equalToConstant: 100),
            upcomingWeatherView.heightAnchor.constraint(equalToConstant: 10),
            upcomingWeatherView.centerYAnchor.constraint(equalTo: self.stackHorizontalView.centerYAnchor, constant: 0)
        ])
    }

    private func setupStackHorizontalView() {
        NSLayoutConstraint.activate([
            stackHorizontalView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            stackHorizontalView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8),
            stackHorizontalView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            stackHorizontalView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 8),
            stackHorizontalView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}

extension UpcomingWeatherCell: UpcomingWeatherCellView {
    func configureUpcomingWeatherCell(data: Forecastday){
        currentDay.text = data.date?.covertToDay()
        minTemp.text = "\(data.day?.mintempC ?? 0.0)"
        maxTemp.text = "\(data.day?.maxtempC ?? 0.0)"
        guard let url = URL(string: "https:\(data.day?.condition?.icon ?? "")") else {return}
        upcomingImage.kf.setImage(with: url)
    }
}

extension String {
    func covertToDay() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        guard let date = dateFormatter.date(from: self) else {
            return nil
        }

        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEEE"

        return dayFormatter.string(from: date)
    }
}
