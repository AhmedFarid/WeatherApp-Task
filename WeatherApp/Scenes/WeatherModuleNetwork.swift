//
//  WeatherModuleNetwork.swift
//  WeatherApp
//
//  Created by Systems on 16/03/2024.
//

import Foundation
import Alamofire

enum AuthNetworks{
    case getHomeData(body: [String: Any])
}

extension AuthNetworks: TargetType {
    var baseUrl: String {
        switch self {
        case .getHomeData:
            return Constants.currentEndpoint
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getHomeData:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getHomeData(let body):
            return .requestParameters(parameters: body, encoding: URLEncoding.default)
        }
    }

    var headers: Alamofire.HTTPHeaders? {
        switch self {
        default :
            return [:]
        }
    }
}
