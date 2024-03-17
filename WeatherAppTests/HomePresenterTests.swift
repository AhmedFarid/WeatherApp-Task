//
//  HomePresenterTests.swift
//  WeatherAppTests
//
//  Created by Systems on 17/03/2024.
//

import XCTest
@testable import WeatherApp

class HomePresenterTests: XCTestCase {
    var view = HomeMockView()
    var interactor = HomeInteractorMock()
    var router = HomeRouterMock()
    var presenter: HomePresenter!

    override func setUp() {
        view = HomeMockView()
        interactor = HomeInteractorMock()
        router = HomeRouterMock()
        presenter = HomePresenter(view: view, interactor: interactor, router: router)
    }

    func testGetHomeData() {
        presenter.getHomeData(lat: "31.172996", long: "31.220874")
        if view.isHomeDataCalled {
            XCTFail("GetHomeData func not called")
        }
    }

    func testFailedToFetchHomeData() {
        let error = "No Data"
        presenter.failedToFetchHomeData(stringError: error)
        XCTAssertEqual(view.error, error)
    }

    func testNumberOfRows() {
        XCTAssertEqual(presenter.numberOfRows(), 0)
    }

    override func tearDown() {
        presenter = nil
        super.tearDown()
    }
}
