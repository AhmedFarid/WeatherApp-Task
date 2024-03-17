//
//  HomeRouter.swift
//  WeatherApp
//
//  Created by Systems on 16/03/2024.
//
import UIKit

class HomeRouter {
  weak var viewController: UIViewController?

  static func createAnModule() -> UIViewController {
      let interactor = HomeInteractor()
      let router = HomeRouter()
      let view = HomeViewController()
      let presenter = HomePresenter(view: view, interactor: interactor, router: router)
      view.presenter = presenter
      interactor.presenter = presenter
      router.viewController = view
      return view
  }


}

extension HomeRouter: HomeRouterProtocol {
    func navigateToDetailsView(withHomeData: HomeData) {

    }
}
