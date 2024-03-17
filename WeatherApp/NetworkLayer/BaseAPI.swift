//
//  NetworkLayer.swift
//  WeatherApp
//
//  Created by Systems on 16/03/2024.
//

import Foundation
import Alamofire

enum Result<T> {
  case success(T)
  case failure(Error)
}

class NetworkLayer {
  func request<T: Codable>(_ request: URLRequestConvertible, decodeToType type: T.Type, completionHandler: @escaping (Result<T>) -> ()) {
    AF.request(request).response { response in
      switch response.result {
      case .success(let data):
        do {
          guard let data = data else { return }
          let decoded = try JSONDecoder().decode(T.self, from: data)
          completionHandler(.success(decoded))
        } catch {
          completionHandler(.failure(error))
        }
      case .failure(let error):
        completionHandler(.failure(error))
      }
    }
  }
}
