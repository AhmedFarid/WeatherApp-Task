//
//  HomeCell.swift
//  WeatherApp
//
//  Created by Systems on 16/03/2024.
//

import UIKit
import Kingfisher

class HomeCell: UITableViewCell {

    lazy var homeImage: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .gray
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.kf.indicatorType = .activity
        iv.image = UIImage(named: "116")
        return iv
    }()

    lazy var currentTemp: UILabel = {
        var titleLabel = UILabel()
        titleLabel.text = "20"
        titleLabel.numberOfLines = 1
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    lazy var currentCountryName: UILabel = {
        var countryLabel = UILabel()
        countryLabel.text = "Egypt"
        countryLabel.textColor = .black
        countryLabel.font = UIFont.systemFont(ofSize: 12)
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        return countryLabel
    }()

    lazy var currentCityName: UILabel = {
        var cityLabel = UILabel()
        cityLabel.text = "Cairo"
        cityLabel.textColor = .black
        cityLabel.font = UIFont.systemFont(ofSize: 12)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        return cityLabel
    }()

    lazy var currentRegionName: UILabel = {
        var regionLabel = UILabel()
        regionLabel.text = "Giza"
        regionLabel.textColor = .black
        regionLabel.font = UIFont.systemFont(ofSize: 12)
        regionLabel.translatesAutoresizingMaskIntoConstraints = false
        return regionLabel
    }()

    lazy var stackHorizontalView: UIStackView = {
        var currentAddressStack = UIStackView()
        currentAddressStack.distribution = .fill
        currentAddressStack.axis = .horizontal
        currentAddressStack.alignment = .fill
        currentAddressStack.spacing = 8
        currentAddressStack.translatesAutoresizingMaskIntoConstraints = false
        return currentAddressStack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellBehaviors()
        layoutUserInterface()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUserInterface() {
        addSubViews()
        setupHomeImage()
        setupCurrentTempLabel()
        setupStackView()
        addArrangedViews()
    }

    private func addSubViews() {
        addSubview(homeImage)
        addSubview(currentTemp)
        addSubview(stackHorizontalView)
    }

    private func setupCellBehaviors() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }

    private func addArrangedViews() {
        stackHorizontalView.addArrangedSubview(currentCountryName)
        stackHorizontalView.addArrangedSubview(currentCityName)
        stackHorizontalView.addArrangedSubview(currentRegionName)
    }

    private func setupHomeImage() {
        NSLayoutConstraint.activate([
            homeImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            homeImage.heightAnchor.constraint(equalToConstant: 128),
            homeImage.widthAnchor.constraint(equalToConstant: 128),
            homeImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        ])
    }

    private func setupCurrentTempLabel() {
        NSLayoutConstraint.activate([
            currentTemp.topAnchor.constraint(equalTo: self.homeImage.bottomAnchor, constant: 0),
            currentTemp.centerXAnchor.constraint(equalTo: self.homeImage.centerXAnchor, constant: 0),
        ])
    }

    private func setupStackView() {
        NSLayoutConstraint.activate([
            stackHorizontalView.topAnchor.constraint(equalTo: self.currentTemp.bottomAnchor, constant: 0),
            stackHorizontalView.centerXAnchor.constraint(equalTo: self.homeImage.centerXAnchor, constant: 0),
            stackHorizontalView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
}

extension HomeCell: HomeCellView {
    func configureHomeCell(data: HomeEntity) {
        currentCountryName.text = data.location?.country
        currentCityName.text = data.location?.name
        currentRegionName.text = data.location?.region
        currentTemp.text = "\(data.current?.tempC ?? 0) - \(data.current?.condition?.text ?? "")"
        guard let url = URL(string: "https:\(data.current?.condition?.icon ?? "")") else {return}
        homeImage.kf.setImage(with: url)
    }
}
