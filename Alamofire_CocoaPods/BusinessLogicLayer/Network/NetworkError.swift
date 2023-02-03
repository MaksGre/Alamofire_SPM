//
//  NetworkError.swift
//  Alamofire_CocoaPods
//
//  Created by m.grebenozhko on 30.01.2023.
//

import Alamofire

public enum NetworkError: LocalizedError {
    case afError(AFError)
    case requestError(NSError)
    case noData
    case unknownError
    case tooOften
    case serverError(ServerError)
    case needUserData
    case decodingError

    public var errorDescription: String? {
        switch self {
        case .afError(let error):
            if let underlyingError = error.underlyingError,
               let urlError = underlyingError as? URLError {
                switch urlError.code {
                case .notConnectedToInternet, .dataNotAllowed:
                    return NSLocalizedString(Constants.Errors.errorNoInet, comment: "")
                default: break
                }
            }
            return NSLocalizedString(error.localizedDescription, comment: "")
        case .requestError(let error):
            let localizedDescription = (error as NSError).code == -1009 ?
            Constants.Errors.errorNoInet : error.localizedDescription
            return NSLocalizedString(localizedDescription, comment: "")
        case .noData:
            return NSLocalizedString(Constants.Errors.errorNoData, comment: "")
        case .unknownError:
            return NSLocalizedString(Constants.Errors.errorUnknown, comment: "")
        case .tooOften:
            return NSLocalizedString(Constants.Errors.errorTooOften, comment: "")
        case .serverError(let error):
            return NSLocalizedString(error.error.uppercased(), comment: "")
        case .needUserData:
            return NSLocalizedString(Constants.Errors.needUserData, comment: "")
        case .decodingError:
            return NSLocalizedString(Constants.Errors.decodingError, comment: "")
        }
    }
}

extension NetworkError: Equatable {

    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        lhs.errorDescription == rhs.errorDescription
    }
}
