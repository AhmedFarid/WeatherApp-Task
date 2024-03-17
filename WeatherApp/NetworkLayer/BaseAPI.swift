//
//  BaseAPI.swift
//  WeatherApp
//
//  Created by Systems on 16/03/2024.
//
import Foundation
import Alamofire

class BaseAPI<T: TargetType> {
    func fetchData<M: Codable> (target: T, responseType: M.Type?, completion: @escaping(Result<M?, NSError>) -> Void) {
        let baseURL = target.baseUrl
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let parameters = buildParams(task: target.task)
        let headers = target.headers ?? [:]

        print(baseURL)
        print(parameters)
        AF.request(baseURL, method: method, parameters: parameters.0, encoding: parameters.1, headers: headers).responseDecodable(of: M.self) { response in
            print(response)
            guard let statusCode = response.response?.statusCode else {
                let error = NSError(domain: target.baseUrl, code: 2, userInfo: [:])
                completion(.failure(error))
                return
            }
            if statusCode == 200 {
                guard let jsonData = response.data else {
                    let error = NSError(domain: target.baseUrl, code: 0, userInfo: [NSLocalizedDescriptionKey: "\("Error") (\(statusCode))"])
                    completion(.failure(error))
                    return
                }
                do {
                    guard let responseType = responseType else {
                        completion(.success(nil))
                        return
                    }
                    let responseObject = try JSONDecoder().decode(responseType, from: jsonData)
                    completion(.success(responseObject))
                }
                catch {
                    let error = NSError(domain: target.baseUrl, code: 1, userInfo: [NSLocalizedDescriptionKey: "\("Error") (\(statusCode))"])
                    completion(.failure(error as NSError))
                }
            } else {
                let error = NSError(domain: target.baseUrl, code: statusCode, userInfo: [NSLocalizedDescriptionKey: "\("Error") (\(statusCode))"])
                completion(.failure(error))
                return
            }
        }
    }

    private func buildParams(task: Task) -> ([String:Any], ParameterEncoding) {
        switch task {
        case .plainRequest:
            return ([:], URLEncoding.default)
        case .requestParameters(let parameters, let encoding):
            return (parameters,encoding)
        }
    }
}

