//
//  DataRequest+Extensioin.swift
//  Alamofire_CocoaPods
//
//  Created by m.grebenozhko on 30.01.2023.
//

import Alamofire

extension DataRequest {

    @discardableResult
    public func responseResult<T: Decodable>(completionHandler: @escaping (Result<T, NetworkError>) -> Void) -> Self {

        response { (response) in
            debugPrint(response)
        }
        return response(queue: .main, completionHandler: { response in
            switch response.result {
            case .success(let data):
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        completionHandler(.success(result))
                    } catch {
                          let error = self.getError(data)
                        completionHandler(.failure(error))
                    }
                }
            case .failure(let error):
                completionHandler(.failure(.afError(error)))
            }
        })
    }

    // MARK: - Private functions

    private func getError(_ data: Data?) -> NetworkError {
        guard let data = data else { return .noData }
        do {
            let response = try JSONDecoder().decode(ServerError.self, from: data)
            return .serverError(response)
        } catch {
            return .decodingError
        }
    }
}

