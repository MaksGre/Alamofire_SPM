//
//  NetworkService.swift
//  Alamofire_CocoaPods
//
//  Created by m.grebenozhko on 30.01.2023.
//

import Alamofire

typealias GetImageResponse = (Result<Data, Error>) -> Void

protocol INetworkService: AnyObject {
    func getImage(code: Int, completion: @escaping GetImageResponse)
}

/// Используются ресурс http.cat из статьи https://habr.com/ru/company/macloud/blog/562700/
final class NetworkService: INetworkService {

    func getImage(code: Int, completion: @escaping GetImageResponse) {
        let urlString = R.string.urls.url() + code.description

        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
